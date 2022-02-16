//
//  TaskListViewController.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class TaskListViewController: BaseViewController {
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupConstraints() {
        super.setupConstraints()
    }
    
    // MARK: Initializing

    init(viewModel: TaskListViewModelType) {
        super.init()
        self.configure(viewModel: viewModel)
    }
    
    // MARK: Configuring

    private func configure(viewModel: TaskListViewModelType) {

        viewModel.title
            .drive(self.navigationItem.rx.title)
            .disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
