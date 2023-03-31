//
//  ReverseViewController.swift
//  BTC Converter
//
//  Created by Dinesh Sharma on 28/03/23.
//

import UIKit

class ReverseViewController: UIViewController, UITextFieldDelegate {
    
    var receivedAmount: String?
    var receivedCurrencyName: String?
    
    @IBOutlet weak var lblEnterAmount: UILabel!
    @IBOutlet weak var txtAmount: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        txtAmount.delegate = self
        
        lblEnterAmount.text = "Enter Amount in \(receivedCurrencyName!): "
        print("amout receivied: \(receivedAmount)")

        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let x = string.rangeOfCharacter(from: NSCharacterSet.decimalDigits) {
            return true
        } else {
            return false
        }
    }
    
    
    @IBAction func btnCalculatepressed(_ sender: Any) {
        
        if let amountEntered = txtAmount.text, let amountReceived = receivedAmount  {
            
            
            
            let answer = Float(amountEntered)!/Float(amountReceived)!

            lblResult.text = "\(amountEntered) \(receivedCurrencyName!) is equal to \(answer) BitCoin"
            txtAmount.text = ""
            
        }
        
        
    }
    
    
    
    
}
