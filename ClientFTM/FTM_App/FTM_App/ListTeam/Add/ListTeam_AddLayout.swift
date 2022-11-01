//
//  ListTeam_AddLayout.swift
//  FTM_App
//
//  Created by SonGoku on 27/09/2022.
//

import UIKit

extension ListTeam_Add {
    
    func setupLayout() {
        
        let tapToDismissKeyboard = UITapGestureRecognizer(target: self, action: #selector(dismissAction))
        view.addGestureRecognizer(tapToDismissKeyboard)
        
        view.addSubview(img_Background)
        NSLayoutConstraint.activate([
            img_Background.topAnchor.constraint(equalTo: view.topAnchor),
            img_Background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            img_Background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            img_Background.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/10)
        ])
        view1.addSubview(lbl_Tittle)
        NSLayoutConstraint.activate([
            lbl_Tittle.centerXAnchor.constraint(equalTo: view1.centerXAnchor),
            lbl_Tittle.centerYAnchor.constraint(equalTo: view1.centerYAnchor),
            lbl_Tittle.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.5),
            lbl_Tittle.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 0.9)
        ])
        
        let stackView_TextField = UIStackView(arrangedSubviews: [txt_ten, txt_soao, txt_sizeao, txt_phone, txt_namsinh, txt_vitri, txt_bqt])
        stackView_TextField.translatesAutoresizingMaskIntoConstraints = false
        stackView_TextField.distribution = .fillEqually
        stackView_TextField.axis = NSLayoutConstraint.Axis.vertical
        stackView_TextField.spacing = 16
        view.addSubview(stackView_TextField)
        NSLayoutConstraint.activate([
            stackView_TextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView_TextField.topAnchor.constraint(equalTo: view1.bottomAnchor),
            stackView_TextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.7),
            stackView_TextField.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 6/10)
        ])
        
        let view3 = UIView()
        view3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view3)
        NSLayoutConstraint.activate([
            view3.topAnchor.constraint(equalTo: stackView_TextField.bottomAnchor),
            view3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15)
        ])
        view3.addSubview(btn_AddListTeam)
        NSLayoutConstraint.activate([
            btn_AddListTeam.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            btn_AddListTeam.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            btn_AddListTeam.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.8),
            btn_AddListTeam.heightAnchor.constraint(equalTo: view3.heightAnchor, multiplier: 0.5)
        ])
    }
    
}
