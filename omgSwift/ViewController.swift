import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var profil: UIImageView!
    @IBOutlet weak var cover: UIImageView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchBar: UITextField!
    @IBOutlet weak var displayText: UILabel!
    @IBOutlet weak var player: UITextField!


    @IBAction func searchButton(_ sender: UIButton) {
        
        // Get searchBar
        let searchBar = String(self.searchBar.text!)
        print("[searchButton] searchBar: '\(searchBar)'")

        // Check if player in searchBar is available
        if Utils.playerIsSearchable(player: searchBar){
            print("[searchButton] playerIsSearchable: true")

            // create player
            let player = Api.getPlayer(searchBar: searchBar)

            // Display result
            //print("[searchButton] responce: '" + responce + "'")
            //self.displayText.text = responce
            if player.isFound{
                self.displayText.text = "Player found in API:\n  - player.nickname: '\(player.nickname!)'\n  - player.account_id: '\(player.account_id!)'\n\nPlease select an option."
            } else {
                self.displayText.text = "This player is not found, try another."
            }
        
        } else {
            self.displayText.text = "This player do not respect rules:\n  - A-Z\n  - a-Z\n  - 0-9\n  - _-"
            print("[searchButton] playerIsSearchable: false")
        }
        
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
