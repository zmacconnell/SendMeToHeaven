//
//  Accelerometer.swift
//  Send Me To Heaven
//
//  Created by Zachary MacConnell on 2/1/24.
//

import Foundation
import CoreMotion

//let motion = CMMotionManager()

func startAccelerometers() {
    let id: UUID
    let motion = CMMotionManager()
    // Make sure the accelerometer hardware is available.
    if motion.isAccelerometerAvailable {
      motion.accelerometerUpdateInterval = 1.0 / 50.0  // 50 Hz
      motion.startAccelerometerUpdates()


       // Configure a timer to fetch the data.
       let timer = Timer(fire: Date(), interval: (1.0/50.0),
            repeats: true, block: { (timer) in
         // Get the accelerometer data.
         if let data = motion.accelerometerData {
            let x = data.acceleration.x
            let y = data.acceleration.y
            let z = data.acceleration.z


            // Use the accelerometer data in your app.
         }
      })


       // Add the timer to the current run loop.
       RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
   }
}

