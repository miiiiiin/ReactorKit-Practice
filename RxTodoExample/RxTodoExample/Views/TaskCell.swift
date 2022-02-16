//
//  TaskCell.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import UIKit
import RxSwift

final class TaskCell: BaseTableViewCell {

    // MARK: Constants

    struct Constant {
        static let titleLabelNumberOfLines = 2
    }

    struct Metric {
        static let cellPadding: CGFloat = 15.0
    }

    struct Font {
        static let titleLabel = UIFont.systemFont(ofSize: 14)
    }

    struct Color {
        static let titleLabelText = UIColor.black
    }
    
    // MARK: Properties

    let titleLabel = UILabel().then {
        $0.font = Font.titleLabel
        $0.textColor = Color.titleLabelText
        $0.numberOfLines = Constant.titleLabelNumberOfLines
    }
    
    // MARK: Initializing

    override func initialize() {
        self.contentView.addSubview(self.titleLabel)
    }
    
    // MARK: Configuring

    func configure(viewModel: TaskCellModelType) {
        self.titleLabel.text = viewModel.title
    }
    
    // MARK: Layout

    override func layoutSubviews() {
        super.layoutSubviews()

//        self.titleLabel.top = Metric.cellPadding
//        self.titleLabel.left = Metric.cellPadding
//        self.titleLabel.width = self.contentView.width - Metric.cellPadding * 2
        self.titleLabel.sizeToFit()
    }

    


}
