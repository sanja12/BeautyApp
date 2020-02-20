//
//  OptionsTableViewCell.swift
//  BeautyApp
//
//  Created by Sanja Pantic on 13/02/2020.
//  Copyright © 2020 Sanja Pantic. All rights reserved.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {

    private let pinkColor = UIColor(red: 0.9686, green: 0.2902, blue: 0.4706, alpha: 1.0)
    
    let descriptionLabel: UILabel = {
        
        let dl = UILabel()
        dl.text = "Beauty Salon Name"
        dl.font = UIFont.boldSystemFont(ofSize: 14)
        
        return dl
    }()
    
    let descriptionSublabel: UILabel = {
        
        let dl = UILabel()
        dl.text = "Subtitle"
        dl.font = UIFont.boldSystemFont(ofSize: 10)
        
        return dl
    }()
    
    let iconImageView: UIImageView = {
        
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 6
        iv.layer.masksToBounds = true
        
        let beautyImage = UIImage(named: "logo")
        iv.image = beautyImage
        
        return iv
    }()
    
    let reserveBtn: UIButton = {
        
        let rb = UIButton()
        rb.contentMode = .scaleAspectFit
        rb.clipsToBounds = true
        rb.layer.cornerRadius = 6
        rb.layer.masksToBounds = true
        rb.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        rb.setTitle("Reserve", for: .normal)
           
        return rb
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "ReuseIdentifier3");
        
        addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        iconImageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 12).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        descriptionLabel.textColor = pinkColor
        
        addSubview(descriptionSublabel)
        descriptionSublabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionSublabel.centerYAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 5).isActive = true
        descriptionSublabel.leftAnchor.constraint(equalTo: iconImageView.rightAnchor, constant: 12).isActive = true
        descriptionSublabel.textColor = .gray
        
        addSubview(reserveBtn)
        reserveBtn.translatesAutoresizingMaskIntoConstraints = false
        reserveBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        reserveBtn.leftAnchor.constraint(equalTo: descriptionLabel.rightAnchor, constant: 80).isActive = true
        reserveBtn.backgroundColor = .white
        reserveBtn.widthAnchor.constraint(equalToConstant: 70).isActive = true
        reserveBtn.setTitleColor(pinkColor, for: .normal)
        
        backgroundColor = .clear
        layer.masksToBounds = false
        layer.shadowOpacity = 0.23
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowColor = UIColor.black.cgColor

        // add corner radius on `contentView`
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 8
        
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
