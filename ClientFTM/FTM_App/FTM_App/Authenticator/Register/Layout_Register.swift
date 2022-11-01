//
//  Layout_Register.swift
//  FTM_App
//
//  Created by SonGoku on 20/09/2022.
//

import UIKit

class LeafPaddedTextField: UITextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
    }
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width + 10, height: bounds.size.height)
    }
    
}

class CustomTextField: UITextField {
    struct Constants {
        static let sidePadding: CGFloat = 10
        static let topPadding: CGFloat = 8
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(
            x: bounds.origin.x + Constants.sidePadding,
            y: bounds.origin.y + Constants.topPadding,
            width: bounds.size.width - Constants.sidePadding * 2,
            height: bounds.size.height - Constants.topPadding * 2
        )
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return self.textRect(forBounds: bounds)
    }
}

@IBDesignable class TextPaddedLabel: UILabel {
    @IBInspectable var topInset: CGFloat = 5.0
    @IBInspectable var bottomInset: CGFloat = 5.0
    @IBInspectable var leftInset: CGFloat = 7.0
    @IBInspectable var rightInset: CGFloat = 7.0

    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
        super.drawText(in: rect.inset(by: insets))
    }

    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftInset + rightInset,
                      height: size.height + topInset + bottomInset)
    }

    override var bounds: CGRect {
        didSet {
            // ensures this works within stack views if multi-line
            preferredMaxLayoutWidth = bounds.width - (leftInset + rightInset)
        }
    }
}

extension Register_Scene {
    
    func SetupLayout() {
        
        let dismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissAction))
        view.addGestureRecognizer(dismissKeyboard)
        
        view.addSubview(background_IMG)
        NSLayoutConstraint.activate([
            background_IMG.topAnchor.constraint(equalTo: view.topAnchor),
            background_IMG.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background_IMG.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background_IMG.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])
        
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
        view1.addSubview(txtLogin)
        NSLayoutConstraint.activate([
            txtLogin.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            txtLogin.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            txtLogin.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.7),
            txtLogin.heightAnchor.constraint(equalTo: txtLogin.widthAnchor, multiplier: 0.3)
        ])
        
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor),
            view2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25)
        ])
        let tap_Ava: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAva_Action))
        view2.addSubview(img_Avatar)
        img_Avatar.isUserInteractionEnabled = true
        img_Avatar.addGestureRecognizer(tap_Ava)
        
        NSLayoutConstraint.activate([
            img_Avatar.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            img_Avatar.centerYAnchor.constraint(equalTo: view2.centerYAnchor),
            img_Avatar.heightAnchor.constraint(equalTo: view2.heightAnchor, multiplier: 0.7),
            img_Avatar.widthAnchor.constraint(equalTo: img_Avatar.heightAnchor)
        ])
        
        let view3 = UIView()
        view3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view3)
        NSLayoutConstraint.activate([
            view3.topAnchor.constraint(equalTo: view2.bottomAnchor),
            view3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.3)
        ])
        view3.addSubview(txt_Username)
        NSLayoutConstraint.activate([
            txt_Username.topAnchor.constraint(equalTo: view3.topAnchor,constant: 15),
            txt_Username.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            txt_Username.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.8),
            txt_Username.heightAnchor.constraint(equalTo: txt_Username.widthAnchor, multiplier: 0.15)
        ])
        view3.addSubview(txt_Password)
        NSLayoutConstraint.activate([
            txt_Password.topAnchor.constraint(equalTo: txt_Username.bottomAnchor,constant: 10),
            txt_Password.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            txt_Password.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.8),
            txt_Password.heightAnchor.constraint(equalTo: txt_Password.widthAnchor, multiplier: 0.15)
        ])
        view3.addSubview(txt_Email)
        NSLayoutConstraint.activate([
            txt_Email.topAnchor.constraint(equalTo: txt_Password.bottomAnchor,constant: 10),
            txt_Email.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            txt_Email.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.8),
            txt_Email.heightAnchor.constraint(equalTo: txt_Email.widthAnchor, multiplier: 0.15)
        ])
        
        let view4 = UIView()
        view4.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view4)
        NSLayoutConstraint.activate([
            view4.topAnchor.constraint(equalTo: view3.bottomAnchor),
            view4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view4.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.07)
        ])
        view4.addSubview(btn_Register)
        NSLayoutConstraint.activate([
            btn_Register.topAnchor.constraint(equalTo: view4.topAnchor),
            btn_Register.centerXAnchor.constraint(equalTo: view4.centerXAnchor),
            btn_Register.widthAnchor.constraint(equalTo: view4.widthAnchor, multiplier: 0.8),
            btn_Register.heightAnchor.constraint(equalTo: btn_Register.widthAnchor, multiplier: 0.15)
        ])
        
    }
}
