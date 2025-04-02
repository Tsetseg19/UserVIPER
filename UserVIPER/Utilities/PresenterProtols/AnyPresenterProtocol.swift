//
//  AnyPresenter.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

protocol AnyPresenter{
    
    var router: AnyRouter? {get set}
    var intreactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func intreactorDidFinishEmployes(with result:Result<[Product],Error>)
    func showDetails(withData: Product)
}
