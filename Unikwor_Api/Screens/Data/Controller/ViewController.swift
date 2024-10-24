//
//  ViewController.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 23/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private var vm = ViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpTableView()
        vm.fetchData { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    private func setUpTableView() {
        tableView.register(UINib(nibName: "DataTableViewCell", bundle: nil), forCellReuseIdentifier: "DataTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataTableViewCell", for: indexPath) as? DataTableViewCell else { return UITableViewCell() }
        
        let data = vm.data[indexPath.row]
        cell.nameLbl.text = data.user.name
        cell.likesLbl.text = "\(data.likes)"
        cell.descriptionLbl.text = "\(data.descriptions)"
        cell.timeLbl.text = "\(data.date_time)"
        
        ImageLoader.shared.loadImage(from: data.images[0], into: cell.img, placeholder: UIImage(named: "placeholder"))
        
        return cell
    }
    
    
}

