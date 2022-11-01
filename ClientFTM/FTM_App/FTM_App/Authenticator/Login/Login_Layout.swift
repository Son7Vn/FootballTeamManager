//
//  Login_Layout.swift
//  FTM_App
//
//  Created by SonGoku on 22/09/2022.
//

import UIKit

extension Login_Scene {
    func setup_Layout() {
        view.addSubview(background_IMG)
        NSLayoutConstraint.activate([
            background_IMG.topAnchor.constraint(equalTo: view.topAnchor),
            background_IMG.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background_IMG.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background_IMG.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.2)
        ])
        view1.addSubview(txt_Login)
        NSLayoutConstraint.activate([
            txt_Login.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            txt_Login.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            txt_Login.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.7),
            txt_Login.heightAnchor.constraint(equalTo: txt_Login.widthAnchor, multiplier: 0.3)
        ])
        
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view2)
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor),
            view2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.4)
        ])
        view2.addSubview(txt_Username)
        NSLayoutConstraint.activate([
            txt_Username.topAnchor.constraint(equalTo: view2.topAnchor,constant: 20),
            txt_Username.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            txt_Username.widthAnchor.constraint(equalTo: view2.widthAnchor, multiplier: 0.8),
            txt_Username.heightAnchor.constraint(equalTo: txt_Username.widthAnchor, multiplier: 0.15)
        ])
        view2.addSubview(txt_Password)
        NSLayoutConstraint.activate([
            txt_Password.topAnchor.constraint(equalTo: txt_Username.bottomAnchor,constant: 10),
            txt_Password.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            txt_Password.widthAnchor.constraint(equalTo: txt_Username.widthAnchor),
            txt_Password.heightAnchor.constraint(equalTo: txt_Username.heightAnchor)
        ])
        view2.addSubview(btn_Login)
        NSLayoutConstraint.activate([
            btn_Login.topAnchor.constraint(equalTo: txt_Password.bottomAnchor,constant: 20),
            btn_Login.centerXAnchor.constraint(equalTo: view2.centerXAnchor),
            btn_Login.widthAnchor.constraint(equalTo: txt_Username.widthAnchor),
            btn_Login.heightAnchor.constraint(equalTo: txt_Username.heightAnchor)
        ])
        
        let view3 = UIView()
        view3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view3)
        NSLayoutConstraint.activate([
            view3.topAnchor.constraint(equalTo: btn_Login.bottomAnchor),
            view3.widthAnchor.constraint(equalTo: btn_Login.widthAnchor),
            view3.heightAnchor.constraint(equalTo: btn_Login.heightAnchor, multiplier: 1.5),
            view3.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        view3.addSubview(label_register)
        NSLayoutConstraint.activate([
            label_register.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.6),
            label_register.leadingAnchor.constraint(equalTo: view3.leadingAnchor),
            label_register.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            label_register.heightAnchor.constraint(equalTo: view3.heightAnchor, multiplier: 0.5)
        ])
        view3.addSubview(btn_Register)
        NSLayoutConstraint.activate([
            btn_Register.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.4),
            btn_Register.trailingAnchor.constraint(equalTo: view3.trailingAnchor),
            btn_Register.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            btn_Register.heightAnchor.constraint(equalTo: view3.heightAnchor, multiplier: 0.5)
        ])
        
    }
}
