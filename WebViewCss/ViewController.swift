//
//  ViewController.swift
//  WebViewJS
//
//  Created by Jackson, Ceri-anne (Associate Software Developer) on 24/11/2017.
//  Copyright © 2017 Jackson, Ceri-anne (Associate Software Developer). All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "showWebView", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton, let destination = segue.destination as? WebViewController {
           destination.colour = button.titleLabel?.text
        }
    }

}

