//
//  ListTeam_Layout.swift
//  FTM_App
//
//  Created by SonGoku on 27/09/2022.
//

import UIKit

extension ListTeam_CollectionView {
    
    func setupLayout() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add_Action))
        
        view.backgroundColor = .systemBackground
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(view1)
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view1.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            view1.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor,multiplier: 0.9),
            view1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 1/10)
        ])
        
        // StackView Tittle:
        let tittle_StackView = UIStackView(arrangedSubviews: [lbl_name, lbl_squadNum, lbl_position])
        tittle_StackView.translatesAutoresizingMaskIntoConstraints = false
//        tittle_StackView.backgroundColor = .lightGray
        view1.addSubview(tittle_StackView)
        NSLayoutConstraint.activate([
            tittle_StackView.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            tittle_StackView.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            tittle_StackView.trailingAnchor.constraint(equalTo: view1.trailingAnchor),
            tittle_StackView.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 1/2)
        ])
        lbl_name.widthAnchor.constraint(equalTo: tittle_StackView.widthAnchor, multiplier: 1/2).isActive = true
        lbl_squadNum.widthAnchor.constraint(equalTo: tittle_StackView.widthAnchor, multiplier: 0.25).isActive = true
        
        //Collection Layout
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view1.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 4/5)
        ])
        collectionView.backgroundColor = .systemGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        navigationItem.title = "List Team"
        view.addSubview(collectionView)
        collectionView.register(ListTeam_Cell.self, forCellWithReuseIdentifier: "cellID")
        
    }
    
}
