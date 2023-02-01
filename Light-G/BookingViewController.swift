//
//  BookingViewController.swift
//  Light-G
//
//  Created by James Au on 30/1/2023.
//

import Foundation
import UIKit
class BookingViewController: UITableViewController {
    var Catalog: [[String:Any]] = [
        ["Name":"ifc carpark","address":"1st Finance str"],
    ["Name":"Murray road carpark","address":"1st Murray road parking"],
        ["Name":"BOC tower carpark","address":"23rd Cotton Tree Drive "]]
    let CellID = "bookingcell"
    var selectedItem:[String:Any] = [:]
    
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath)as? BookingTableViewCell  else { return BookingTableViewCell()
        }
        cell.AddressLabel?.text = Catalog[indexPath.row]["Name"] as? String
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItem = Catalog[indexPath.row]
        self.performSegue(withIdentifier: "parkdetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let controller = segue.destination as? BookingDetailViewController else { return  }
        var CatalogTemp: [[String:Any]] = []
        for (ItemTitle, internalValue) in selectedItem {
            let itr = ["Title":ItemTitle,
                       "Value":internalValue]
            
            CatalogTemp.append(itr)

        }
        CatalogTemp.append(["Title":"Book",
                            "Value":"Click here to book"])
//        print(CatalogTemp)
        controller.Catalog = CatalogTemp
    }

}
