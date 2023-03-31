//
//  AppInfoViewController.swift
//  BTC Converter
//
//  Created by Dinesh Sharma on 28/03/23.
//

import UIKit

class AppInfoViewController: UIViewController {

    @IBOutlet weak var lblInfo: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
        lblInfo.text = """
        Are you a crypto Enthusiastic??
        If Yes, then here is the perfect application for you to save your lots and lots of time.
        Using this app can help you to convert any currency with reference to BitCoin.
        Now there is no need to search on any search engine like "How many rupees in one Bitcoin?"
        This app is also equiped with a reverse calculator which can calculate how many BTC are there in amout of your desired currency.
        All those task will be done by this application in one click.
        Check this out!
        """
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    
    

}
