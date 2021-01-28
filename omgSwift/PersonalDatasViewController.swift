//
//  PersonalDatasViewController.swift
//  omgSwift
//
//  Created by Julien BOULLY on 20/01/2021.
//

import UIKit

class PersonalDatasViewController: UIViewController {

    var player: Player = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let personalDatas = Api.getPersonalDatas(player: player)
        print("[PersonalDatasViewController] searchBar: '\(personalDatas)'")
        
        // Display
        displayPersonalDatas.backgroundColor = .lightGray
        
        displayPersonalDatas.layer.masksToBounds = true
        
        displayPersonalDatas.layer.masksToBounds = true
        
        displayPersonalDatas.layer.cornerRadius = 10.0
        
        displayPersonalDatas.layer.borderWidth = 1
        
        displayPersonalDatas.layer.borderColor = UIColor.black.cgColor
        
        displayPersonalDatas.font = UIFont.systemFont(ofSize: 20.0)
        
        displayPersonalDatas.textColor = UIColor.black
        
        displayPersonalDatas.textAlignment = NSTextAlignment.left
        
        displayPersonalDatas.layer.shadowOpacity = 0.5
        
        displayPersonalDatas.text = personalDatas
    }

    @IBOutlet weak var displayPersonalDatas: UILabel!
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
