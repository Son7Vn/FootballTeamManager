//
//  UpdateDel_SetupLayout.swift
//  FTM_App
//
//  Created by SonGoku on 29/10/2022.
//

import UIKit

extension TF_MonthDetails_View2_UpdateDelete {
    func setupLayout() {
//        let view1 = UIView()
        view.addSubview(lbl_tittle)
//        lbl_tittle.backgroundColor = .red
        lbl_tittle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lbl_tittle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            lbl_tittle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            lbl_tittle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            lbl_tittle.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        
        // Text Field Views
        let view2 = UIView()
        view.addSubview(view2)
//        view2.backgroundColor = .green
        view2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: lbl_tittle.bottomAnchor),
            view2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
        let stackView1 = UIStackView()
        view2.addSubview(stackView1)
        stackView1.backgroundColor = .lightGray
        stackView1.distribution = .fillEqually
        stackView1.axis = .horizontal
        stackView1.layer.cornerRadius = 5
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: view2.topAnchor, constant: 40),
            stackView1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView1.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        let lbl1_name = ["Ten:", self.tfm.ten]
        for i in 0..<2 {
            let lbl: TextPaddedLabel = {
                let lbll = TextPaddedLabel()
                lbll.text = lbl1_name[i]
                if (i == 0) {
                    lbll.textAlignment = .left
                } else {
                    lbll.textAlignment = .right
                }
                lbll.font = .systemFont(ofSize: 18)
//                lbll.backgroundColor = .lightGray
                return lbll
            }()
            stackView1.addArrangedSubview(lbl)
        }
        let stackView2 = UIStackView()
        view2.addSubview(stackView2)
        stackView2.backgroundColor = .lightGray
        stackView2.distribution = .fillEqually
        stackView2.axis = .horizontal
        stackView2.layer.cornerRadius = 5
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView2.topAnchor.constraint(equalTo: stackView1.bottomAnchor, constant: 5),
            stackView2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView2.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        let lbl2_name = ["So ao:", "\(self.tfm.nam)"]
        for i in 0..<2 {
            let lbl: TextPaddedLabel = {
                let lbll = TextPaddedLabel()
                lbll.text = lbl2_name[i]
                if (i == 0) {
                    lbll.textAlignment = .left
                } else {
                    lbll.textAlignment = .right
                }
                lbll.font = .systemFont(ofSize: 18)
//                lbll.backgroundColor = .lightGray
                return lbll
            }()
            stackView2.addArrangedSubview(lbl)
        }
        
        let stackView3 = UIStackView(arrangedSubviews: [lbl_tien, txtField_tien])
        view2.addSubview(stackView3)
        stackView3.backgroundColor = .lightGray
        stackView3.distribution = .fillEqually
        stackView3.axis = .horizontal
        stackView3.layer.cornerRadius = 5
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView3.topAnchor.constraint(equalTo: stackView2.bottomAnchor, constant: 5),
            stackView3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView3.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView3.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05)
        ])
        
        let stackView4 = UIStackView(arrangedSubviews: [lbl_Note, txtField_Note])
        view2.addSubview(stackView4)
        stackView4.backgroundColor = .lightGray
        stackView4.distribution = .fillEqually
        stackView4.axis = .horizontal
        stackView4.layer.cornerRadius = 5
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView4.topAnchor.constraint(equalTo: stackView3.bottomAnchor, constant: 5),
            stackView4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView4.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.8),
            stackView4.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
        // button setup
        view.addSubview(btn_Update)
        NSLayoutConstraint.activate([
            btn_Update.topAnchor.constraint(equalTo: view2.bottomAnchor),
            btn_Update.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +10),
            btn_Update.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            btn_Update.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
        view.addSubview(btn_Delete)
        NSLayoutConstraint.activate([
            btn_Delete.topAnchor.constraint(equalTo: view2.bottomAnchor),
            btn_Delete.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            btn_Delete.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            btn_Delete.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07)
        ])
    }
}
