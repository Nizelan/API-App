//
//  TryTooTutorial.swift
//  API App
//
//  Created by Nizelan on 09.06.2020.
//  Copyright © 2020 Nizelan. All rights reserved.
//

import Foundation
import MapKit

class Tutorial: NSObject, MKAnnotation {
    let title: String?
    let placeUa: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title: String?, placeUa: String?, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.placeUa = placeUa
        self.coordinate = coordinate
    }
    
    var subtitle: String? {
        return placeUa
    }
}
