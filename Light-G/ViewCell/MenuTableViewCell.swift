//
//  MenuTableViewCell.swift
//  Light-G
//
//  Created by James Au on 30/1/2023.
//

import Foundation
import UIKit
class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet var FeatureLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
