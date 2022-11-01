//
//  TF_MonthDetails_View2_Cell.swift
//  FTM_App
//
//  Created by SonGoku on 21/10/2022.
//

import UIKit

class TF_MonthDetails_View2_Cell: UICollectionViewCell {
    
    let lbl_Name: UILabel = {
        let lbl = UILabel()
        lbl.text = "Test"
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let lbl_Money: UILabel = {
        let lbl = UILabel()
        lbl.text = "200000"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let lbl_Note: UILabel = {
        let lbl = UILabel()
        lbl.text = "Testtesttesttesttest"
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayout()
    }
    
    private func setupLayout() {
        let stackView1 = UIStackView(arrangedSubviews: [lbl_Name, lbl_Money, lbl_Note])
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        stackView1.distribution = .fillEqually
        stackView1.axis = .horizontal
        addSubview(stackView1)
        NSLayoutConstraint.activate([
            stackView1.topAnchor.constraint(equalTo: topAnchor),
            stackView1.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView1.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView1.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
