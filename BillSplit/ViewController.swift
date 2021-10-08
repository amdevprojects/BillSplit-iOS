//
//  ViewController.swift
//  BillSplit
//
//  Created by Ashutosh on 04/10/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var amountInput: UITextField!
    
    @IBOutlet weak var splitCount: UILabel!
    
    @IBOutlet weak var btnZeroPercent: UIButton!
    @IBOutlet weak var btnTenPercent: UIButton!
    @IBOutlet weak var btnTwentyPercent: UIButton!
    
    var tipPercent = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTipPercentPressed(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            btnZeroPercent.backgroundColor = UIColor.white
            btnTenPercent.backgroundColor = UIColor.clear
            btnTwentyPercent.backgroundColor = UIColor.clear
            tipPercent = 0
        } else if sender.currentTitle == "10%" {
            btnZeroPercent.backgroundColor = UIColor.clear
            btnTenPercent.backgroundColor = UIColor.white
            btnTwentyPercent.backgroundColor = UIColor.clear
            tipPercent = 10
        } else if sender.currentTitle == "20%" {
            btnZeroPercent.backgroundColor = UIColor.clear
            btnTenPercent.backgroundColor = UIColor.clear
            btnTwentyPercent.backgroundColor = UIColor.white
            tipPercent = 20
        }
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        splitCount.text = String.init(Int.init(sender.value))
    }
    
    @IBAction func onCalculateBtnPressed(_ sender: UIButton) {
        let amount: Float = Float(amountInput.text ?? "0") ?? 0.0
        if amount < 1 {
            let alert = UIAlertController.init(title: "Error", message: "Please enter amount", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        self.performSegue(withIdentifier: "navigateToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navigateToResult" {
            let amount: Float = Float(amountInput.text ?? "0") ?? 0.0
            let tip: Float = Float(amount) / 100.0 * Float(tipPercent)
            let split: Float = Float(Int(splitCount.text ?? "0") ?? 0)
            let finalAmount: Float = (amount + tip) / split
            let viewController = segue.destination as? ResultViewController
            viewController?.amountPerPerson = finalAmount
        }
    }
}

