//
//  PersonalDatasViewController.swift
//  omgSwift
//
//  Created by Julien BOULLY on 20/01/2021.
//

import UIKit

class PersonalDatasViewController: UIViewController, UITableViewDataSource {

    // Define variables and constants
    var player: Player = Player()
    var data = [Data]()
    let identifier = "personalDatasCell"
    
    @IBOutlet weak var personalDatasTableView: UITableView!
    
    
    // Init
    override func viewDidLoad() {
        super.viewDidLoad()

        data = Api.getPersonalDatas(player: player)
        print("[PersonalDatasViewController] data: '\(data)'")
        

        
        personalDatasTableView.dataSource = self
        
    }
    
    // tableView for cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! personalDatasTableViewCell
        let row = indexPath.row
        
        cell.key.textColor = UIColor.gray
        cell.value.textColor = UIColor.lightGray
        
        cell.key.text = data[row].key
        cell.value.text = data[row].value
        
        return cell
    }
}
