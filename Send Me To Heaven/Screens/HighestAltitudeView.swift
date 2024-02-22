//
//  HighestAltitudeView.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/22/24.
//

import SwiftUI

struct HighestAltitudeView: View {
    let highestAltitude: Double

    var formattedAltitude: String {
        String(format: "%.3f m", highestAltitude) // "%.3f" formats to 3 decimal places
    }

    var body: some View {
        Text("Highest Altitude: \(formattedAltitude)")
            .font(.title)
            .padding()
    }
}
