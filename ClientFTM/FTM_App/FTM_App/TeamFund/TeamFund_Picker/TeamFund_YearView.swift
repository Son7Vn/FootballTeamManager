//
//  TeamFund_YearView.swift
//  FTM_App
//
//  Created by SonGoku on 18/10/2022.
//

import UIKit

protocol YearDelegate {
    func changeYear(year: Int)
}

class TeamFund_YearView: UIView {
    
    var delegate: YearDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    private func setupLayout() {
        let myStackView = UIStackView(arrangedSubviews: [btn_Preview, lbl_Years, btn_Next])
        addSubview(myStackView)
        myStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myStackView.topAnchor.constraint(equalTo: topAnchor),
            myStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myStackView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
        myStackView.distribution = .fillEqually
//        myStackView.addArrangedSubview(btn_Next)
        
    }
    
    let lbl_Years: UILabel = {
        let lbl = UILabel()
        lbl.text = "2022"
        lbl.font = .systemFont(ofSize: 22)
        lbl.textAlignment = .center
        return lbl
    }()
    
    lazy var btn_Preview: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("<", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 25)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(PrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    lazy var btn_Next: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle(">", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 25)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.addTarget(self, action: #selector(PrevNextAction), for: .touchUpInside)
        return btn
    }()
    
    var year = 2022
    
    @objc private func PrevNextAction(_sender: UIButton) {
        if _sender == btn_Next {
            self.year += 1
            delegate?.changeYear(year: year)
            self.lbl_Years.text = "\(self.year)"
        } else {
            self.year = year - 1
            delegate?.changeYear(year: year)
            self.lbl_Years.text = "\(self.year)"
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
