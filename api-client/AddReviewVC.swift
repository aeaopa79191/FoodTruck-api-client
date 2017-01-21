//
//  AddReviewVC.swift
//  api-client
//
//  Created by KaKin Chiu on 1/19/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit

class AddReviewVC: UIViewController {
    var selectedFoodTruck: FoodTruck?
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var reviewTitleField: UITextField!
    
    @IBOutlet weak var reviewTextField: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let truck = selectedFoodTruck{
            headerLabel.text = truck.name
        }else{
            headerLabel.text = "error"
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        guard let truck = selectedFoodTruck else{
            showAlert(with: "Error", message: "Could not get selected truck")
            return
        }
        
        guard let title = reviewTitleField.text, reviewTitleField.text != "" else{
            showAlert(with: "Error", message: "Please enter a title for your review")
            return
        }
        
        guard let reviewText = reviewTextField.text, reviewTextField.text != "" else{
            showAlert(with: "Error", message: "Please enter some text for your review")
            return
        }
        
        DataService.instance.addNewReview(truck.id, title: title, text: reviewTextField, completion: {
            Success in if Success {
                print("We saved successfully")
                DataService.instance.getAllReviews(for: truck)
                self.dissmissViewController()
                
            }else{
                print("We saved unsuccessfully")
                showAlert(with: "Error", message: "An error occurred saving the new Review")
            }
        })
    }
    

    @IBAction func backButtonTapped(_ sender: UIButton) {
        dissmissViewController()
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dissmissViewController()
    }
    
    func dissmissViewController(){
        OperationQueue.main.addOperation {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlert(with title: String?, message: String?){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Error", style: Default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
