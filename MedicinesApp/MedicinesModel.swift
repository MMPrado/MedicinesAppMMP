//
//  MedicinesModel.swift
//  MedicinesApp
//
//  Created by Mayra Macias on 4/22/19.
//  Copyright © 2019 Mayra Macias. All rights reserved.
//

import Foundation
class MedicinesModel {
    var id: String?
    var name : String?
    var subtance : String?
    var group : String?
    var laboratory : String?
    
    
    
    init(id: String?, name : String?, subtance : String?, group : String?, laboratory : String?) {
        self.id = id
        self.name = name
        self.subtance = subtance
        self.group = group
        self.laboratory = laboratory
        
    }
}
