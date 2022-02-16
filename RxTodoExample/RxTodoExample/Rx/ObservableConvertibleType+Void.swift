//
//  ObservableConvertibleType+Void.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import RxSwift
import RxCocoa

extension ObservableConvertibleType where E == Void {

    func asDriver() -> Driver<E> {
        return self.asDriver(onErrorJustReturn: Void())
    }

}

