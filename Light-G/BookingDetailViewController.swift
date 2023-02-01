//
//  BookingDetailViewController.swift
//  Light-G
//
//  Created by James Au on 30/1/2023.
//

import Foundation
import UIKit
class BookingDetailViewController: UITableViewController {
    var Catalog: [[String:Any]] = []
    let CellID = "datacell"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    // How many sections did you wanted
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Catalog.count
    }
    // Content of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)as? BookingDetailTableViewCell  else { return BookingDetailTableViewCell()
        }
        cell.TitleLabel?.text = Catalog[indexPath.row]["Title"] as? String
        cell.InfoLabel?.text = Catalog[indexPath.row]["Value"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)as? BookingDetailTableViewCell  else { return
        }
        guard let text = Catalog[indexPath.row]["Title"] as? String else { return  }
//        guard let text = cell.TitleLabel?.text else { return  }
//        guard text == "Book" else {
//            return
//        }
        guard text == "Book" else {
            return
        }
        print("Book")
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
