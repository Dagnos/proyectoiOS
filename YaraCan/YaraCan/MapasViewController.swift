//
//  MapasViewController.swift
//  YaraCan
//
//  Created by Fernando Huarcaya Torres on 6/20/19.
//  Copyright © 2019 Fernando Huarcaya Torres. All rights reserved.
//

import UIKit
import MapKit

class MapasViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var ubicacion = CLLocationManager()
    var contActualizaciones = 0
    override func viewDidLoad() {
        addAnnotations()
        super.viewDidLoad()
        ubicacion.delegate = self
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            ubicacion.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            ubicacion.startUpdatingLocation()
        }else{
            ubicacion.requestWhenInUseAuthorization()
        }
    }
    

    @IBAction func centrarTapped(_ sender: Any) {
        if let coord = ubicacion.location?.coordinate{
            let region = MKCoordinateRegion.init(center: coord, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            contActualizaciones += 1
        }
    }
    private func addAnnotations() {
        let veterinaria1 = MKPointAnnotation()
        veterinaria1.title = "Veterinaria Pegaloco"
        veterinaria1.coordinate = CLLocationCoordinate2D(latitude: -16.4265, longitude: -71.5176)
        
        let veterinaria2 = MKPointAnnotation()
        veterinaria2.title = "Veterinaria Chihuahua"
        veterinaria2.coordinate = CLLocationCoordinate2D(latitude: -16.4342, longitude: -71.5223)
        
        mapView.addAnnotation(veterinaria1)
        mapView.addAnnotation(veterinaria2)
    }
}
