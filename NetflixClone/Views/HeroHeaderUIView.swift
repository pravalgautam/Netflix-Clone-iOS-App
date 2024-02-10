//
//  HeroHeaderUIView.swift
//  NetflixClone
//
//  Created by Praval Gautam on 11/02/24.
//

import UIKit

class HeroHeaderUIView: UIView {
    
    private let downloadButton : UIButton = {
        let button =  UIButton()
        button.setTitle("Download", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    private let playButton : UIButton = {
        let button =  UIButton()
        button.setTitle("Play", for: .normal)
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 5 
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private let heroImageView: UIImageView = {
          let imageView = UIImageView()
          imageView.contentMode = .scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = UIImage(named: "heroImage")
          return imageView
      }()
    
    private func addGradient(){
        let gradientLayer = CAGradientLayer()//imp
        gradientLayer.colors = [
        
            UIColor.clear.cgColor,
            UIColor.systemBackground.cgColor,
            
        ]
        gradientLayer.frame = bounds
        layer.addSublayer(gradientLayer)
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView) //essential
        
        // bluring the big image
        
        addGradient()
        addSubview(playButton)
        addSubview(downloadButton)
        applyConstraint()
        
        
    }
    
    
    private func applyConstraint(){
        
      let playButtonConstraints = [
        playButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
        playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
        playButton.widthAnchor.constraint(equalToConstant: 120)
        
      ]
       // to activate constraints
        
        let downloadButtonConstraints = [
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            downloadButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
            downloadButton.widthAnchor.constraint(equalToConstant: 120)
          
        ]
        NSLayoutConstraint.activate(playButtonConstraints)
          NSLayoutConstraint.activate(downloadButtonConstraints) // to activate constraints
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
