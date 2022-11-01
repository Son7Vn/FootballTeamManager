//
//  ListTeamCell_Layout.swift
//  FTM_App
//
//  Created by SonGoku on 24/09/2022.
//

import UIKit

extension ListTeam_Cell {
    func setupLayOut() {
        
        let view1 = UIView()
//        view1.backgroundColor = .systemOrange
        view1.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view1)
        NSLayoutConstraint.activate([
            view1.centerXAnchor.constraint(equalTo:safeAreaLayoutGuide.centerXAnchor),
            view1.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            view1.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.9),
            view1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.9)
        ])
        view1.addSubview(txt_name)
        NSLayoutConstraint.activate([
            txt_name.topAnchor.constraint(equalTo: view1.topAnchor),
            txt_name.leadingAnchor.constraint(equalTo: view1.leadingAnchor),
            txt_name.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            txt_name.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.5)
        ])
        view1.addSubview(txt_squadnum)
        NSLayoutConstraint.activate([
            txt_squadnum.topAnchor.constraint(equalTo: view1.topAnchor),
            txt_squadnum.leadingAnchor.constraint(equalTo: txt_name.trailingAnchor),
            txt_squadnum.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            txt_squadnum.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.25)
        ])
        view1.addSubview(txt_position)
        NSLayoutConstraint.activate([
            txt_position.topAnchor.constraint(equalTo: view1.topAnchor),
            txt_position.leadingAnchor.constraint(equalTo: txt_squadnum.trailingAnchor),
            txt_position.bottomAnchor.constraint(equalTo: view1.bottomAnchor),
            txt_position.widthAnchor.constraint(equalTo: view1.widthAnchor, multiplier: 0.25)
        ])
    }
}
