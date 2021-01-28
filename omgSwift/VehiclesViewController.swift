//
//  VehiclesViewController.swift
//  omgSwift
//
//  Created by Julien BOULLY on 20/01/2021.
//

import UIKit

class VehiclesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        displayVehicles.text = ""
    }
    
    @IBOutlet weak var displayVehicles: UILabel!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
