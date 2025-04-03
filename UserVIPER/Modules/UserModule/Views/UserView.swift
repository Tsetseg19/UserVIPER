//
//  View.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation
import UIKit

class UserView: UIViewController, AnyViewProtocol {
    // Define the type of data this view will display.
    typealias DataType = User
    // Define the concrete presenter type.
    typealias AnyPresenterType = UserPresenter
    
    // VIPER reference
    var presenter: UserPresenter?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Users"
        
        // Optionally: Trigger a fetch when the view loads.
        Task {
            await presenter?.interactor?.fetchUsers()
        }
    }
    
    // Called by the presenter with an updated list of users.
    func update(with data: [User]) {
        print("Displaying Users:")
        data.forEach { user in
            print("\(user.id): \(user.first_name) \(user.last_name)")
        }
        // Here you would update your UI elements, like reloading a table view.
    }
    
    // Called by the presenter when an error occurs.
    func update(with error: String) {
        print("Error: \(error)")
        // Update the UI to display the error (e.g., show an alert).
    }
}
