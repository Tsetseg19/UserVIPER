//
//  AnyView.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

// View has reference to Presenter

import Foundation

protocol AnyViewProtocol {
    
    associatedtype DataType
    associatedtype AnyPresenterType: AnyPresenterProtocol
    
    var presenter: AnyPresenterType? { get set }
    func update(with data: [DataType])
    func update(with error: String)
}
