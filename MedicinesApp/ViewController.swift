//
//  ViewController.swift
//  MedicinesApp
//
//  Created by Mayra Macias on 4/15/19.
//  Copyright © 2019 Mayra Macias. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
 var refMedicines = DatabaseReference.init()
    
    @IBOutlet weak var lblMesage: UILabel!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtSubtance: UITextField!
    @IBOutlet weak var txtGroup: UITextField!
    @IBOutlet weak var txtLaboratory: UITextField!
    
    @IBOutlet weak var laMedicinesList: UITableView!
    var medicinesList = [MedicinesModel]()
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let medicine = medicinesList[indexPath.row]
        let alertController = UIAlertController(title: medicine.name, message: "Give new values to update  ", preferredStyle: .alert)
        let updateAction = UIAlertAction(title: "Update", style: .default){(_) in
            let id = medicine.id
            let name = alertController.textFields?[0].text
            let subtance = alertController.textFields?[1].text
            let group = alertController.textFields?[2].text
            let laboratory = alertController.textFields?[3].text
            
            self.updateMedicines(id: id!, name: name!, subtance: subtance!, group: group!, laboratory: laboratory!)
        }
        
        let deleteAction = UIAlertAction(title: "Delete", style: .default){(_) in
            self.deleteMedicine(id: medicine.id!)
        }
        alertController.addTextField{(textField)in
        textField.text = medicine.name
        }
        alertController.addTextField{(textField)in
            textField.text = medicine.subtance
        }
        alertController.addTextField{(textField)in
            textField.text = medicine.group
        }
        alertController.addTextField{(textField)in
            textField.text = medicine.laboratory
        }
        
        
        alertController.addAction(updateAction)
        alertController.addAction(deleteAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicinesList.count
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 190.0
    }
    
    func deleteMedicine(id: String){
        refMedicines.child(id).setValue(nil)
    }
    
    func updateMedicines(id : String, name: String, subtance: String, group: String, laboratory : String){
        let medicine = [
            "id" : id,
            "medicineName" : name,
            "medicineSubtance" : subtance,
            "medicineGroup" : group,
            "medicineLaboratory" : laboratory
        ]
        refMedicines.child(id).setValue(medicine)
            lblMesage.text = "Medicine Update"
        
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellMedicines = tableView.dequeueReusableCell(withIdentifier: "cellMedicines", for: indexPath) as! TVCMedicines
        
        let medicine: MedicinesModel
        medicine = medicinesList[indexPath.row]
        cellMedicines.lblName.text = medicine.name
        cellMedicines.lblSubtance.text = medicine.subtance
        cellMedicines.lblGroup.text = medicine.group
        cellMedicines.lblLaboratory.text = medicine.laboratory
        return cellMedicines
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
         refMedicines = Database.database().reference().child("medicines")
        refMedicines.observe(DataEventType.value, with: {(snapshot) in
            if snapshot.childrenCount>0{
            self.medicinesList.removeAll()
                for medicines in snapshot.children.allObjects as![DataSnapshot]{
                    let medicineObject = medicines.value as? [String:  AnyObject]
                    let medicineName = medicineObject? ["medicineName"]
                    let medicineSubtance = medicineObject? ["medicineSubtance"]
                    let medicineGroup = medicineObject? ["medicineGroup"]
                    let medicineLaboratory = medicineObject? ["medicineLaboratory"]
                    let medicineId = medicineObject? ["id"]
                    
                    let medicine = MedicinesModel(id: medicineId as! String?, name: medicineName as! String?, subtance: medicineSubtance as! String?, group: medicineGroup as! String?, laboratory: medicineLaboratory as! String?)
                    self.medicinesList.append(medicine)
            }
                self.laMedicinesList.reloadData()
            }
        })
    }
    func addMedicine (){
        let key = refMedicines.childByAutoId().key
        
        let medicine = ["id": key,
                        "medicineName" : txtName.text! as String,
                        "medicineSubtance" : txtSubtance.text! as String,
                        "medicineGroup": txtGroup.text! as String,
                        "medicineLaboratory": txtLaboratory.text! as String
        ]
        refMedicines.child(key!).setValue(medicine)
        lblMesage.text = "Medicines Added"
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnSave(_ sender: Any) {
        addMedicine()
    }
    
}

