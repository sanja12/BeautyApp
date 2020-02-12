//
//  MenuTableViewCell.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 11/02/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    private let pinkColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
    private let reuseIdentifier2 = "ReuseIdentifier2"
    
    let iconImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        let beautyImage = UIImage(named: "beauty1")
        let tintedBeautyImage = beautyImage?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white
        iv.image = tintedBeautyImage
        
        return iv
    }()
    
    let arrowImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        
        let arrowImage = UIImage(named: "arrow")
        let tintedArrowImage = arrowImage?.withRenderingMode(.alwaysTemplate)
        iv.tintColor = .white
        iv.image = tintedArrowImage
        
        return iv
    }()
    
    let descriptionLabel: UILabel = {
        
        let dl = UILabel()
        dl.text = "Sample text"
        dl.textColor = .white
        dl.font = UIFont.boldSystemFont(ofSize: 15)
        
        return dl
    }()
    
    var subtableView: UITableView = UITableView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.backgroundColor = pinkColor
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 24).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        
        addSubview(arrowImageView)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        arrowImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: self.frame.size.width - 45).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
        arrowImageView.widthAnchor.constraint(equalToConstant: 12).isActive = true
        
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

extension MenuTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseIdentifier2", for: indexPath) as! SubmenuTableViewCell
        
        let submenuOptions = SubmenuOptions(rawValue: indexPath.row)
        cell.descriptionLabel.text = submenuOptions?.description
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 / 3
    }
    
    func configureTableView() {
        
        subtableView = UITableView()
        subtableView.delegate = self
        subtableView.dataSource = self
        
        subtableView.register(SubmenuTableViewCell.self, forCellReuseIdentifier: "ReuseIdentifier2")
        subtableView.backgroundColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
        subtableView.separatorStyle = .none
        
        addSubview(subtableView)
        subtableView.translatesAutoresizingMaskIntoConstraints = false
        
        subtableView.translatesAutoresizingMaskIntoConstraints = false
        subtableView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        subtableView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        subtableView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        subtableView.widthAnchor.constraint(equalToConstant: self.frame.size.width).isActive = true
        
    }
}
