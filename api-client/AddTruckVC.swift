//
//  AddTruckVC.swift
//  api-client
//
//  Created by KaKin Chiu on 1/18/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit

class AddTruckVC: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var foodTypeField: UITextField!
    @IBOutlet weak var avgCostField: UITextField!
    @IBOutlet weak var latField: UITextField!
    @IBOutlet weak var longField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let name = nameField.text, nameField.text != ""
            else{
                showAlert(with: "Error", message: "Please enter a name.")
                return
        }
        
        guard let foodtype = foodTypeField.text, foodTypeField.text != ""
            else{
                showAlert(with: "Error", message: "Please enter a food type.")
                return
        }
        
        guard let avgcost = avgCostField.text, avgCostField.text != ""
            else{
                showAlert(with: "Error", message: "Please enter an average cost.")
                return
        }
        
        guard let latitude = latField.text, latField.text != ""
            else{
                showAlert(with: "Error", message: "Please enter a latitude.")
                return
        }
        
        guard let longitude = longField.text, longField.text != ""
            else{
                showAlert(with: "Error", message: "Please enter a longitude.")
                return
        }
        
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dissmissViewController()
    }
    
    @IBAction func backButtonTapped(sender: UIButton){
        dissmissViewController()
    }

    func dissmissViewController(){
        OperationQueue.main.addOperation {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlert(with title:String? ,message: String?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    


}
