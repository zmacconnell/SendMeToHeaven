//
//  AltitudeView.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/6/24.
//

import SwiftUI

struct AltitudeView: View {
    @ObservedObject var altitudeManager: AltitudeManager

    var body: some View {
        VStack {
            Text("Highest Altitude: \(String(format: "%.2f", altitudeManager.highestAltitude)) meters")
                .font(.title)
                .padding()

            Button(action: {
                // Start or stop altitude updates based on the current tracking status
                if altitudeManager.isTrackingAltitude {
                    altitudeManager.stopTrackingAltitude()
                } else {
                    altitudeManager.startTrackingAltitude()
                }
            }) {
                Text(altitudeManager.isTrackingAltitude ? "Stop Tracking" : "Start Tracking")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
