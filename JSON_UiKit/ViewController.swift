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
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UserCell
        return cell
    }
    
    
}

class UserCell: UITableViewCell{
    
    @IBOutlet weak var imgUser: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
}
