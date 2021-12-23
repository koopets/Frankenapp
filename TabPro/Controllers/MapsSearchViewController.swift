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
        
        let mapView = MapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.mapView = mapView

        
        
//        let settings = MapInitOptions(styleURI: StyleURI(rawValue: "mapbox://styles/mapbox/satellite-streets-v11"))
        
        
        //mapView = MapView(frame: view.bounds, mapInitOptions: settings)
        
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
            //let options = CameraOptions(center: point.coordinates, zoom: 13)
            let cameraOptions = CameraOptions(center: point.coordinates, zoom: 15)
//            let settings = MapInitOptions(cameraOptions: cameraOptions, styleURI: .satelliteStreets)
//            mapView = MapView(frame: view.bounds, mapInitOptions: settings)
            
            mapView?.mapboxMap.setCamera(to: cameraOptions)
            
            mapView?.mapboxMap.onNext(.styleLoaded) { _ in
            // Center the map over New York City.

        }
         
        // Allows the delegate to receive information about map events.
            mapView?.mapboxMap.onNext(.mapLoaded) { _ in
        print("Animating zoom from zoom lvl 3 -> zoom lvl 14")
        startCameraAnimations()

        }
        
         
        // Start a chain of camera animations
        func startCameraAnimations() {
        // Declare an animator that changes the map's
            let bearingAnimator = mapView?.camera.makeAnimator(duration: 4, curve: .easeInOut) { (transition) in
        transition.bearing.toValue = -45
        }
         
            bearingAnimator?.addCompletion { (_) in
        print("All animations complete!")
        }
         
        // Declare an animator that changes the map's pitch.
            let pitchAnimator = mapView?.camera.makeAnimator(duration: 2, curve: .easeInOut) { (transition) in
        transition.pitch.toValue = 55
        }
         
        // Begin the bearing animation once the pitch animation has finished.
            pitchAnimator?.addCompletion { _ in
        print("Animating camera bearing from 0 degrees -> 45 degrees")
                bearingAnimator?.startAnimation()
        }
         
        // Declare an animator that changes the map's zoom level.
            let zoomAnimator = self.mapView?.camera.makeAnimator(duration: 4, curve: .easeInOut) { (transition) in
        transition.zoom.toValue = 14
        }
         
        // Begin the pitch animation once the zoom animation has finished.
            zoomAnimator?.addCompletion { _ in
        print("Animating camera pitch from 0 degrees -> 55 degrees")
                pitchAnimator?.startAnimation()
        }
         
        // Begin the zoom animation.
        zoomAnimator?.startAnimation(afterDelay: 1)
        }
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
