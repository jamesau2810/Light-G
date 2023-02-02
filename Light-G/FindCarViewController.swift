//
//  FindCarViewController.swift
//  Light-G
//
//  Created by James Au on 2/2/2023.
//

import Foundation
import UIKit
import MapKit

class FindCarViewController: UIViewController {
    @IBOutlet private var mapView: MKMapView!
    override func viewDidLoad() {
        // 114.18401810520214,
        // 22.279806493039132
        let initialLocation = CLLocation(latitude: 22.279806493039132, longitude:114.18401810520214)
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
