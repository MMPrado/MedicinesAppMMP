//
//  Medicines.swift
//  MedicinesApp
//
//  Created by Mayra Macias on 4/16/19.
//  Copyright © 2019 Mayra Macias. All rights reserved.
//

import UIKit

class Medicines {
    var name : String?
    var subtance : String?
    var group : String?
    var laboratory : String?
    
    init(name : String, subtance : String, group : String, laboratory : String) {
        self.name = name
        self.subtance = subtance
        self.group = group
        self.laboratory = laboratory
        
    }
}
