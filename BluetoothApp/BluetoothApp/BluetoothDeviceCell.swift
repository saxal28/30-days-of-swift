//
//  BluetoothDeviceCell.swift
//  BluetoothApp
//
//  Created by Alan Sax on 3/7/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class BluetoothDeviceCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rssiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
