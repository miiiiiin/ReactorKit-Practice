//
//  ModelType.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import Then

protocol Identifiable {
    associatedtype Identifier: Equatable
    var id: Identifier { get }
}

protocol ModelType: Then {
}

//extension CollectionType where Generator.Element: Identifiable {
//
//    func indexOf(element: Self.Generator.Element) -> Self.Index? {
//        return self.indexOf { $0.id == element.id }
//    }
//
//}
