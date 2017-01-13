//
//  MainVC.swift
//  api-client
//
//  Created by KaKin Chiu on 1/12/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DataService.instance.delegate = self
        DataService.instance.getAllFoodTrucks()
    }

}


extension MainVC: DataServiceDelegate{
    func trucksLoaded() {
    }
    
    func reviewsLoaded() {
        
    }
    
}
