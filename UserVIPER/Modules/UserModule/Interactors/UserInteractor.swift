//
//  Interactor.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation

class UserInteractor: AnyInteractorProtocol {
    typealias PresenterType = UserPresenter
    var presenter: UserPresenter?
    
    // Inject the network manager
    let networkManager: NetworkProtocol = NetworkManager()
    
    // Fetch users using async/await
    func fetchUsers() async {
        guard let url = URL(string: "https://reqres.in/api/users") else { return }
        
        do {
            // Fetch data asynchronously
            let response: UserResponse = try await networkManager.fetchData(from: url)
            
            // Ensure UI updates happen on the main thread
            DispatchQueue.main.async {
                self.presenter?.interactorDidFinishFetching(with: .success(response.data))
            }
        } catch {
            DispatchQueue.main.async {
                self.presenter?.interactorDidFinishFetching(with: .failure(error))
            }
        }
    }

}
