//
//  TouristPlacesMapView.swift
//  CWK2Template
//
//  Created by girish lukka on 29/10/2023.
//
import SwiftUI
import CoreLocation
import MapKit

struct TouristPlacesMapView: View {
    @EnvironmentObject var weatherMapViewModel: WeatherMapViewModel
    @State private var locations: [Location] = []
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.5216871, longitude: -0.1391574), latitudinalMeters: 600, longitudinalMeters: 600)
    
    
    

    var body: some View {
        NavigationView {
            
            
            VStack {
                VStack(spacing: 5) {
                    if weatherMapViewModel.coordinates != nil {
                        
                        Map(coordinateRegion: $mapRegion, showsUserLocation: true, annotationItems: locations) { location in
                            MapMarker(coordinate: location.coordinates)
                        }
                        
                        
                        
                        
                        Text("Tourist Attractions in \(weatherMapViewModel.city)")
                            .font(.title2)
                            .padding()
                        
                        List{
                            if !locations.isEmpty{
                                ForEach(locations) { location in
                                    NavigationLink(destination: LocationDetailView(location: location)) {
                                        HStack(spacing: 25) {
                                            VStack(alignment: .leading) {
                                                Image(location.imageNames[0])
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fill)
                                                    .frame(width: 100, height: 100)
                                                    .cornerRadius(8)
                                            }
                                            
                                            VStack {
                                                Text(location.name)
                                                    .font(.subheadline)
                                                    .foregroundColor(.secondary)
                                            }
                                        }
                                        .padding(.bottom, 5)
                                    }
                                    
                                    .padding(.bottom, 5)
                                    
                                }
                            } else{
                                Text("There are no attractions for \(weatherMapViewModel.city)")
                            }
                        }.ignoresSafeArea()
                        
                            .listStyle(.plain)
                    }
                }
                .frame(height: 700)
                
            }.ignoresSafeArea()
                .onAppear {
                    locations = weatherMapViewModel.loadLocationsFromJSONFile(cityName: weatherMapViewModel.city) ?? []
                    mapRegion = weatherMapViewModel.region
                    
                }
        }
    }
}


