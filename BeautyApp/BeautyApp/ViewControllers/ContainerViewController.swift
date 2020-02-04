//
//  ContainerViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 30/01/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet var welcomeLbl: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "pink.jpg")!)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: nil, action: nil)
        
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 44))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "SomeTitle")
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil)
        navItem.rightBarButtonItem = doneItem

        navBar.setItems([navItem], animated: false)
        
//        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configureHomeController() {
        
        let homeCtrl = HomeViewController()
        let controller = UINavigationController(rootViewController: homeCtrl)
        
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }

    func configureMenuController() {
        
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
