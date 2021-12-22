//
//  MapBoxViewController.swift
//  TabPro
//
//  Created by vasili kuptsov on 22.12.21.
//

import UIKit
import MapboxSearch
import MapboxSearchUI
import MapboxMaps
 
class MapsSearchViewController: UIViewController {
let searchController = MapboxSearchController()

var mapView: MapView?
var annotationManager: PointAnnotationManager?
    
override func viewDidLoad() {
super.viewDidLoad()
    
    var mapView = MapView(frame: view.bounds)
    mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    self.mapView = mapView
    
    let options = MapInitOptions(styleURI: StyleURI(rawValue: "mapbox://styles/mapbox/streets-v11"))
    mapView = MapView(frame: view.bounds, mapInitOptions: options)
    
    view.addSubview(mapView)
    
    annotationManager = mapView.annotations.makePointAnnotationManager()
    
searchController.delegate = self
let panelController = MapboxPanelController(rootViewController: searchController)
addChild(panelController)
}
 
func showResults(_ results: [SearchResult]) {
let annotations = results.map { searchResult -> PointAnnotation in
var annotation = PointAnnotation(coordinate: searchResult.coordinate)
annotation.textField = searchResult.name
annotation.textOffset = [0, -2]
annotation.textColor = StyleColor(.red)
annotation.image = .init(image: UIImage(named: "red_pin")!, name: "red_pin")
return annotation
}
 
annotationManager?.annotations = annotations
if let point = annotations.first?.point {
let options = CameraOptions(center: point.coordinates)

mapView?.mapboxMap.setCamera(to: options)
   
}
}
}

 
extension MapsSearchViewController
: SearchControllerDelegate {
    func categorySearchResultsReceived(results: [SearchResult]) {
    showResults(results)
    }
     
    func searchResultSelected(_ searchResult: SearchResult) {
    showResults([searchResult])
    }
     
    func userFavoriteSelected(_ userFavorite: FavoriteRecord) {
    showResults([userFavorite])
    }
    }
//MARK: - STYLES

//class CustomStyle: DayStyle {
//    required init() {
//        super.init()
//        mapStyleURL = URL(string: "mapbox://styles/mapbox/satellite-streets-v11")!
////        mapStyleURL = URL(string: "mapbox://styles/mapbox/streets-v11")!
////        mapStyleURL = URL(string: "mapbox://styles/mapbox/outdoors-v11")!
////        mapStyleURL = URL(string: "mapbox://styles/mapbox/satellite-v9")!
//        styleType = .day
//    }
