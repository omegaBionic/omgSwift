//
//  MeteoTableViewCell.swift
//  omgWeather2
//
//  Created by Julien BOULLY on 02/02/2021.
//

import UIKit

class MeteoTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var ville: UILabel!
    @IBOutlet weak var pays: UILabel!
    @IBOutlet weak var temperature: UILabel!
}
