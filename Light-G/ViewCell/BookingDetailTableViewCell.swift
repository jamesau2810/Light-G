//
//  BookingDetailTableViewCell.swift
//  Light-G
//
//  Created by James Au on 30/1/2023.
//

import Foundation
import UIKit
class BookingDetailTableViewCell: UITableViewCell {
    @IBOutlet var TitleLabel: UILabel!
    @IBOutlet var InfoLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
