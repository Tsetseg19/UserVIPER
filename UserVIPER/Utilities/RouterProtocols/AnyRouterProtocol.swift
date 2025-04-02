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
    
    var entry: (any EntryPoint)? { get }
    static func start() -> AnyRouterProtocol
    func moveToDetails(withData: DataType)
    
}
