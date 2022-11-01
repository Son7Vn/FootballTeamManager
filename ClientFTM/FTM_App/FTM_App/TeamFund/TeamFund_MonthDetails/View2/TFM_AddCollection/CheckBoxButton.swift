//
//  CheckBoxButton.swift
//  FTM_App
//
//  Created by SonGoku on 26/10/2022.
//

import UIKit

class CheckBoxButton: UIView {
    var unChecked = true
    
    let imgView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.isHidden = true
        img.tintColor = .systemBlue
        img.image = UIImage(systemName: "checkmark")
        return img
    }()
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.label.cgColor
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(boxView)
        addSubview(imgView)
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        boxView.frame = CGRect(x: 7, y: 7, width: frame.size.width - 14 , height: frame.size.width - 14)
        imgView.frame = bounds
    }
    
    public func toggle() {
        self.unChecked = !unChecked
        self.imgView.isHidden = unChecked
        print(self.imgView.isHidden)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        boxView.layer.borderColor = UIColor.label.cgColor
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
