//
//  Altimeter.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/6/24.
//

import Foundation
import CoreMotion
import SwiftUI


class AltitudeManager: ObservableObject {
    @Published var highestAltitude: Double = 0
    @Published var isTrackingAltitude: Bool = false
    let altimeter = CMAltimeter()

    func startTrackingAltitude() {
        guard CMAltimeter.isRelativeAltitudeAvailable() else {
            print("Relative altitude is not available on this device.")
            return
        }

        isTrackingAltitude = true

        altimeter.startRelativeAltitudeUpdates(to: OperationQueue.main) { [weak self] (data, error) in
            guard let self = self else { return }

            if let altitudeData = data {
                let relativeAltitude = altitudeData.relativeAltitude.doubleValue
                // Update highest altitude if new altitude is greater
                self.highestAltitude = max(self.highestAltitude, relativeAltitude)
                print("Current highest altitude: \(self.highestAltitude)")
            } else if let error = error {
                print("Altitude update error: \(error.localizedDescription)")
            }
        }
    }

    func stopTrackingAltitude() {
        isTrackingAltitude = false
        altimeter.stopRelativeAltitudeUpdates()
    }
}

// Usage
// let altitudeManager = AltitudeManager()
// altitudeManager.startTrackingAltitude()

// After the journey or when the altitude tracking is no longer needed
// altitudeManager.stopTrackingAltitude()
