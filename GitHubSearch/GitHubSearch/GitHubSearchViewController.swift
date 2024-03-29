//
//  GitHubSearchViewController.swift
//  GitHubSearch
//
//  Created by Running Raccoon on 2020/12/30.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import ReactorKit
import SafariServices

class GitHubSearchViewController: UIViewController, StoryboardView {
    
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var table: UITableView!
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.verticalScrollIndicatorInsets.top = table.contentInset.top
        searchController.dimsBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.setAnimationsEnabled(false)
        searchController.isActive = true
        searchController.isActive = false
        UIView.setAnimationsEnabled(true)
    }
    
    func bind(reactor: GitHubSearchViewReactor) {
        
        // Action
        
        searchController.searchBar.rx.text
            .throttle(.milliseconds(300), scheduler: MainScheduler.instance)
            .map { Reactor.Action.updateQuery($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        table.rx.contentOffset
            .filter { [weak self] offset in
                guard let `self` = self else { return false }
                print("content offset check: \(offset), \(offset.y + self.table.frame.height), \(self.table.contentSize.height - 100)")
                guard self.table.frame.height > 0 else { return false }
                return offset.y + self.table.frame.height >= self.table.contentSize.height - 100
            }
            .map { _ in Reactor.Action.loadNextPage }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // State
        
        reactor.state.map { $0.repos }
            .bind(to: table.rx.items(cellIdentifier: "cell")) {
                indexPath, repoName, cell in
                cell.textLabel?.text = repoName
            }
            .disposed(by: disposeBag)
        
        // Table
        
        table.rx.itemSelected
            .subscribe(onNext: { [weak self, weak reactor] indexPath in
                guard let `self` = self else { return }
                self.view.endEditing(true)
                self.table.deselectRow(at: indexPath, animated: false)
                guard let repo = reactor?.currentState.repos[indexPath.row] else { return }
                guard let url = URL(string: "https://github.com/\(repo)") else { return }
                let viewController = SFSafariViewController(url: url)
                self.searchController.present(viewController, animated: true, completion: nil)
            })
            .disposed(by: disposeBag)
    }
}
