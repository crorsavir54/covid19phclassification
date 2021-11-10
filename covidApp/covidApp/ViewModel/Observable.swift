//
//  Observer.swift
//  covidApp
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
// For MVVM Binding

import Foundation

class Observable<T> {
    var value: T? {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T?){
        self.value = value
    }
    
    private var listener: ((T?) -> Void)?
    
    func bind(_ listener: @escaping (T?) -> Void) {
        listener(value)
        self.listener = listener
    }
}
