//
//  AltitudeTrackerView.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/10/24.
//

import SwiftUI

struct AltitudeTrackerView: View {
    @StateObject var altitudeManager = AltitudeManager()

    var body: some View {
        VStack {
            Text("Highest Altitude: \(altitudeManager.highestAltitude)")
                .padding()
            
            Button(action: {
                if !altitudeManager.isTrackingAltitude {
                    altitudeManager.startTrackingAltitude()
                }
            }) {
                Text("Start Altitude Tracking")
                    .padding()
            }
            
            Button(action: {
                altitudeManager.stopTrackingAltitude()
            }) {
                Text("Stop Altitude Tracking")
                    .padding()
            }
        }
    }
}
