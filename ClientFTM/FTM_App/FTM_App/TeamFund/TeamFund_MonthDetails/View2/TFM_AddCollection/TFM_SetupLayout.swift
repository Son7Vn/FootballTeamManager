//
//  TFM_SetupLayout.swift
//  FTM_App
//
//  Created by SonGoku on 26/10/2022.
//

import UIKit

extension TF_MonthDetails_View2_Add {
    
    func setupLayout() {
//        let view1 = UIView()
        view.addSubview(lbl_Tittle)
        lbl_Tittle.backgroundColor = .systemOrange
//        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl_Tittle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lbl_Tittle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            lbl_Tittle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            lbl_Tittle.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.13)
        ])
        
        view.addSubview(btn_GetAll)
        btn_GetAll.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            btn_GetAll.topAnchor.constraint(equalTo: lbl_Tittle.bottomAnchor, constant: 10),
            btn_GetAll.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 1),
            btn_GetAll.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3),
            btn_GetAll.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.05)
        ])
        
        collectionView.register(TFM_View2_AddCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: btn_GetAll.bottomAnchor, constant: 5),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.7)
        ])
        let view3 = UIView()
        view3.backgroundColor = .systemBackground
        view.addSubview(view3)
        view3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view3.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            view3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.1)
        ])
        
        view3.addSubview(btn_Add)
        NSLayoutConstraint.activate([
            btn_Add.centerXAnchor.constraint(equalTo: view3.centerXAnchor),
            btn_Add.centerYAnchor.constraint(equalTo: view3.centerYAnchor),
            btn_Add.widthAnchor.constraint(equalTo: view3.widthAnchor, multiplier: 0.8),
            btn_Add.heightAnchor.constraint(equalTo: view3.heightAnchor, multiplier: 0.7)
        ])
    }
    
}
