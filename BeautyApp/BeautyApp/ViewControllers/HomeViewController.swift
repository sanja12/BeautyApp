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

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink.jpg")!)
        
        configureNavigationBar()
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
