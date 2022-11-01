//
//  TFM_View2_AddCell.swift
//  FTM_App
//
//  Created by SonGoku on 26/10/2022.
//

import UIKit

protocol TFM_AddDelegate {
    func getAction(cell: UICollectionViewCell)
}

class TFM_View2_AddCell: UICollectionViewCell {
    
    var delegate: TFM_AddDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let checkbox = CheckBoxButton()
    var unchecked = true
    
    let lbl_ten: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.text = "Ten"
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lbl_soao: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "So Ao"
        lbl.font = .systemFont(ofSize: 16)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    @objc private func checkbox_Action() {
        checkbox.toggle()
        delegate?.getAction(cell: self)
    }
    
    private func setupLayout() {
        addSubview(checkbox)
        let checkboxGetures = UITapGestureRecognizer(target: self, action: #selector(checkbox_Action))
        checkbox.addGestureRecognizer(checkboxGetures)
        checkbox.backgroundColor = .lightGray
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            checkbox.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkbox.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            checkbox.widthAnchor.constraint(equalToConstant: 37),
            checkbox.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        addSubview(lbl_ten)
        NSLayoutConstraint.activate([
            lbl_ten.topAnchor.constraint(equalTo: topAnchor),
            lbl_ten.leadingAnchor.constraint(equalTo: checkbox.trailingAnchor),
            lbl_ten.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.4),
            lbl_ten.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        addSubview(lbl_soao)
        NSLayoutConstraint.activate([
            lbl_soao.topAnchor.constraint(equalTo: topAnchor),
            lbl_soao.leadingAnchor.constraint(equalTo: lbl_ten.trailingAnchor),
            lbl_soao.trailingAnchor.constraint(equalTo: trailingAnchor),
            lbl_soao.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
