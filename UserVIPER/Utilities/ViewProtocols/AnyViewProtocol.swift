//
//  AnyView.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

protocol AnyView {
    associatedtype DataType
    var presenter: AnyPresenterProtocol? { get set }
    func update(with data: [DataType])
    func update(with error: String)
}
