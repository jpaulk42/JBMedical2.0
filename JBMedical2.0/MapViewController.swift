//
//  MapViewController.swift
//  JBMedical2.0
//
//  Created by James Paulk on 4/28/17.
//  Copyright © 2017 James Paulk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController
{
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var jbMapView: MKMapView!
    
    private var open: String = ""
    private var calendar = Calendar(identifier: Calendar.Identifier.gregorian)
    
    override var preferredContentSize: CGSize
    {
        set
        {
            super.preferredContentSize = newValue
        }
        get
        {
            return containerView.sizeThatFits(containerView.bounds.size)
        }
    }

    override func viewDidLoad()
    {
        super.viewDidLoad()
        createMapViewWithAnnotationAndInfo()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
    
    private func createMapViewWithAnnotationAndInfo()
    {
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.005, 0.005)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(30.519991, -86.482561)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        jbMapView.setRegion(region, animated: false)
        
        let jbPin = MKPointAnnotation()
        jbPin.coordinate = location
        jbPin.title = "J&B Medical"
        
        jbMapView.addAnnotation(jbPin)
        jbMapView.selectedAnnotations = [jbPin]
    }
}
