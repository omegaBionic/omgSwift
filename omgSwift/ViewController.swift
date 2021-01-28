import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profil: UIImageView!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var playerSearchBar: UITextField!
    @IBOutlet weak var playerPersonalData: UIButton!
    @IBOutlet weak var playerVehicles: UIButton!
    @IBOutlet weak var playerAchievements: UIButton!
    
    var player: Player = Player()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! PersonalDatasViewController
        destinationVC.player = player
        
    }
    
    
    @IBAction func searchButton(_ sender: UIButton) {
        
        // Get searchBar
        let searchBar = String(self.searchBar.text!)
        print("[ViewController] searchBar: '\(searchBar)'")

        // Check if player in searchBar is available
        if Utils.playerIsSearchable(player: searchBar){
            print("[ViewController] playerIsSearchable: true")

            // create player
            self.player = Api.getPlayer(searchBar: searchBar)

            // Display result
            //print("[searchButton] responce: '" + responce + "'")
            //self.displayText.text = responce
            if self.player.isFound{
                self.displayText.text = "Player found in API:\n  - player.nickname: '\(self.player.nickname!)'\n  - player.account_id: '\(self.player.account_id!)'\n\n\nPlease select an option:"
                
                
                // Display other option for player
                self.playerPersonalData.alpha = 1
                self.playerVehicles.alpha = 1
                self.playerAchievements.alpha = 1
                
                // Save player for other views
                
                
            } else {
                self.displayText.text = "This player is not found, try another."
                self.playerPersonalData.alpha = 0
                self.playerVehicles.alpha = 0
                self.playerAchievements.alpha = 0
            }
        
        } else {
            self.displayText.text = "This player do not respect rules:\n  - A-Z\n  - a-Z\n  - 0-9\n  - _-"
            self.playerPersonalData.alpha = 0
            self.playerVehicles.alpha = 0
            self.playerAchievements.alpha = 0
            print("[ViewController] playerIsSearchable: false")
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
