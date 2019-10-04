//
//  TableViewCell.swift
//  News App
//
//  Created by Sharad Kumar on 9/27/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgNews: UIImageView!
    
    @IBOutlet weak var lblNewsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
