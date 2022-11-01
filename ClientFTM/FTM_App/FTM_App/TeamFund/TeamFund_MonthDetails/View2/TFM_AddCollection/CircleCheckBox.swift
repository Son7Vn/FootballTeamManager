//
//  CircleCheckBox.swift
//  FTM_App
//
//  Created by SonGoku on 26/10/2022.
//

import UIKit

final class CircelCheckBox: UIView {
    private var isChecked = false
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderWidth = 0.5
        layer.borderColor = UIColor.label.cgColor
        layer.cornerRadius = frame.size.width / 2
        backgroundColor = .systemBackground
    }
    
    func toggle() {
        self.isChecked = !isChecked
        if self.isChecked {
            backgroundColor = .systemBlue
        } else {
            backgroundColor = .systemBackground
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        layer.borderColor = UIColor.label.cgColor
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
