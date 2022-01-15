//
//  TrafficLightPresenter.swift
//  MVP Example
//
//  Created by Farido on 15/01/2022.
/*3
 TrafficLightViewDelegate protocol which contains all the methods that will be implemented in our view or (ViewContoller).
 We will use it when ever we want to pass an information from the presenter to the view. Here it will allow to send the information back to the view controller.
 */

protocol TrafficLightViewDelegate: NSObjectProtocol {
    func displayTrafficLight(des:(String))
}

import Foundation

/*4
 Then, we have the Presenter, the main component :
 Then presenter has two properties :
 The first one is the TrafficLightService. which is owned by the presenter.
 And the second is a weak Refenrece of the view delegate. since the presenter itself will be owned by the view (or the view controller)
 Then trafficLightColorSelected will be used to forward the event of selecting a trafic Color from the view to the presenter.
 
 */

class TrafficLightPresenter {
    
    private let trafficLightService: TrafficLightService
    weak var trafficLightViewDelegate: TrafficLightViewDelegate?
    
    init(trafficLightService:TrafficLightService){
        self.trafficLightService = trafficLightService
    }
    
    func setViewDelegate(trafficLightViewDelegate: TrafficLightViewDelegate?) {
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    func trafficLightColorSelected(colorName: (String)) {
        trafficLightService.getTrafficLight(colorName: colorName) { [weak self] trafficLight in
            
            if let trafficLight = trafficLight {
                self?.trafficLightViewDelegate?.displayTrafficLight(des: trafficLight.des)
            }
        }
    }
    
    
    
}
