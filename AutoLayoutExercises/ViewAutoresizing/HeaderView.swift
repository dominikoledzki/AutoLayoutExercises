//
//  HeaderView.swift
//  AutoLayoutExercises
//
//  Created by Dominik Olędzki on 19/11/2017.
//

import UIKit

class HeaderView: UIView {
    
    private var backgroundImageView: UIImageView!
    private var gradientView: GradientView!
    private var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func setup(with place: Place) {
        backgroundImageView.image = place.image
        label.text = place.name
    }
    
    // Private
    private func commonInit() {
        setupBackgroundImage()
        setupGradient()
        setupLabel()
    }
    
    private func setupBackgroundImage() {
        backgroundImageView = UIImageView(frame: bounds)
        addSubview(backgroundImageView)
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    private func setupGradient() {
        gradientView = GradientView(frame: CGRect(x: 0, y: bounds.height, width: bounds.width, height: -60.0))
        addSubview(gradientView)
        gradientView.gradientLayer.colors = [
            UIColor.black.withAlphaComponent(0.0).cgColor,
            UIColor.black.withAlphaComponent(0.7).cgColor
        ]
        gradientView.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
    }
    
    private func setupLabel() {
        label = UILabel(frame: CGRect.zero)
        addSubview(label)
        label.font = UIFont.boldSystemFont(ofSize: 24.0)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(
            [
                label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
                label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
                label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8.0)
            ]
        )
    }
}

