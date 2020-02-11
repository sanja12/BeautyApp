//
//  MenuViewController.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 03/02/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var tableView: UITableView!
    private let reuseIdentifier = "ReuseIdentifier"
    private var areRowsHidden = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
    }
    
    func configureTableView() {
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.backgroundColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
        tableView.separatorStyle = .none
        
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true

    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MenuTableViewCell
        
        cell.subtableView.isHidden = true
        cell.selectionStyle = .none
        
        if indexPath.row == 1 && areRowsHidden {
            cell.isHidden = true
            return cell
        } else if indexPath.row == 1 && !areRowsHidden {
            cell.descriptionLabel.isHidden = true
            cell.iconImageView.isHidden = true
            cell.arrowImageView.isHidden = true
            cell.subtableView.isHidden = false
        }
        
        let menuOptions = MenuOptions(rawValue: indexPath.row)
        
        cell.descriptionLabel.text = menuOptions?.description
        cell.iconImageView.image = menuOptions?.image
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let menuOptions = MenuOptions(rawValue: indexPath.row)
            
//        let currentCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
        
        if indexPath.row == 0 {
            areRowsHidden = !areRowsHidden
            tableView.reloadData()
        } else {
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        var rowHeight:CGFloat = 0.0

        if(indexPath.row == 1 && areRowsHidden){
            rowHeight = 0.0
        } else {
            rowHeight = 80.0
        }
        
        return rowHeight
    }
}
