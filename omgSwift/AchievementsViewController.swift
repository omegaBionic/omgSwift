//
//  AchievementsViewController.swift
//  omgSwift
//
//  Created by Julien BOULLY on 20/01/2021.
//

import UIKit

class AchievementsViewController: UIViewController {

    var player: Player = Player()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let datasAchivements = Api.getAchievementsDatas(player: player)
        print("[AchievementsViewController] Api.getPersonalDatas: '\(datasAchivements)'")
        
        // Debug
        print("[AchievementsViewController] player.isFound: '\(player.isFound)'")
        print("[AchievementsViewController] player.nickname: '\(player.nickname!)'")
        print("[AchievementsViewController] player.account_id: '\(player.account_id!)'")
        
        // Display
        displayAchivements.backgroundColor = .lightGray
        
        displayAchivements.layer.masksToBounds = true
        
        displayAchivements.layer.masksToBounds = true
        
        displayAchivements.layer.cornerRadius = 10.0
        
        displayAchivements.layer.borderWidth = 1
        
        displayAchivements.layer.borderColor = UIColor.black.cgColor
        
        displayAchivements.font = UIFont.systemFont(ofSize: 20.0)
        
        displayAchivements.textColor = UIColor.black
        
        displayAchivements.textAlignment = NSTextAlignment.left
        
        displayAchivements.layer.shadowOpacity = 0.5
               
        displayAchivements.text = datasAchivements
    }
    @IBOutlet weak var displayAchivements: UILabel!
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
