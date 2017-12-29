//
//  ViewController.swift
//  Loadmation
//
//  Created by Saqib Omer on 17/12/2017.
//  Copyright © 2017 Saqib Omer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Properties
    @IBOutlet weak var loadingView: UIView!
    
    var loadmation : Loadmation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize Loadmation
        self.loadmation = Loadmation(parent: self.loadingView, style: Loadmation.Styles.Circular.rawValue, frame: self.loadingView.frame)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // Start Animating
    
    @IBAction func startLoadmationAction(_ sender: UIButton) {
        
        self.loadmation.startAnimation()
    }
    
    @IBAction func stopLoadmationAction(_ sender: UIButton) {
        self.loadmation.stopLoadingAnimation()
    }
}

