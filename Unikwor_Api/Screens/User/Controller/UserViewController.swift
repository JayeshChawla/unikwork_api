//
//  UserViewController.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 24/10/24.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        self.setupTableView()
        viewModel.fetchUserData { result in
            switch result {
            case .success:
                print("Success")
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print("Error : \(error.localizedDescription)")
            }
        }
    }
    
    
    private func setupTableView() {
        tableView.register(UINib(nibName: "UserTableViewCell", bundle: nil), forCellReuseIdentifier: "UserTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell() }
        
        let userData = viewModel.userData[indexPath.row]
        cell.username.text = userData.username
        cell.hairType.text = userData.hair.type
        cell.companyname.text = userData.company.name
        cell.address.text = userData.address.address
        ImageLoader.shared.loadImage(from: userData.image, into: cell.img, placeholder: UIImage(named: "placeholder"))
        
        return cell
    }
    
    
}
