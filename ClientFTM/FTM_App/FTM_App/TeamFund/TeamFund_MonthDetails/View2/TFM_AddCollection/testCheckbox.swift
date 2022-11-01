//
//  testCheckbox.swift
//  FTM_App
//
//  Created by SonGoku on 26/10/2022.
//

import UIKit

class testCheckbox: UIViewController {
    var checkbox1 = CircelCheckBox(frame: CGRect(x: 70, y: 200, width: 100, height: 100))
    
    var checkbox2 = CheckBoxButton(frame: CGRect(x: 50, y: 100, width: 50, height: 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(checkbox1)
//        checkbox1.layer.cornerRadius = checkbox1.frame.size.width/ 2.0
        checkbox1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkbox1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            checkbox1.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            checkbox1.widthAnchor.constraint(equalToConstant: 100),
            checkbox1.heightAnchor.constraint(equalTo: checkbox1.widthAnchor)
        ])
        let getture = UITapGestureRecognizer(target: self, action: #selector(checkAction))
        checkbox1.addGestureRecognizer(getture)
        
        view.addSubview(checkbox2)
//        checkbox1.layer.cornerRadius = checkbox1.frame.size.width/ 2.0
//        checkbox2.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            checkbox2.topAnchor.constraint(equalTo: view.bottomAnchor),
//            checkbox2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            checkbox2.widthAnchor.constraint(equalToConstant: 100),
//            checkbox2.heightAnchor.constraint(equalTo: checkbox2.widthAnchor)
//        ])
        let getture2 = UITapGestureRecognizer(target: self, action: #selector(checkAction2))
        checkbox2.addGestureRecognizer(getture2)
        
    }
    @objc func checkAction() {
        checkbox1.toggle()
    }
    
    @objc func checkAction2() {
//        checkbox2.toggle()
    }
}
