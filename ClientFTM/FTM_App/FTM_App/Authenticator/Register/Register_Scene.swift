//
//  Register_Scene.swift
//  FTM_App
//
//  Created by SonGoku on 20/09/2022.
//

import UIKit



class Register_Scene: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let txtLogin: UILabel = {
        let txt = UILabel()
        txt.text = "Register User"
        txt.textAlignment = .center
        txt.numberOfLines = 1
        txt.font = UIFont.boldSystemFont(ofSize: 25)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let img_Avatar: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "avatar")
//        img.layer.cornerRadius = img.frame.height / 2.0
//        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let txt_Username: LeafPaddedTextField = {
        let username = LeafPaddedTextField()
        username.attributedPlaceholder = NSAttributedString(
            string: "Username",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        username.layer.borderWidth = 1.0
        username.layer.borderColor = UIColor.darkGray.cgColor
        username.autocapitalizationType = .none
        username.autocorrectionType = .no
        username.translatesAutoresizingMaskIntoConstraints = false
        return username
    }()
    
    let txt_Password: LeafPaddedTextField = {
        let password = LeafPaddedTextField()
        password.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        password.layer.borderWidth = 1.0
        password.layer.borderColor = UIColor.darkGray.cgColor
        password.autocapitalizationType = .none
        password.autocorrectionType = .no
        password.isSecureTextEntry = true
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    let txt_Email: LeafPaddedTextField = {
        let email = LeafPaddedTextField()
        email.attributedPlaceholder = NSAttributedString(
            string: "Email",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        email.layer.borderWidth = 1.0
        email.layer.borderColor = UIColor.darkGray.cgColor
        email.autocorrectionType = .no
        email.autocapitalizationType = .none
        email.translatesAutoresizingMaskIntoConstraints = false
        return email
    }()
    
    lazy var btn_Register: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.cornerRadius = 2
        btn.addTarget(self, action: #selector(Register_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let background_IMG: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "licogi12")
        img.alpha = 0.1
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        SetupLayout()
    }
}
