//
//  TF_MonthDetails_View1.swift
//  FTM_App
//
//  Created by SonGoku on 21/10/2022.
//

import UIKit

class TF_MonthDetails_View1: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .systemBackground
        let stackview1 = UIStackView()
        stackview1.backgroundColor = .systemOrange
        stackview1.distribution = .fillEqually
        let lbl_name = ["Name","Money","Note"]
        
        for i in 0..<3 {
            if (i == 0) {
                let lbl: UILabel = {
                    let lblx = UILabel()
                    lblx.text = lbl_name[i]
                    lblx.textAlignment = .left
                    lblx.font = .systemFont(ofSize: 18)
                    return lblx
                }()
                stackview1.addArrangedSubview(lbl)
            } else {
                let lbl: UILabel = {
                    let lblx = UILabel()
                    lblx.text = lbl_name[i]
                    lblx.textAlignment = .center
                    lblx.font = .systemFont(ofSize: 18)
                    return lblx
                }()
                stackview1.addArrangedSubview(lbl)
            }
        }
        
        let stackview3 = UIStackView(arrangedSubviews: [lbl_total, lbl_totalValue])
        stackview3.distribution = .fillEqually
        stackview3.axis = .horizontal
        
        let stackview2 = UIStackView(arrangedSubviews: [lbl_MonthYear, stackview3, stackview1])
        stackview2.distribution = .fillEqually
        stackview2.axis = .vertical
        stackview2.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackview2)
        NSLayoutConstraint.activate([
            stackview2.topAnchor.constraint(equalTo: topAnchor),
            stackview2.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackview2.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackview2.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    
    
    let lbl_MonthYear: UILabel = {
        let lbl = UILabel()
        lbl.text = "Month/Year"
        lbl.textAlignment = .center
        lbl.backgroundColor = .systemOrange
        lbl.font = .systemFont(ofSize: 20)
        return lbl
    }()
    
    let lbl_total: UILabel = {
        let lbl = UILabel()
        lbl.text = "Total:"
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 20)
        return lbl
    }()
    
    let lbl_totalValue: UILabel = {
        let lbl = UILabel()
        lbl.text = "0"
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 20)
        return lbl
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
