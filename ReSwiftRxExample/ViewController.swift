//
//  ViewController.swift
//  ReSwiftRxExample
//
//  Created by Tomohiro Takezawa on 2016/10/16.
//  Copyright © 2016年 Tomohiro Takezawa. All rights reserved.
//

import UIKit
import ReSwift


class ViewController: UIViewController, StoreSubscriber {

    @IBOutlet weak var label: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        mainStore.subscribe(self)
    }

    override func viewWillDisappear(_ animated: Bool) {
        mainStore.unsubscribe(self)
    }

    func newState(state: AppState) {
        label.text = "\(state.counter)"
    }

    @IBAction func incrementButtonTapped(_ sender: AnyObject) {
        mainStore.dispatch(
            CounterActionIncrease()
        )
    }

    @IBAction func decrementButtonTapped(_ sender: AnyObject) {
        mainStore.dispatch(
            CounterActionDecrease()
        )
    }
}
