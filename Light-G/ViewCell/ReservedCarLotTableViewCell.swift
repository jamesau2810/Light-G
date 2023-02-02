//
//  ReservedCarLotTableViewCell.swift
//  Light-G
//
//  Created by James Au on 2/2/2023.
//

import Foundation

import UIKit
class ReservedCarLotTableViewCell: UITableViewCell {
    
    @IBOutlet var NameLabel: UILabel!
    @IBOutlet var DataLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
