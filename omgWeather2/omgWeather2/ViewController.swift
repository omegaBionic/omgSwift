//
//  ViewController.swift
//  omgWeather2
//
//  Created by Julien BOULLY on 02/02/2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    // Constants
    var weathers = [Weather]()

    let identifier = "meteoCell"
    @IBOutlet weak var meteoTableView: UITableView!
    @IBOutlet weak var update: UIButton!
    @IBOutlet weak var triVille: UIButton!
    
    var isSortTemp = true

    // Init datas
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let tokyo = Weather(city: "Tokyo", country: "Japon", temperature: 24.3)
        let nairobi = Weather(city: "Nairobi", country: "Kenya", temperature: 32.4)
        let denver = Weather(city: "Denver", country: "Etats-Unis (Colorado)", temperature: 4.8)
        let berlin = Weather(city: "Berlin", country: "Allemagne", temperature: 4.6)
        let rio = Weather(city: "Rio", country: "Bresil", temperature: 25.1)
        let moscou = Weather(city: "Moscou", country: "Russie", temperature: -18.7)
        let helsinki = Weather(city: "Helsinki", country: "Finlande", temperature: -15.0)
        let oslo = Weather(city: "Oslo", country: "Norvege", temperature: -5.4)
        let lisbonne = Weather(city: "Lisbonne", country: "Portugal", temperature: 15.5)
        let stockolm = Weather(city: "Stockolm", country: "Suède", temperature: -5.4)
        let bogota = Weather(city: "Bogota", country: "Colombie", temperature: 19.2)
        let marseille = Weather(city: "Marseille", country: "France", temperature: 15.9)
        let cincinnati = Weather(city: "Cincinnati", country: "Etats-Unis (Ohio)", temperature: -2.4)
        let sofia = Weather(city: "Sofia", country: "Bulgarie", temperature: -3.4)
        weathers.append(tokyo)
        weathers.append(nairobi)
        weathers.append(denver)
        weathers.append(berlin)
        weathers.append(rio)
        weathers.append(moscou)
        weathers.append(helsinki)
        weathers.append(oslo)
        weathers.append(lisbonne)
        weathers.append(stockolm)
        weathers.append(bogota)
        weathers.append(marseille)
        weathers.append(cincinnati)
        weathers.append(sofia)
        meteoTableView.dataSource = self
    }
    
    // Sort temperature
    @IBAction func sortTemperature(_ sender: Any) {
        if isSortTemp == true {
            weathers.sort(by: {$0.temperature < $1.temperature})
            triVille.setTitle("Tri Villes", for: .normal)
            isSortTemp = false
        }
        else {
            weathers.sort(by: {$0.city < $1.city})
            isSortTemp = true
            triVille.setTitle("Tri Temp.", for: .normal)
        }
        meteoTableView.reloadData()
    }
    
    // Obligatoire pour UITableViewCell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weathers.count
    }
    
    // Display tableView
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! MeteoTableViewCell
        let row = indexPath.row
        if weathers[row].temperature < 0 {
            cell.backgroundColor = UIColor.systemBlue
        }
        else if weathers[row].temperature < 25 {
            cell.backgroundColor = UIColor.systemGreen
        }
        else {
            cell.backgroundColor = UIColor.systemRed
        }
        cell.ville.textColor = UIColor.white
        cell.pays.textColor = UIColor.white
        cell.temperature.textColor = UIColor.white
        cell.ville.text = weathers[row].city
        cell.pays.text = weathers[row].country
        cell.temperature.text = String(format: "%.1f", weathers[row].temperature) + " °"
        return cell
    }


}

