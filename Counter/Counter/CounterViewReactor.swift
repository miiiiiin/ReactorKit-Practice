//
//  CounterViewReactor.swift
//  Counter
//
//  Created by Running Raccoon on 2020/12/29.
//

import ReactorKit
import RxSwift

final class CounterViewReactor: Reactor {
    
    // Action is an user interaction
    enum Action {
      case increase
      case decrease
    }
    
    // Mutate is a state manipulator which is not exposed to a view
    enum Mutation {
      case increaseValue
      case decreaseValue
      case setLoading(Bool)
    }
    
    // State is a current view state
    struct State {
      var value: Int
      var isLoading: Bool
    }

    let initialState: State
    
    init() {
        self.initialState = State(value: 0, isLoading: false)
    }
    
    // Action -> Mutation
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        
        case .increase:
            return Observable.concat([
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.increaseValue).delay(.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        case .decrease:
            return Observable.concat([
            
                Observable.just(Mutation.setLoading(true)),
                Observable.just(Mutation.decreaseValue).delay(.milliseconds(500), scheduler: MainScheduler.instance),
                Observable.just(Mutation.setLoading(false))
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        
        switch mutation {
        case .increaseValue:
            state.value += 1
        case .decreaseValue:
            state.value -= 1
        case let .setLoading(isLoading):
            print("isloading: \(isLoading)")
            state.isLoading = isLoading
        }
        return state
    }
}
