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
        navigationItem.searchController = searchController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
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
    }
}
