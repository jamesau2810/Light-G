//
//  ReservedCarLotViewController.swift
//  Light-G
//
//  Created by James Au on 2/2/2023.
//

import Foundation
import UIKit
class ReservedCarLotViewController: UITableViewController {
    let CellID = "booklotcell"
    var bookLotList:[[String:Any]] = [["Name":"ifc carpark","address":"1st Finance str","DayTime":"202302061630","x":114.159422717148,"y":22.2852422938045],["Name":"BOC tower carpark","address":"23rd Cotton Tree Drive ","DayTime":"202302110830","x":114.1617166078604,"y":22.279246948238978]]
    var select = 0
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
        return bookLotList.count
    }
    // Content of the cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)as? ReservedCarLotTableViewCell else { return ReservedCarLotTableViewCell()}
        cell.NameLabel?.text = bookLotList[indexPath.row]["Name"] as? String
        cell.DataLabel?.text = bookLotList[indexPath.row]["DayTime"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.select = indexPath.row
        self.performSegue(withIdentifier: "findlotmap", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? FindParkLotViewController else { return  }
        controller.coordinate["x"] = bookLotList[self.select]["x"] as! Double
        controller.coordinate["y"] = bookLotList[self.select]["y"] as! Double
        
    }
}
