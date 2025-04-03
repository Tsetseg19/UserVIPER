//
//  Router.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//
import Foundation
import UIKit

final class UserRouter: AnyRouterProtocol {
    
    typealias DataType = User
    
    var entry: (any EntryPoint)? {
        return viewController as? (any EntryPoint)
    }
    
    private weak var viewController: UIViewController?
    
    init() {
        let view = UserView()
        let presenter = UserPresenter()
        let interactor = UserInteractor()
        
        // Set up VIPER relationships.
        view.presenter = presenter
        presenter.view = view
        presenter.router = self
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        // Keep a weak reference for navigation.
        self.viewController = view
    }
    
    // MARK: - Factory Method
    static func start() -> Self {
        return Self()
    }
    
    // MARK: - Navigation
    func moveToDetails(withData user: User) {
        print("Navigating to details for user: \(user.first_name) \(user.last_name)")
        // Example navigation logic:
        // let detailVC = UserDetailViewController(user: user)
        // viewController?.navigationController?.pushViewController(detailVC, animated: true)
    }
}
