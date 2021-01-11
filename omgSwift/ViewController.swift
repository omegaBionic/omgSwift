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

        //TODO: get url
        print("[searchButton] Get URL")

        // Concatenate string
        let url = URL(string: "https://api.worldoftanks.eu/wot/account/list/?search=\(searchBar)&application_id=:)")!
        var responce = ""

        // Declare and lock semaphore for wait request
        let sem = DispatchSemaphore.init(value: 0)

        // Get players on wargaming API
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            guard let data = data else { return }
            //print("The response is : ", String(data: data, encoding: .utf8)!)
            //print(NSString(data: data, encoding: String.Encoding.utf8.rawValue) as Any)

            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = jsonObject as? [String: Any] {
                    if let results = dictionary["data"] as? [[String:Any]] {
                        for result in results {
                            let nickname = result["nickname"] as! String
                            let account_id = result["account_id"] as! Int
                            print (nickname )
                            print (account_id)
                        }
                    }
                }
            } catch {
                print("JSON error: \(error.localizedDescription)")
                return
            }

            responce = String(data: data, encoding: .utf8)!

            // Unlock semaphore
            defer { sem.signal() }
        }
        task.resume()

        // Wait unlock semaphore
        sem.wait()

        // Display result
        //print("[searchButton] responce: '" + responce + "'")
        self.displayText.text = responce
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
