//
//  TaskCellModel.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import RxCocoa
import RxSwift

protocol TaskCellModelType {
    var title: String { get }
}

struct TaskCellModel: TaskCellModelType {
    
    let title: String
    
    init(task: Task) {
        self.title = task.title
    }
    
}
