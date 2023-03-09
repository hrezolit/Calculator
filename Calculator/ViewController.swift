//
//  ViewController.swift
//  Calculator
//
//  Created by Nikita on 2/3/23.
//

import UIKit

final class ViewController: UIViewController {
    
    private var isFinishedTyping: Bool = true

    @IBOutlet weak var mainDisplayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishedTyping = true
        guard let number = Double(mainDisplayLabel.text!) else { return }
        
        switch sender.tag {
        case 1:
            mainDisplayLabel.text = "0"
        case 2:
            mainDisplayLabel.text = "\(number * -1)"
        case 3:
            mainDisplayLabel.text = "\(number * 0.01)"
        case 4:
            mainDisplayLabel.text = ""
        case 5:
            mainDisplayLabel.text = ""
        case 6:
            mainDisplayLabel.text = ""
        case 7:
            mainDisplayLabel.text = ""
        case 8:
            mainDisplayLabel.text = ""
        default:
            print("invalid insert")
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        guard let number = sender.currentTitle else { return }
        if isFinishedTyping {
            mainDisplayLabel.text = number
            isFinishedTyping = false
        } else {
            mainDisplayLabel.text = mainDisplayLabel.text! + number
        }
    }
    
    
}

