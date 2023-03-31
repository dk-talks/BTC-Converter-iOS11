//
//  HomeViewController.swift
//  BTC Converter
//
//  Created by Dinesh Sharma on 28/03/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var btcLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        btcLogo.layer.cornerRadius = 100
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    
}
