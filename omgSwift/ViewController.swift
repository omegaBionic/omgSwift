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

            // Concatenate URL
            print("[searchButton] Concatenate URL")
            let url = URL(string: "https://api.worldoftanks.eu/wot/account/list/?search=\(searchBar)&application_id=:)")!
            

            // Declare and lock semaphore for wait request
            let sem = DispatchSemaphore.init(value: 0)
            
            // Create player and others returne vars
            let player = Player()
            //var responce = ""

            // Get players on wargaming API
            print("[searchButton] Get players on wargaming API")
            let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
                guard let data = data else { return }
                //print("The response is : ", String(data: data, encoding: .utf8)!)
                //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)

                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    if let dictionary = jsonObject as? [String: Any] {
                        if let results = dictionary["data"] as? [[String:Any]] {
                            // Check search contain result(s)
                            if results.indices.contains(0) {
                                // Save player found
                                player.nickname = results[0]["nickname"] as? String
                                player.account_id = results[0]["account_id"] as? Int
                                if player.nickname == searchBar {
                                    print("[searchButton] Player found: '\(searchBar)'")
                                    player.isFound = true
                                    
                                } else {
                                    print("[searchButton] Player not found: '\(searchBar)'")
                                    player.isFound = false
                                }
                            }
                        }
                        
                    }
                } catch {
                    print("JSON error: \(error.localizedDescription)")
                    return
                }

                //responce = String(data: data, encoding: .utf8)!

                // Unlock semaphore
                do { sem.signal() }
            }
            task.resume()

            // Wait unlock semaphore
            sem.wait()

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
