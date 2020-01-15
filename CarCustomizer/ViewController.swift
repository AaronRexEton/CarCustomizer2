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
    
    var timeRemaining = 30
    var remainingFunds = 2000 {
        didSet {
            remainingFundsDisplay.text = "Remaining Funds: \(remainingFunds)"
            disableUnaffordablePackages()
        }
    }
    var starterCars = StarterCars()
    var timer: Timer?
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
        resetDisplay()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
        /*if remainingFunds < 500 {
            engineAndExhaustPackage.isEnabled = false
        }*/
    
    
    
    }
    
    func resetDisplay() {
        remainingFunds = 2000
        timeRemaining = 30
        engineAndExhaustPackage.setOn(false, animated: true)
        tiresPackage.setOn(false, animated: true)
        turboBoostPackage.setOn(false, animated: true)
        ultraSpeedPackage.setOn(false, animated: true)
        
        
    }
    
    func disableUnaffordablePackages() {
        engineAndExhaustPackage.isEnabled = shouldBeEnabled(engineAndExhaustPackage)
        tiresPackage.isEnabled = shouldBeEnabled(engineAndExhaustPackage)
        ultraSpeedPackage.isEnabled = shouldBeEnabled(ultraSpeedPackage)
        turboBoostPackage.isEnabled = shouldBeEnabled(turboBoostPackage)
    }
    
    func shouldBeEnabled(_ control: UISwitch) -> Bool {
        if control.isOn {
            return true
        } else {
            if remainingFunds >= 1500 {
                return true
            } else if remainingFunds >= 1000 {
                let name = control.accessibilityIdentifier
                if name == "UltraSpeedSwitch" {
                    return false
                } else {
                    return false
                }
                
            } else if remainingFunds >= 500 {
                let name = control.accessibilityIdentifier
                if name == "TurboBoostSwitch" && name == "UltraSpeedSwitch" {
                    return false
                } else {
                    return true
                }
            } else {
                return false
            }
        }
    }
    
    @IBOutlet var ultraSpeedPackage: UISwitch!
    
    @IBOutlet var turboBoostPackage: UISwitch!
    
    @IBOutlet var tiresPackage: UISwitch!
    
    @IBOutlet var engineAndExhaustPackage: UISwitch!
    
    @IBOutlet var RemainingTimeDisplay: UILabel!
    
    @IBAction func nextCar(_ sender: Any) {

        carIndex += 1
        
        if carIndex >= starterCars.cars.count {
            carIndex = 0
        }
        car = starterCars.cars[carIndex]
        resetDisplay()
       
    
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
        
        /* if remainingFunds <= 0 {
    
        } */
        if ultraSpeedPackage.isOn {
            car?.topSpeed += 20
            remainingFunds -= price
        } else {
            car?.topSpeed -= 20
            remainingFunds += price
            
        }
            
      
    }
    
    @objc func countdown() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            RemainingTimeDisplay.text = "\(timeRemaining)"
        } else {
            timer?.invalidate()
            ultraSpeedPackage.isEnabled = false
            tiresPackage.isEnabled = false

            turboBoostPackage.isEnabled = false

            engineAndExhaustPackage.isEnabled = false


            
            
        }
    }
    
}


