//
//  AltitudeView.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/6/24.
//

import SwiftUI

struct AltitudeView: View {
    @StateObject var altitudeManager = AltitudeManager()
    @State private var showingHighestAltitude = false

    var body: some View {
        VStack {
            Text("Highest Altitude: \(altitudeManager.highestAltitude)")
                .padding()

            Button(action: {
                if altitudeManager.isTrackingAltitude {
                    let highestAltitude = altitudeManager.stopTrackingAltitude()
                    showingHighestAltitude = true
                } else {
                    altitudeManager.startTrackingAltitude()
                }
            }) {
                Text(altitudeManager.isTrackingAltitude ? "Stop Tracking" : "Start Tracking")
                    .padding()
            }
        }
        .sheet(isPresented: $showingHighestAltitude) {
            HighestAltitudeView(highestAltitude: altitudeManager.highestAltitude)
        }
        .onAppear {
            altitudeManager.startTrackingAltitude()
        }
        .onDisappear {
            altitudeManager.stopTrackingAltitude()
        }
    }
}
