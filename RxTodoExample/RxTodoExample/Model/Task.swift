//
//  Task.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import Foundation

struct Task: ModelType, Identifiable {
    
    var id: String = UUID().uuidString
    var title: String
    var memo: String?
    
    init(title: String, memo: String? = nil) {
        self.title = title
        self.memo = memo
    }
}
