//
//  Login_Scene.swift
//  FTM_App
//
//  Created by SonGoku on 19/09/2022.
//

import UIKit

class Login_Scene: UIViewController {
    
    let background_IMG: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "licogi12")
//        img.backgroundColor = .cyan
        img.alpha = 0.1
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let txt_Login: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let txt_Username: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        txt.text = "admin123"
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.autocapitalizationType = .none
        txt.autocorrectionType = .no
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_Password: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.attributedPlaceholder = NSAttributedString(
            string: "password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        txt.text = "123456"
        txt.layer.borderWidth = 1.0
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.autocapitalizationType = .none
        txt.autocorrectionType = .no
        txt.isSecureTextEntry = true
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    lazy var btn_Login: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Sign In", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.cornerRadius = 2
        btn.addTarget(self, action: #selector(Login_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let label_register: UILabel = {
        let label = UILabel()
        label.text = "You're not a member? "
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var btn_Register: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Register now", for: .normal)
        btn.setTitleColor(.systemCyan, for: .normal)
        btn.backgroundColor = .none
        btn.alpha = 1
        
        btn.addTarget(self, action: #selector(register_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
//        view.alpha = 0.5
        setup_Layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
}
