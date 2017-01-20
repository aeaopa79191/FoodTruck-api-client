//
//  ReviewsVC.swift
//  api-client
//
//  Created by KaKin Chiu on 1/19/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit

class ReviewsVC: UIViewController {
    var selectedFoodTruck: FoodTruck?
    
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        DataService.instance.delegate = self
        
        if let truck = selectedFoodTruck{
            nameLabel.text = truck.name
            DataService.instance.getAllReviews(for: truck)
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        _ = navigationController?.popViewController(animated: true)
    }

}

extension ReviewsVC: DataServiceDelegate{
    func trucksLoaded() {
    }
    
    func reviewsLoaded() {
        OperationQueue.main.addOperation{
            self.tableView.reloadData()
        }
    }
}


extension ReviewsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as?
            ReviewCell{
            cell.configureCell(review: DataService.instance.reviews[indexPath.row])
            return cell
        }else{
            return UITableViewCell()
        }
    }
}
