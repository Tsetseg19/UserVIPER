//
//  AnyRouter.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//
import Foundation
import UIKit

typealias EntryPoint = UIViewController & AnyViewProtocol

protocol AnyRouterProtocol {
    
    associatedtype DataType
    
    var entry: (any EntryPoint)? { get }
    
    static func start() -> Self
    func moveToDetails(withData: DataType)
}
