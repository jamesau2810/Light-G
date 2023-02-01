//
//  MenuViewController.swift
//  Light-G
//
//  Created by James Au on 30/1/2023.
//

import Foundation
import UIKit
enum segueStr {
    case book
    case guide
    case find
    var ite : String {
        switch self {
        case .book:
            return "bookparking"
        case .guide:
            return ""
        case .find:
            return ""
        }
    }
}
class MenuViewController: UITableViewController {
    var username: String = ""
    var featureList: [[String:Any]] = []
    let CellID = "featurecell"
    override func viewDidLoad() {
        super.viewDidLoad()
        featureList = [
            ["Name":"Parking Lot Reserve","Num":1,"Segue":segueStr.book.ite],
            ["Name":"Parking Guide","Num":2,"Segue":segueStr.guide.ite],
            ["Name":"Car Finding","Num":3,"Segue":segueStr.find.ite]
        ]
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    // How many sections did you wanted
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return featureList.count
    }
    // Content of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)as? MenuTableViewCell  else { return MenuTableViewCell()}
        cell.FeatureLabel?.text = featureList[indexPath.row]["Name"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let identifier = featureList[indexPath.row]["Segue"] as? String else { return  }
        guard identifier != "" else {
            tableView.deselectRow(at: indexPath, animated: true)
            return
        }
        self.performSegue(withIdentifier: identifier, sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case segueStr.book.ite:
            guard let controller = segue.destination as? BookingViewController else { return  }
//        case "":
//            guard let controller = segue.destination as? BookingViewController else { return  }
//        case "":
//        case "":
//        case "":
        default:
            return
        }
        //controller.username = self.username
    }
}

