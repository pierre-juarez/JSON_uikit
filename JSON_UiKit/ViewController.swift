//
//  ViewController.swift
//  JSON_UiKit
//
//  Created by Pierre Juarez U. on 3/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tblUsers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblUsers.delegate = self
        tblUsers.dataSource = self
        UserViewModel.shared.fetch { done in
            if done {
                self.tblUsers.reloadData()
            }
        }
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserViewModel.shared.dataModel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let user = UserViewModel.shared.dataModel.data[indexPath.row]
        cell.lblName.text = user.first_name
        cell.lblEmail.text = user.email
        guard let imageURL = URL(string: user.avatar) else { fatalError("Error al obtener la imagen") }
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                cell.imgUser.image = image
                cell.imgUser.layer.cornerRadius = cell.imgUser.frame.size.width/2 // CornerRadius
                cell.imgUser.clipsToBounds = true
            }
        }
        return cell
    }
    
    
}

class UserCell: UITableViewCell{
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
}
