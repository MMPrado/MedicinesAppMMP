//
//  TVCMedicines.swift
//  MedicinesApp
//
//  Created by Mayra Macias on 4/16/19.
//  Copyright © 2019 Mayra Macias. All rights reserved.
//

import UIKit

class TVCMedicines: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblSubtance: UILabel!
    
    @IBOutlet weak var lblGroup: UILabel!
    
    
    @IBOutlet weak var lblLaboratory: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
