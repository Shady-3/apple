//
//  MapController.swift
//  Kiwix
//
//  Created by Chris Li on 5/21/20.
//  Copyright © 2020 Chris Li. All rights reserved.
//

import MapKit
import SwiftUI

@available(iOS 13.0.0, *)
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 12.9716, longitude: 77.5946)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
}

@available(iOS 13.0.0, *)
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
