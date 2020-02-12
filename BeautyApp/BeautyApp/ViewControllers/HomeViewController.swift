//
//  HomeViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 03/02/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    private let pinkColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
    
    let dateLbl = UILabel()
    let timeLbl = UILabel()
    let locationLbl = UILabel()
    let dateTF = UITextField()
    let timeTF = UITextField()
    let locationTF = UITextField()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    let submitBtn: UIButton = {
        let sb = UIButton()
        sb.setTitle("SEARCH", for: .normal)
        sb.titleLabel?.textColor = .white
        sb.titleLabel?.tintColor = .white
        
        return sb
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink.jpg")!)
        
        configureNavigationBar()
        setUpElements()
        setUpPickers()
        
        getDateFromDatePicker()
    }
    
    @objc func handleToggleMenu() {
        delegate?.handleMenuToggle()
    }
    
    func configureNavigationBar() {
        
        navigationController?.navigationBar.barTintColor = .systemPink
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Beauty Application"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action:#selector(handleToggleMenu))
    }
    
    func setUpElements() {
        
        let labelsArray = [dateLbl, timeLbl, locationLbl]
        let labelsTitle = ["Date:", "Time:", "Location:"]
        let textFieldsArray = [dateTF, timeTF, locationTF]
        let textFieldsTitle = ["12.02.2020.", "10:00", "Novi Sad"]

        var topConstant = 100.0
        
        for i in 0..<3 {
            
            let lbl = labelsArray[i]

            lbl.font = UIFont.boldSystemFont(ofSize: 17)
            lbl.textColor = pinkColor
            lbl.text = labelsTitle[i]
            view.addSubview(lbl)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
            lbl.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstant)).isActive = true
            lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
            lbl.widthAnchor.constraint(equalToConstant: 80).isActive = true
            
            let tf = textFieldsArray[i]
            
            tf.textColor = pinkColor
            tf.text = textFieldsTitle[i]
            tf.placeholder = "12.02.2020."
            tf.font = UIFont.boldSystemFont(ofSize: 17)
            tf.backgroundColor = .white
            tf.borderStyle = UITextField.BorderStyle.roundedRect
            tf.autocorrectionType = UITextAutocorrectionType.no
            tf.keyboardType = UIKeyboardType.default
            tf.returnKeyType = UIReturnKeyType.done
            tf.clearButtonMode = UITextField.ViewMode.whileEditing
            tf.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
            view.addSubview(tf)
            tf.translatesAutoresizingMaskIntoConstraints = false
            tf.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstant)).isActive = true
            tf.leftAnchor.constraint(equalTo: dateLbl.rightAnchor, constant: 20).isActive = true
            tf.heightAnchor.constraint(equalToConstant: 30).isActive = true
            tf.widthAnchor.constraint(equalToConstant: 260).isActive = true
            tf.delegate = self
            
            topConstant = topConstant + 50
        }
        
        view.addSubview(submitBtn)
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        submitBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        submitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitBtn.heightAnchor.constraint(equalToConstant: 45).isActive = true
        submitBtn.widthAnchor.constraint(equalToConstant: 120).isActive = true
        Utilities.styleFilledButton2(submitBtn)
        
    }
    
    func setUpPickers() {
        
        // dateTextField & datePicker
        dateTF.inputView = datePicker
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: localeID!)
        let currentDate = Date()
        datePicker.minimumDate = currentDate
        datePicker.date = currentDate
        
        // TODO maximum date
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneBtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbar.setItems([flexSpace, doneBtn], animated: true)
        dateTF.inputAccessoryView = toolbar
        
        datePicker.addTarget(self, action: #selector(getDateFromDatePicker), for: .valueChanged)
        
        // timeTextField & timePicker
        timeTF.inputView = timePicker
        timePicker.datePickerMode = .time
        timePicker.locale = Locale(identifier: localeID!)
        timePicker.minuteInterval = 15
        
        let toolbarForTimePicker = UIToolbar()
        let doneBtnForTimePicker = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneAction))
        let flexSpaceForTimePicker = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolbarForTimePicker.sizeToFit()
        toolbarForTimePicker.setItems([flexSpaceForTimePicker, doneBtnForTimePicker], animated: true)
        timeTF.inputAccessoryView = toolbarForTimePicker
        
        timePicker.addTarget(self, action: #selector(getTimeFromDatePicker), for: .valueChanged)
        
//        let arrow = UIImageView()
//        let arrow2 = UIImage(named: "arrow2")
//        arrow.frame = CGRect(x: 15, y: 0, width: 12, height: 12)
//        arrow.image = arrow2
//        locationTF.rightView = arrow
//        locationTF.rightViewMode = .always
        
        setLeftView(image: UIImage(named: "arrow2")!)
    }
    
    func setLeftView(image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 10, y: 20, width: 12, height: 12))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 35, height: 45))
        iconContainerView.addSubview(iconView)
        locationTF.rightView = iconContainerView
        locationTF.rightViewMode = .always
    }
    
    @objc func doneAction() {
        view.endEditing(true)
    }
    
    @objc func getDateFromDatePicker() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy."
        dateTF.text = formatter.string(from: datePicker.date)
    }
    
    @objc func getTimeFromDatePicker() {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm"
        timeTF.text = formatter.string(from: datePicker.date)
    }
}

extension HomeViewController: UITextFieldDelegate {
    
}
