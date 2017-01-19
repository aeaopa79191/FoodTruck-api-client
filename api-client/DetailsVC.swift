//
//  DetailsVC.swift
//  api-client
//
//  Created by KaKin Chiu on 1/19/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit
import MapKit

class DetailsVC: UIViewController {
    
    var selectedFoodTruck: FoodTruck?
    var logInVC: LogInVC?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var avgCostLabel: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = selectedFoodTruck?.name
        foodTypeLabel.text = selectedFoodTruck?.foodType
        avgCostLabel.text = "\(selectedFoodTruck!.avgCost)"

        // Do any additional setup after loading the view.
    }


}
