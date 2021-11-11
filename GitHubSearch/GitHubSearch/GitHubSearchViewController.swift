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
        
        navigationItem.searchController = searchController
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    func bind(reactor: GitHubSearchViewReactor) {
        
        // Action
        
        searchController.searchBar.rx.text
            .throttle(.milliseconds(100), scheduler: MainScheduler.instance)
            .map { Reactor.Action.updateQuery($0) }
            .bind(to: reactor.action)
//            .bind { query in
//                print("vc query: \(query)")
//                reactor.action.on(Event.next(query))
//            }
            .disposed(by: disposeBag)
        
        
        // State
        
        reactor.state.map { $0.repos }
            .bind(to: table.rx.items(cellIdentifier: "cell")) {
                indexPath, repoName, cell in
                cell.textLabel?.text = repoName
                print("reponame check: \(repoName)")
            }
            .disposed(by: disposeBag)
        
    }
}
