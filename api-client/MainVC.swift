//
//  MainVC.swift
//  api-client
//
//  Created by KaKin Chiu on 1/12/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataService = DataService.instance
    var authService = AuthService.instance
    
    var logInVC: LogInVC?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataService.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.getAllFoodTrucks()
    }
    
    func showLogInVC(){
        logInVC = LogInVC()
        logInVC?.modalPresentationStyle = UIModalPresentationStyle.formSheet
        self.present(logInVC!, animated: true, completion: nil)
        print("ok")
    }
    
    @IBAction func addButtonTapped(sender: UIButton){
        if AuthService.instance.isAuthenticated == true{
            print("no")
            performSegue(withIdentifier: "showAddTruckVC", sender: self)
        }else{
            print("yes")
            showLogInVC()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetailsVC"{
            print("segue")
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationViewController = segue.destination as! DetailsVC
                destinationViewController.selectedFoodTruck = DataService.instance.foodTrucks[indexPath.row]
            }
    }
    }
    
    
}




extension MainVC: DataServiceDelegate{
    func trucksLoaded() {
        OperationQueue.main.addOperation {
            self.tableView.reloadData()
        }
    }
    
    func reviewsLoaded() {
        //Do nothing
    }
    
}

extension MainVC: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.foodTrucks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "FoodTruckCell", for: indexPath) as?
            FoodTruckCell{
            cell.configureCell(truck: dataService.foodTrucks[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    
    
    
    
    
    
    
}
