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
    
    func bind(reactor: GitHubSearchViewReactor) {
    }
    
}
