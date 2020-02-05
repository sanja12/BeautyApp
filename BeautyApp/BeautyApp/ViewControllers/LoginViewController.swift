//
//  LoginViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 30/01/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var loginBtn: UIButton!
    @IBOutlet var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink.jpg")!)

        setUpElements()
    }
    
    func setUpElements() {
        
        errorLbl.alpha = 0
        
        Utilities.styleTextField(emailTF)
        Utilities.styleTextField(passwordTF)
        Utilities.styleTextField(passwordTF)
        Utilities.styleFilledButton(loginBtn)
    }

    @IBAction func loginTapped(_ sender: Any) {
        
        let email = emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        Auth.auth().signIn(withEmail: email!, password: password!) { (result, err) in
            
            if err != nil {
                self.showError(err!.localizedDescription)
            } else {
                self.transitionToHome()
            }
        }
    }
    
    func showError(_ message: String) {
        
        errorLbl.text = message
        errorLbl.alpha = 1
    }
    
    func transitionToHome() {
        
        let homeVC = ((storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.containerViewController))!) as! ContainerViewController
        
        view.window?.rootViewController = homeVC
        view.window?.makeKeyAndVisible()
        
//        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
