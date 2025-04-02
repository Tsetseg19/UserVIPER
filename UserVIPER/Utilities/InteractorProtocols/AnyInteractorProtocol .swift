//
//  AnyInteractor.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

protocol AnyInteractorProtocol {
    
    associatedtype PresenterType: AnyPresenterProtocol
    
    var presenter: PresenterType? { get set }
}
