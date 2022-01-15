//
//  TrafficLightService.swift
//  MVP Example
//
//  Created by Farido on 15/01/2022.
/*
 2
 A service class which will play the role of data provider. As we mainly use web services in real applications. It simply returns a model by its name.
 */
import Foundation


class TrafficLightService {
    func getTrafficLight(colorName:(String), callBack:(TrafficLight?) -> Void) {
        
        let trafficLight = [TrafficLight(colorName: "RED", des: "Stop"),
                            TrafficLight(colorName: "Green", des: "GO"),
                            TrafficLight(colorName: "Yellow", des: "About to change to red")]
        
        if let foundTrafficLight = trafficLight.first(where: {$0.colorName == colorName}) {
            callBack(foundTrafficLight)
        }else {
            callBack(nil)
        }
        
    }
}


