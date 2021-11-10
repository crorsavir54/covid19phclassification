//
//  MapInformationView.swift
//  classification
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation
import CoreLocation
import MapKit

final class MapInformationViewModel: NSObject, CLLocationManagerDelegate {
    
    
    var location: Observable<Location> = Observable(Location(name: "No Location",
                                                             classification: Classification(name: "No Classification",
                                                                                            description: "", activities: [])))
    
    private var locationManager: CLLocationManager?
    private var geocoder = CLGeocoder()
    var region = MKCoordinateRegion(center: MapDetails.defaultCenter,
                                    span: MapDetails.defaultSpan)
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        } else {
            print("Alert")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Restricted")
        case .denied:
            print("Location denied, to use the app you need to change your location settings")
        case .authorizedAlways,.authorizedWhenInUse:
            locationManager.startUpdatingLocation()
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            checkLocationAuthorization()
            // Not optimal since always called, for demo purposes only
            // so that I won't need to close and open the app to update location
            let place = CLLocation(latitude: location.coordinate.latitude,
                                   longitude: location.coordinate.longitude)
            region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude),
                                        span: MapDetails.defaultSpan)
            self.geocoder.reverseGeocodeLocation(place) { (placemarks, error) in
                self.processResponse(withPlacemarks: placemarks, error: error)
            }
        }
    }
    
    private func processResponse(withPlacemarks placemarks: [CLPlacemark]?, error: Error?) {
        if let error = error {
            print("Unable to Reverse Geocode Location (\(error)")
        } else {
            if let placemarks = placemarks, let placemark = placemarks.first {
                let provinceNameFromMap = placemark.administrativeArea!
                let classification = self.classification(of: provinceNameFromMap)
                self.location.value = Location(name: placemark.administrativeArea!, classification: classification)
            }
        }
    }
    
    // From the user administrativeArea location, compare to locations in firestore repository.
    private func classification(of province: String) -> Classification {
        if let index = LocationRepository.shared.locations.firstIndex(where: {$0.name == province}) {
            return LocationRepository.shared.locations[index].classification
        } else {
            print("No available data")
            return Classification(name: "No available data", description: "No available data", activities: [])
        }
    }
}

//Default locations (for testing)
enum MapDetails {
    static let defaultCenter = CLLocationCoordinate2D(latitude: 9.076155, longitude: 126.196718)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
}
