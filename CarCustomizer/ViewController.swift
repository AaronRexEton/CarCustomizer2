//
//  ViewController.swift
//  CarCustomizer
//
//  Created by Aaron Rex on 12/01/2020.
//  Copyright © 2020 Aaron Rex. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var carStatistics: UILabel!
    
    var remainingFunds = 2000 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
        }
    }
    var starterCars = StarterCars()
    var carIndex = 2
    var car: Car? {
        didSet {
        carStatistics.text = car?.displayStats()
        
        }
    }
    
    @IBOutlet var remainingFundsDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        car = starterCars.cars[carIndex]
        remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
        
        /*if remainingFunds < 500 {
            engineAndExhaustPackage.isEnabled = false
        }*/
    
    
    }
    
    @IBOutlet var ultraSpeedPackage: UISwitch!
    
    @IBOutlet var turboBoostPackage: UISwitch!
    
    @IBOutlet var tiresPackage: UISwitch!
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    
    
    @IBAction func nextCar(_ sender: Any) {

        carIndex += 1
        
        if carIndex >= starterCars.cars.count {
            carIndex = 0
        }
        car = starterCars.cars[carIndex]
        
       
    
    }
    

    func checkFunds() {
        if remainingFunds < 500 {
            engineAndExhaustPackage.isEnabled = false
             tiresPackage.isEnabled = false
        } else if remainingFunds >= 500 {
            engineAndExhaustPackage.isEnabled = true
            tiresPackage.isEnabled = true
        }
        
        if remainingFunds < 1500 {
            ultraSpeedPackage.isEnabled = false
        } else if remainingFunds >= 1500 {
            ultraSpeedPackage.isEnabled = true
        }
        if remainingFunds < 1000 {
                   turboBoostPackage.isEnabled = false
        } else if remainingFunds >= 1000{
                   turboBoostPackage.isEnabled = true
               }
        
    }
    
    
   
    
    func updateDisplay() {
        carStatistics.text = car?.displayStats()
    }

    @IBAction func engineAndExhaustToggle(_ sender: Any) {
        let price = 500
        checkFunds()
         /*if remainingFunds < price {
            engineAndExhaustPackage.isEnabled = false
        }*/
        
        if engineAndExhaustPackage.isOn {
            car?.topSpeed += 5
            remainingFunds -= price
        } else {
            car?.topSpeed -= 5
            remainingFunds += price
        
        }
        
    }

    
    @IBAction func tiresPackageToggle(_ sender: Any) {
        
        let price = 500
        checkFunds()
        /*if remainingFunds < price {
            tiresPackage.isEnabled = false
        
        } else {
            tiresPackage.isEnabled = true
        }*/
        
        if tiresPackage.isOn {
                car?.handling += 1
                remainingFunds -= price
            } else {
                car?.handling -= 1
                remainingFunds += price
            
        }
    }
    
    
    @IBAction func turboBoostPackageToggle(_ sender: Any) {
        let price = 1000
        checkFunds()
         /*if remainingFunds < price {
            turboBoostPackage.isEnabled = false
        } else {
            turboBoostPackage.isEnabled = true
        }*/
        
        if turboBoostPackage.isOn {
            car?.acceleration /= 2
            remainingFunds -= price
        } else {
            car?.acceleration *= 2
            remainingFunds += price
        }
    }
    
    
    @IBAction func ultraSpeedPackageToggle(_ sender: Any) {
        let price = 1500
        checkFunds()
        
        /*if remainingFunds <= 0 {
    
        } */
        if ultraSpeedPackage.isOn {
            car?.topSpeed += 20
            remainingFunds -= price
        } else {
            car?.topSpeed -= 20
            remainingFunds += price
            
        }
            
      
    }
    
    
}


