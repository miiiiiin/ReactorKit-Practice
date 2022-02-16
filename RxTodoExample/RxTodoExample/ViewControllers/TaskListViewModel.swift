//
//  TaskListViewModel.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import RxCocoa
import RxDataSources
import RxSwift

protocol TaskListViewModelType {
    // output
    var title: Driver<String?> { get }
    
}

struct TaskListViewModel: TaskListViewModelType {
    
    // MARK: Output
    
    var title: Driver<String?>
    
    // MARK: Private
    
    private let disposeBag = DisposeBag()
    
    init() {
        self.title = .just("Tasks")
    }
    
}
