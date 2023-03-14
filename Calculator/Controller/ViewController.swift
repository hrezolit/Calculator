//
//  ViewController.swift
//  Calculator
//
//  Created by Nikita on 2/3/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private var isFinishedTyping: Bool = true
    
    private var displayValue: Double {
        
        get {
            guard let number = Double(mainDisplayLabel.text!) else { fatalError("Cannot convert label's text to Double") }
            return number
        }
        
        set {
            mainDisplayLabel.text = String(newValue)
        }
    }
    
    private var brain = CalcLogic()
    
    @IBOutlet weak var mainDisplayLabel: UILabel!
    
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        
        brain.setNumber(displayValue)
        
        if let result = brain.calculate(with: sender.tag) {
            displayValue = result
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTyping {
                
                mainDisplayLabel.text = numValue
                isFinishedTyping = false
            } else {
                
                if numValue == "." {
   
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                
                mainDisplayLabel.text = mainDisplayLabel.text! + numValue
            }
        }
    }
}
