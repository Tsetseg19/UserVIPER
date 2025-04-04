import Foundation
import UIKit

class UserView: UIViewController, AnyViewProtocol {
    
    // Define the type of data this view will display.
    typealias DataType = User
    
    // Define the concrete presenter type.
    typealias AnyPresenterType = UserPresenter
    
    // VIPER reference
    var presenter: UserPresenter?
    
    // TableView to display users
    private let tableView = UITableView()
    
    // Data source for the table view
    private var users: [User] = []
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Users"
        
        setupTableView()
        
        // Fetch users when the view loads.
        Task {
            await presenter?.interactor?.fetchUsers()
        }
    }
    
    // MARK: - UI Setup
    private func setupTableView() {
        view.addSubview(tableView)
        
        
        tableView.backgroundColor = .systemBackground
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = .separator.withAlphaComponent(0.7)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.contentInset = UIEdgeInsets(top: 12, left: 0, bottom: 12, right: 16)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        
        // Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
    }
    
    // MARK: - VIPER Update Methods
    func update(with data: [User]) {
        DispatchQueue.main.async {
            self.users = data
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            print("Error: \(error)")
            let alert = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

// MARK: - UITableView Delegate & DataSource
extension UserView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = "\(user.first_name) \(user.last_name)"
        cell.imageView?.image = UIImage(systemName: "person.circle") // Placeholder
        cell.imageView?.layer.cornerRadius = 25
        cell.imageView?.clipsToBounds = true
        cell.imageView?.contentMode = .scaleAspectFill
        cell.imageView?.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 50, height: 50))
        
        // Load image asynchronously
        DispatchQueue.global().async {
            if let url = URL(string: user.avatar),
               let data = try? Data(contentsOf: url),
               let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                    cell.setNeedsLayout() // Refresh layout
                }
            }
        }
        return cell
    }
}
