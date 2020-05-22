//
//  MapController.swift
//  Kiwix
//
//  Created by Chris Li on 5/21/20.
//  Copyright © 2020 Chris Li. All rights reserved.
//

import MapKit
import SwiftUI

@available(iOS 13.0, *)
struct ContentView: View {
    var body: some View {
        return MapView().edgesIgnoringSafeArea(.all)
    }
}

@available(iOS 13.0, *)
struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ view: MKMapView, context: Context) {
        let coordinate = CLLocationCoordinate2D(latitude: 42.361145, longitude: -71.057083)
        let span = MKCoordinateSpan(latitudeDelta: 2.0, longitudeDelta: 2.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        view.setRegion(region, animated: true)
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator(mapView: self)
    }
}

@available(iOS 13.0, *)
class MapViewCoordinator: NSObject, MKMapViewDelegate {
    private let mapView: MapView

    init(mapView: MapView) {
        self.mapView = mapView
    }
    
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print(mapView.centerCoordinate)
    }
}

@available(iOS 13.0, *)
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

@available(iOS 13.0, *)
class MapController: UIHostingController<ContentView> {
    init() {
        super.init(rootView: ContentView())
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
