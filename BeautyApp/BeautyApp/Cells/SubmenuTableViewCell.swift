//
//  SubmenuTableViewCell.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 11/02/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class SubmenuTableViewCell: UITableViewCell {
    
    private let pinkColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
    
    let descriptionLabel: UILabel = {
        
        let dl = UILabel()
        dl.text = "Sample text"
        dl.textColor = .white
        dl.font = UIFont.boldSystemFont(ofSize: 14)
        
        return dl
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ReuseIdentifier2");
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: frame.size.width - (frame.size.width - 50)).isActive = true
        
        backgroundColor = pinkColor
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
