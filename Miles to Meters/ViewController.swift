//
//  ViewController.swift
//  Miles to Meters
//
//  Created by Santiago Blandon on 4/14/19.
//  Copyright © 2019 fsblandon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var distancia: UITextField!
    
    @IBOutlet var typeSegmented: UISegmentedControl!
    
    @IBOutlet var resultLabel: UILabel!
    
    let mileUnit: Double = 1.609
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = "Distance to convert"
        // Do any additional setup after loading the view.
    }

    @IBAction func convertDistance(_ sender: UIButton) {
        let selectedIndex = typeSegmented.selectedSegmentIndex
        let textField = Double(distancia.text!)!
        
        if(textField == 0) {
            let alert = UIAlertController(title: "Field distance", message: "Field is empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true)
        }
        
        let initValue = String(format: "%.2f", textField)
        let endValue1 = String(format: "%.2f", textField / mileUnit)
        let endValue2 = String(format: "%.2f", textField * mileUnit)
        
        if(selectedIndex == 0) {
            resultLabel.text = "\(initValue) km =  \(endValue1) miles"
        } else if selectedIndex == 1 {
            resultLabel.text = "\(initValue) miles = \(endValue2) km"
        } else {
            print("nothing")
        }
        
    }
    
    // 11
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.view.endEditing(true)
        
        return true
        
    }
    
}

