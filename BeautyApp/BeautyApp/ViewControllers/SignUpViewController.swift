//
//  SignUpViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 30/01/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var firstNameTF: UITextField!
    @IBOutlet var lastNameTF: UITextField!
    @IBOutlet var usernameTF: UITextField!
    @IBOutlet var emailTF: UITextField!
    @IBOutlet var passwordTF: UITextField!
    @IBOutlet var signUpBtn: UIButton!
    @IBOutlet var errorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink.jpg")!)
        
        print("Height ", self.navigationController?.navigationBar.bounds.height)
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        usernameTF.delegate = self
        emailTF.delegate = self
        passwordTF.delegate = self
        
        setUpElements()
    }
    
    func setUpElements() {
        
        errorLbl.alpha = 0
        
        Utilities.styleTextField(firstNameTF)
        Utilities.styleTextField(lastNameTF)
        Utilities.styleTextField(usernameTF)
        Utilities.styleTextField(emailTF)
        Utilities.styleTextField(passwordTF)
        Utilities.styleFilledButton(signUpBtn)
    }
    
    func validateFields() -> String? {
        
        if firstNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || usernameTF.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields"
        }
        
        let cleanedPsw = passwordTF.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
//        if !Utilities.isPasswordValid(cleanedPsw!) {
//
//            return "Please make sure your password is at least 8 characters, contains a special character and a number"
//        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: UIButton) {
                
        let error = validateFields()
        
        if error != nil {
            
            showError(error!)
            
        } else {
            
            let firstName = firstNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let username = usernameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                        
//            print("Sign Up")

            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                                
                if err != nil {
                    self.showError("Error creating new User")
                } else {
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["first_name":firstName, "last_name":lastName, "username":username, "email":email, "password":password, "uid":result?.user.uid]) { (error) in
                        
                        if error != nil {
                            
                            self.showError("Error saving Users data")
                        }
                    }
                    
                    self.transitionToHome()
                }
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
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
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
