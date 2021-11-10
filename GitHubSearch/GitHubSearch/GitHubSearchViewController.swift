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
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bind(reactor: GitHubSearchViewReactor) {
    }
    
}
