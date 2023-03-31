//
//  ViewController.swift
//  BTC Converter
//
//  Created by Dinesh Sharma on 28/03/23.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    var coinManager = CoinManager()
    
    
    @IBOutlet weak var btnShowDetail: UIButton!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var bitCoinLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var selectedCurrency: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnShowDetail.isEnabled = false
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
    }
    
    
    @IBAction func btnShowDetailPressed(_ sender: Any) {
        
        if let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            
            detailsVC.currentValue = bitCoinLabel.text
            detailsVC.currencyname = currencyLabel.text
            self.navigationController?.pushViewController(detailsVC, animated: true)
        }
        
    }
    
}

//MARK: - CoinManagerDelegate

extension ViewController: CoinManagerDelegate {
    
    func updateUI(price: Double){
        DispatchQueue.main.async {
            self.bitCoinLabel.text = String(format: "%.1f", price)
            self.currencyLabel.text = self.selectedCurrency
            self.btnShowDetail.isEnabled = true
        }
    }
}

//MARK: - UIPickerViewDataSource

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }
}

