//
//  ContainerViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 30/01/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    var menuViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        configureHomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func configureHomeController() {
        
        let homeCtrl = HomeViewController()
        homeCtrl.delegate = self
        let controller = UINavigationController(rootViewController: homeCtrl)
        
        view.addSubview(controller.view)
        addChildViewController(controller)
        controller.didMove(toParentViewController: self)
    }

    func configureMenuController() {
        
        if menuViewController == nil {
            menuViewController = MenuViewController()
            view.insertSubview(menuViewController.view, at: 0)
            addChildViewController(menuViewController)
            menuViewController.didMove(toParentViewController: self)
        }
    }
    
    func showMenuController(shouldExpand: Bool) {
        
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            
            }, completion: nil)
        } else {
            
        }
    }
}

extension ContainerViewController: HomeControllerDelegate {
    func handleMenuToggle() {
        configureMenuController()
    }
}
