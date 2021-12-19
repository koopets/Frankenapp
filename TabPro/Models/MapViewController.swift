//
//  FifthViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 5.12.21.
//

import UIKit
import MapKit
import FloatingPanel

class MapViewController: UIViewController, SearchViewControllerDelegate {
    
    let panel = FloatingPanelController()
    private let mapView = MKMapView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.frame = view.bounds
        mapView.mapType = .satelliteFlyover
        view.addSubview(mapView)
        title = "Map"
        
        let searchVC = SearchViewController()
        searchVC.delegate = self
        
        panel.set(contentViewController: searchVC)
        panel.addPanel(toParent: self)
        
        
        mapView.showsCompass = false  // Hide built-in compass
        
        let compassButton = MKCompassButton(mapView: mapView)
        compassButton.compassVisibility = .visible
        
        
        mapView.addSubview(compassButton)
        
        
        compassButton.translatesAutoresizingMaskIntoConstraints = false
        compassButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -12).isActive = true
        compassButton.topAnchor.constraint(equalTo: mapView.topAnchor, constant: 50).isActive = true
        
    }
    
    
    
    func searchViewController(_vc: SearchViewController, didSelectLocationWith coordinates: CLLocationCoordinate2D?) {
        
        guard let coordinates = coordinates else {
            return
        }
        panel.move(to: .tip, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = coordinates
        mapView.addAnnotation(pin)
        
        mapView.setRegion(MKCoordinateRegion(center: coordinates, span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)), animated: true)
    }
}
