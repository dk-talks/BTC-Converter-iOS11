//
//  DetailViewController.swift
//  BTC Converter
//
//  Created by Dinesh Sharma on 28/03/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var lblDetails: UILabel!
    
    var currentValue: String?
    var currencyname: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let value = currentValue, let currency = currencyname {
            lblDetails.text = "1 Bitcoin is equal to \(value) \(currency)"
        }
    }
    
    
    
    @IBAction func btnReversedPressed(_ sender: Any) {
     
        if let reverseVC = self.storyboard?.instantiateViewController(withIdentifier: "ReverseVC") as? ReverseViewController {
            
            if let value = currentValue, let currency = currencyname {
                reverseVC.receivedAmount = value
                reverseVC.receivedCurrencyName = currency
                
                self.navigationController?.pushViewController(reverseVC, animated: true)
                
            }
            
            
        }
        
    }
    
}
