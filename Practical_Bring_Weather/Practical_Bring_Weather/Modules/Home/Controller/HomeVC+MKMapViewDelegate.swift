//
//  HomeVC+MKMapViewDelegate.swift
//  Practical_Bring_Weather
//

import MapKit

//MARK: - MyPointAnnotation Class
class MyPointAnnotation: MKPointAnnotation {

    var identifier: String?
    var lat: Double!
    var lon: Double!
}

//MARK: - MKMapView Delegate Extension
extension HomeVC : MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {

        guard !(annotation is MKUserLocation) else {
            return nil
        }

        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView?.pinTintColor = UIColor.red
            pinView?.canShowCallout = true
        } else {
            pinView?.annotation = annotation
        }

        return pinView
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
    }
    
    internal func addAnnotationPin(city: String, lat: Double, lon: Double) {

        let myPin = MyPointAnnotation()
        myPin.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        myPin.title = city
        myPin.identifier = UUID().uuidString
        myPin.lat = lat
        myPin.lon = lon

        for annotation in mapView.annotations {
            if let title = annotation.title, title == city {
                mapView.removeAnnotation(annotation)
            }
        }

        mapView.addAnnotation(myPin)
    }
}
