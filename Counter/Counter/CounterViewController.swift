//
//  CounterViewController.swift
//  Counter
//
//  Created by Running Raccoon on 2020/12/29.
//

import UIKit
import RxCocoa
import RxSwift
import ReactorKit

// Conform to the protocol `View` then the property `self.reactor` will be available.
final class CounterViewController: UIViewController, StoryboardView {
    
    @IBOutlet weak var decreaseButton: UIButton!
    @IBOutlet weak var increaseButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
   
    var disposeBag = DisposeBag()
    
    func bind(reactor: CounterViewReactor) {
        
        //Action
        increaseButton.rx.tap
            .map { Reactor.Action.increase }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        decreaseButton.rx.tap
            .map { Reactor.Action.decrease }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        //State
        reactor.state.map { $0.value }
            .distinctUntilChanged()
            .map { "\($0) "}
            .bind(to: valueLabel.rx.text)
            .disposed(by: disposeBag)
        
        reactor.state.map { $0.isLoading }
            .distinctUntilChanged()
            .bind(to: activityIndicatorView.rx.isAnimating)
            .disposed(by: disposeBag)
    }
}
