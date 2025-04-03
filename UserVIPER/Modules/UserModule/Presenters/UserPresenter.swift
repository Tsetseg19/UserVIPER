//
//  Representer.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation
import UIKit
import Combine


class UserPresenter: ObservableObject, AnyPresenterProtocol {
    
    
    
    // Define the types using your provided entities.
    typealias DataType = User
    typealias AnyInteractorType = UserInteractor
    typealias RouterType = UserRouter
    typealias AnyViewType = UserView
    
    // VIPER component references
    var router: UserRouter?
    var interactor: UserInteractor?
    var view: UserView?
    
    // Published properties to update observers (e.g. SwiftUI or Combine subscribers)
    @Published var users: [User] = []
    @Published var errorMessage: String?
    
    // MARK: - AnyPresenterProtocol Methods
    
    func interactorDidFinishFetching(with result: Result<[User], Error>) {
        DispatchQueue.main.async {
            switch result {
            case .success(let users):
                self.users = users
                self.view?.update(with: users)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                self.view?.update(with: error.localizedDescription)
            }
        }
    }
    
    func showDetails(with data: User) {
        router?.moveToDetails(withData: data)
    }
}
