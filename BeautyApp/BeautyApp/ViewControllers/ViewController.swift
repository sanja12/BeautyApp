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
    @IBOutlet var guestUserBtn: UIButton!
    @IBOutlet var titleLbl: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setUpElements()
        
        titleLbl.center.y = self.view.frame.width + 30
        
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 30, options: UIViewAnimationOptions(), animations: ({ self.titleLbl.center.y = self.view.frame.width / 2 }), completion: nil)
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
//        Utilities.styleHollowButton(guestUserBtn)
        
        let pinkColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
        
        guestUserBtn.tintColor = pinkColor
        guestUserBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        
        titleLbl.textColor = pinkColor
    }
    
    @IBAction func guestUserTapped(_ sender: Any) {
        
        transitionToHome()
    }
    
    func transitionToHome() {
            
        let homeVC = ((storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.containerViewController))!) as! ContainerViewController
        
        view.window?.rootViewController = homeVC
        view.window?.makeKeyAndVisible()
    }
}

