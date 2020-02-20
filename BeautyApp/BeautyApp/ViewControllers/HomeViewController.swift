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
    
    let optionLbl = UILabel()
    let dateLbl = UILabel()
    let timeLbl = UILabel()
    let locationLbl = UILabel()
    let resultLbl = UILabel()
    
    let optionTF = UITextField()
    let dateTF = UITextField()
    let timeTF = UITextField()
    let locationTF = UITextField()
    
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    
    let pageControl = UIPageControl()
    
    let submitBtn: UIButton = {
        
        let sb = UIButton()
        sb.setTitle("SEARCH", for: .normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sb.setTitleColor(.white, for: .normal)
        sb.clipsToBounds = true
        sb.layer.cornerRadius = 6
        sb.layer.masksToBounds = true
        
        return sb
    }()
    
    let hairBtn: UIButton = {
        
        let sb = UIButton()
        sb.setTitle("HAIR", for: .normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sb.setTitleColor(.white, for: .normal)
        sb.clipsToBounds = true
        sb.layer.cornerRadius = 17
        sb.layer.masksToBounds = true
        
        return sb
    }()
    
    let nailsBtn: UIButton = {
        
        let sb = UIButton()
        sb.setTitle("NAILS", for: .normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sb.setTitleColor(.white, for: .normal)
        sb.clipsToBounds = true
        sb.layer.cornerRadius = 17
        sb.layer.masksToBounds = true
        
        return sb
    }()
    
    let makeUpBtn: UIButton = {
        
        let sb = UIButton()
        sb.setTitle("MAKE UP", for: .normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sb.setTitleColor(.white, for: .normal)
        sb.clipsToBounds = true
        sb.layer.cornerRadius = 17
        sb.layer.masksToBounds = true
        
        return sb
    }()
    
    let tanningBtn: UIButton = {
        
        let sb = UIButton()
        sb.setTitle("TANNING", for: .normal)
        sb.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        sb.setTitleColor(.white, for: .normal)
        sb.clipsToBounds = true
        sb.layer.cornerRadius = 17
        sb.layer.masksToBounds = true
        
        return sb
    }()
    
    let tableView = UITableView()
    let pinkBackgroundView = UIView()
        
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
        navigationController?.navigationBar.tintColor = .systemPink
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Beauty Application"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "menu")?.withRenderingMode(.alwaysTemplate), style: .done, target: self, action:#selector(handleToggleMenu))
    }
    
    func setUpElements() {
        
        let labelsArray = [dateLbl, timeLbl, locationLbl]
        let labelsTitle = ["Date:", "Time:", "City:"]
        let textFieldsArray = [dateTF, timeTF, locationTF]
        let textFieldsTitle = ["12.02.2020.", "10:00", "Novi Sad"]

        var topConstant = 160.0
        
        for i in 0..<3 {
            
            let lbl = labelsArray[i]

            lbl.font = UIFont.boldSystemFont(ofSize: 15)
            lbl.textColor = .white
            lbl.text = labelsTitle[i]
            view.addSubview(lbl)
            lbl.translatesAutoresizingMaskIntoConstraints = false
            lbl.heightAnchor.constraint(equalToConstant: 30).isActive = true
            lbl.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstant)).isActive = true
            lbl.widthAnchor.constraint(equalToConstant: 60).isActive = true
            
            if i == 1 {
                lbl.leftAnchor.constraint(equalTo: textFieldsArray[0].rightAnchor, constant: 12).isActive = true
            } else {
                lbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 25).isActive = true
            }
            
            let tf = textFieldsArray[i]
            
            tf.textColor = pinkColor
            tf.placeholder = textFieldsTitle[i]
            tf.font = UIFont.boldSystemFont(ofSize: 15)
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
            tf.leftAnchor.constraint(equalTo: labelsArray[i].rightAnchor).isActive = true
            tf.heightAnchor.constraint(equalToConstant: 30).isActive = true
            
            if i == 0 || i == 1 {
                tf.widthAnchor.constraint(equalToConstant: 110).isActive = true
            } else {
                tf.widthAnchor.constraint(equalToConstant: 292).isActive = true
            }
        
            tf.delegate = self
            
            if i != 0 {
                topConstant = topConstant + 50
            }
        }
        
        view.addSubview(pinkBackgroundView)
        view.sendSubview(toBack: pinkBackgroundView)
        pinkBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        pinkBackgroundView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(80)).isActive = true
        pinkBackgroundView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pinkBackgroundView.heightAnchor.constraint(equalToConstant: CGFloat(topConstant - 25)).isActive = true
        pinkBackgroundView.widthAnchor.constraint(equalToConstant: self.view.frame.size.width - 20).isActive = true
        pinkBackgroundView.backgroundColor = pinkColor
        pinkBackgroundView.clipsToBounds = true
        pinkBackgroundView.layer.cornerRadius = 10
        pinkBackgroundView.layer.masksToBounds = true
        
        view.addSubview(submitBtn)
        submitBtn.translatesAutoresizingMaskIntoConstraints = false
        submitBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstant)).isActive = true
        submitBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        submitBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        submitBtn.backgroundColor = pinkColor
        submitBtn.layer.borderColor = UIColor.white.cgColor
        submitBtn.layer.borderWidth = 2
        submitBtn.setTitleColor(.white, for: .normal)
        
        view.addSubview(hairBtn)
        hairBtn.translatesAutoresizingMaskIntoConstraints = false
        hairBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        hairBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17).isActive = true
        hairBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        hairBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        hairBtn.backgroundColor = .white
        hairBtn.setTitleColor(pinkColor, for: .normal)
        
        view.addSubview(nailsBtn)
        nailsBtn.translatesAutoresizingMaskIntoConstraints = false
        nailsBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        nailsBtn.leftAnchor.constraint(equalTo: hairBtn.rightAnchor, constant: 6).isActive = true
        nailsBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nailsBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nailsBtn.backgroundColor = .white
        nailsBtn.setTitleColor(pinkColor, for: .normal)
        
        view.addSubview(makeUpBtn)
        makeUpBtn.translatesAutoresizingMaskIntoConstraints = false
        makeUpBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        makeUpBtn.leftAnchor.constraint(equalTo: nailsBtn.rightAnchor, constant: 6).isActive = true
        makeUpBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        makeUpBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        makeUpBtn.backgroundColor = .white
        makeUpBtn.setTitleColor(pinkColor, for: .normal)
        
        view.addSubview(tanningBtn)
        tanningBtn.translatesAutoresizingMaskIntoConstraints = false
        tanningBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 110).isActive = true
        tanningBtn.leftAnchor.constraint(equalTo: makeUpBtn.rightAnchor, constant: 6).isActive = true
        tanningBtn.heightAnchor.constraint(equalToConstant: 35).isActive = true
        tanningBtn.widthAnchor.constraint(equalToConstant: 100).isActive = true
        tanningBtn.backgroundColor = .white
        tanningBtn.setTitleColor(pinkColor, for: .normal)
        
        view.addSubview(resultLbl)
        resultLbl.translatesAutoresizingMaskIntoConstraints = false
        resultLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstant + 65)).isActive = true
        resultLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        resultLbl.widthAnchor.constraint(equalToConstant: 100).isActive = true
        resultLbl.textColor = .gray
        resultLbl.font = .boldSystemFont(ofSize: 20)
        resultLbl.text = "Result: "
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstant + 90)).isActive = true
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: self.view.frame.height - 390).isActive = true
        tableView.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OptionsTableViewCell.self, forCellReuseIdentifier: "ReuseIdentifier3")
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 5).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        self.pageControl.numberOfPages = 3
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.red
        self.pageControl.pageIndicatorTintColor = pinkColor
        self.pageControl.currentPageIndicatorTintColor = .lightGray
        
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

extension HomeViewController: UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier3", for: indexPath)
        tableView.separatorStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 5 - 10
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.contentView.layer.masksToBounds = true
//        let radius = cell.contentView.layer.cornerRadius
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: radius).cgPath
    }
}
