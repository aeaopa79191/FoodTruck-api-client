//
//  ReviewCell.swift
//  api-client
//
//  Created by KaKin Chiu on 1/19/17.
//  Copyright © 2017 KaKinChiu. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(review: FoodTruckReview){
        titleLabel.text = review.title
        reviewTextLabel.text = review.text
    }

}
