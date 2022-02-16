//
//  BaseViewController.swift
//  RxTodoExample
//
//  Created by Running Raccoon on 2022/02/16.
//

import Foundation
import UIKit
import RxSwift
import SnapKit

class BaseViewController: UIViewController {
    
    // MARK: Init
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
    }

    // MARK: Rx

    let disposeBag = DisposeBag()


    // MARK: Layout Constraints

    private(set) var didSetupConstraints = false

    override func viewDidLoad() {
        self.view.setNeedsUpdateConstraints()
    }

    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }

    func setupConstraints() {
        // Override point
    }
}
