//
//  AnyPresenter.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

/*
 Presenter has ref to Interactor, Router, View
*/

import Foundation

protocol AnyPresenterProtocol {
    
    associatedtype DataType
    associatedtype AnyInteractorType: AnyInteractorProtocol
    associatedtype AnyRouterType: AnyRouterProtocol
    associatedtype AnyViewType: AnyViewProtocol where AnyViewType.DataType == DataType
    
    var router: AnyRouterType? { get set }
    var interactor: AnyInteractorType? { get set }
    var view: AnyViewType? { get set }
    
    func interactorDidFinishFetching(with result: Result<[DataType], Error>)
    func showDetails(with data: DataType)
}
