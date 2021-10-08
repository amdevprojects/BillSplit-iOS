//
//  ResultViewController.swift
//  BillSplit
//
//  Created by Ashutosh on 07/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    var amountPerPerson: Float = 0.0
    
    @IBOutlet weak var amountPerPersonLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        amountPerPersonLabel.text = "Amount per person is \(amountPerPerson)"
    }
    
    @IBAction func onRecalculateBtnPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
