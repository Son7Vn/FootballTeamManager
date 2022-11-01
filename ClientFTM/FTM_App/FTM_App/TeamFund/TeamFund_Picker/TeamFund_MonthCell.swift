//
//  TeamFund_MonthCell.swift
//  FTM_App
//
//  Created by SonGoku on 19/10/2022.
//

import UIKit

class TeamFund_MonthCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let lbl_Monthly: UILabel = {
        let lbl = UILabel()
        lbl.text = "Monthly"
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lbl_Money: UILabel = {
        let lbl = UILabel()
        lbl.text = "0.00"
        lbl.textColor = .systemGray
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private func setupLayout() {
        layer.cornerRadius = 5
        addSubview(lbl_Monthly)
        NSLayoutConstraint.activate([
            lbl_Monthly.topAnchor.constraint(equalTo: topAnchor),
            lbl_Monthly.leadingAnchor.constraint(equalTo: leadingAnchor),
            lbl_Monthly.trailingAnchor.constraint(equalTo: trailingAnchor),
            lbl_Monthly.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3)
        ])
        addSubview(lbl_Money)
        NSLayoutConstraint.activate([
            lbl_Money.topAnchor.constraint(equalTo: lbl_Monthly.bottomAnchor),
            lbl_Money.leadingAnchor.constraint(equalTo: leadingAnchor),
            lbl_Money.trailingAnchor.constraint(equalTo: trailingAnchor),
            lbl_Money.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7)
        ])

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
