//
//  personalDatasTableViewCell.swift
//  omgSwift
//
//  Created by Julien BOULLY on 02/02/2021.
//

import UIKit

class personalDatasTableViewCell: UITableViewCell {

    @IBOutlet weak var key: UILabel!
    @IBOutlet weak var value: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
