//
//  ParkedCarListViewController.swift
//  Light-G
//
//  Created by James Au on 2/2/2023.
//

import Foundation
import UIKit
class ParkedCarListViewController: UITableViewController {
    let CellID = "parkcarcell"
    var ParkCarList: [[String:Any]] = [["Name":"ifc carpark","address":"1st Finance str","DayTime":"202302061630","x":114.159422717148,"y":22.2852422938045],["Name":"BOC tower carpark","address":"23rd Cotton Tree Drive ","DayTime":"202302110830","x":114.1617166078604,"y":22.279246948238978]]
    var select = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ParkCarList.count
    }
    // Content of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)as? ParkedCarTableViewCell  else { return ParkedCarTableViewCell()}
        cell.NameLabel?.text = ParkCarList[indexPath.row]["Name"] as? String
        cell.DataLabel?.text = ParkCarList[indexPath.row]["DayTime"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.select = indexPath.row
        self.performSegue(withIdentifier: "findcarmap", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? FindCarViewController else { return  }
        controller.coordinate["x"] = ParkCarList[self.select]["x"] as? Double
        controller.coordinate["y"] = ParkCarList[self.select]["y"] as? Double

    }
}
