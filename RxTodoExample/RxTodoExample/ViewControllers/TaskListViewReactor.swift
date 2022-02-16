//
//  TaskListViewReactor.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import ReactorKit
import RxCocoa
import RxDataSources
import RxSwift

typealias TaskListSection = SectionModel<Void, TaskCellReactor>

final class TaskListViewReactor: Reactor {
    
    enum Action {
        case refresh
    }
    
    struct State {
        var isEditing: Bool
        var sections: [TaskListSection]
    }
    
    let provider: ServiceProviderType
    let initialState: State
    
    init(provider: ServiceProviderType) {
        self.provider = provider
        self.initialState = State(isEditing: false, sections: [TaskListSection(model: Void(), items: [])])
    }
    
    
    func mutate(action: Action) -> Observable<Action> {
        switch action {
        case .refresh:
//            return self.provider
            return .empty()
        }
    }
    
}
