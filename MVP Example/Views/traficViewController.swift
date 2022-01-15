//
//  ViewController.swift
//  MVP Example
//
//  Created by Farido on 15/01/2022.
//
//And finally here is our traficViewController. which is now nothing more than a view.
//

import UIKit

class traficViewController: UIViewController,TrafficLightViewDelegate {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
    }
    
    @IBAction func redLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "RED")
    }
    
    @IBAction func yellowLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Yellow")
    }
    
    @IBAction func greenLightAction(_ sender: Any) {
        trafficLightPresenter.trafficLightColorSelected(colorName: "Green")
    }
    
    func displayTrafficLight(des: (String)) {
        descriptionLabel.text = des
    }
    
    
}

