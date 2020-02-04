//
//  ViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 30/01/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var loginBtn: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink.jpg")!)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpBtn)
        Utilities.styleHollowButton(loginBtn)
    }
}

