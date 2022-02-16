//
//  TaskCellReactor.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import ReactorKit
import RxCocoa
import RxSwift

class TaskCellReactor: Reactor {
  typealias Action = NoAction

  let initialState: Task

  init(task: Task) {
    self.initialState = task
  }
}
