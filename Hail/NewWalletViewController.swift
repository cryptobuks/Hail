//
//  NewWalletViewController.swift
//  Hail
//
//  Created by Harsha Goli on 8/3/17.
//  Copyright © 2017 Harsha Goli. All rights reserved.
//

import Foundation
import UIKit

class NewWalletViewController: UIViewController {
    
    @IBOutlet weak var litecoinSelectedHue: UIView!
    
    @IBOutlet weak var bitcoinSelectedHue: UIView!
    
    var network: String = "null"
    
    let dataManager = DataManager()
    
    @IBOutlet weak var walletNameField: UITextField!

    @IBOutlet weak var importWalletMasterKeyField: UITextField!
    
    
    
    @IBAction func importWallet(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            let name = self.walletNameField.text
            let masterkey = self.importWalletMasterKeyField.text
            let network = self.network
            
        })
    }
    
    @IBAction func newWalletCreated(_ sender: Any) {
        self.dismiss(animated: true, completion: {
            let name = self.walletNameField.text
            let network = self.network
            self.dataManager.addWallet(name: name!, network: network)
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load"), object: nil)

        })
        
    }
    
    
    @IBAction func bitcoinSelected(_ sender: Any) {
        selectCoin(network: "Bitcoin")
        //self.performSegue(withIdentifier: "NewWallet", sender: self)

    }
    
    @IBAction func litecoinSelected(_ sender: Any) {
        selectCoin(network: "Litecoin")

        //self.performSegue(withIdentifier: "NewWallet", sender: self)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        litecoinSelectedHue.backgroundColor = UIColor.clear
        bitcoinSelectedHue.backgroundColor = UIColor.clear
    }
    
    func selectCoin(network: String) {
        litecoinSelectedHue.backgroundColor = UIColor.clear
        bitcoinSelectedHue.backgroundColor = UIColor.clear
        network = network
        if(network == "Bitcoin") {
            bitcoinSelectedHue.backgroundColor = UIColor.blue
        }
        else if (network == "Litecoin") {
            litecoinSelectedHue.backgroundColor = UIColor.blue
        }
        
    }
    
}
