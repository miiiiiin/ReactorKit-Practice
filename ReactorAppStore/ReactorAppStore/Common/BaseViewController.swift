//
//  BaseViewController.swift
//  ReactorAppStore
//
//  Created by Running Raccoon on 2021/11/11.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    var standardAppearanceShadowColor: UIColor?
    var standardAppearanceBackgroundColor: UIColor?
    var standardAppearanceBlurEffect: UIBlurEffect?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if #available(iOS 13.0, *) {
            standardAppearanceShadowColor = self.navigationController?.navigationBar.standardAppearance.shadowColor
            standardAppearanceBackgroundColor = self.navigationController?.navigationBar.standardAppearance.backgroundColor
            standardAppearanceBlurEffect = self.navigationController?.navigationBar.standardAppearance.backgroundEffect
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if #available(iOS 13.0, *) {
            self.navigationController?.navigationBar.standardAppearance.shadowColor = standardAppearanceShadowColor
            self.navigationController?.navigationBar.standardAppearance.backgroundColor = standardAppearanceBackgroundColor
            self.navigationController?.navigationBar.standardAppearance.backgroundEffect = standardAppearanceBlurEffect
        }
    }
    
    func loadXib(type: Any, contentSize: CGRect) -> UITableView? {
        guard let loadedNib = Bundle.main.loadNibNamed(String(describing: type), owner: self, options: nil) else { return nil }
        guard let tableView = loadedNib.first as? UITableView else { return nil }
        tableView.frame = contentSize
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return tableView
    }
}
