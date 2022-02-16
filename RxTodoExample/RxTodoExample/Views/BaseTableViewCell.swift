//
//  BaseTableViewCell.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    // MARK: Initializing
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initialize() {
        // Override point
    }
}
