//
//  ViewController.swift
//  Core Location en iOS
//
//  Created by alumno on 6/04/17.
//  Copyright © 2017 alumno. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate{

    let manager = CLLocationManager()

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        
        manager.distanceFilter = 5
        
        
        manager.delegate = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnActivarTouch(_ sender: UIButton) {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse {
            manager.requestWhenInUseAuthorization()
        }
        
        //manager.startUpdatingLocation();
    }
    
    @IBAction func btnSolicitarTouch(_ sender: UIButton) {
        
        //manager.requestLocation()
        let ubicacion = manager.location
        let coordenadas = ubicacion?.coordinate
        textView.text = textView.text + "Ubicacion solicitada: \n  [\( (coordenadas?.latitude)! ) , \(  (coordenadas?.longitude)! )]"
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedAlways ||  status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let ubicacion = locations[0]
        let coordenadas = ubicacion.coordinate
        
        textView.text = textView.text + " \n  [\(coordenadas.latitude) , \(coordenadas.longitude)]    "
        
        //print("\(locations[0].coordinate.latitude) , \(locations[0].coordinate.longitude)")
        
        //print("Actualizo ubicacion")
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
    }
    
    


}

