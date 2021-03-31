//
//  CardsViewController.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import UIKit
import WebKit

class CardsViewController: UIViewController {

    @IBOutlet weak var cardsTableView: UITableView!
    @IBOutlet weak var cardsWebview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
}

