//
//  FindParkLotViewController.swift
//  Light-G
//
//  Created by James Au on 2/2/2023.
//

import Foundation
import UIKit
import MapKit

class FindParkLotViewController: UIViewController {
    var coordinate: [String: Double] = ["x":114.18401810520214,"y":22.279806493039132]
    @IBOutlet private var mapView: MKMapView!
    override func viewDidLoad() {
        // 114.18401810520214,
        // 22.279806493039132
        let initialLocation = CLLocation(latitude: coordinate["y"] ?? 0.0, longitude:coordinate["x"] ?? 0.0)
        mapView.centerToLocation(initialLocation)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

}
private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 100//20
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
