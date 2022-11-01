//
//  TeamFund_MonthView.swift
//  FTM_App
//
//  Created by SonGoku on 18/10/2022.
//

import UIKit

protocol controllers_UIView {
    func navigationControllers(month: String, monthInt: Int)
}

class TeamFund_MonthView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayMonthly.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TeamFund_MonthCell
        cell.lbl_Monthly.text = arrayMonthly[indexPath.item]
//        self.month = arrayMonthly[indexPath.item]
        cell.backgroundColor = .systemOrange
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: frame.size.width/4.5, height: frame.size.height/3.5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.month = arrayMonthly[indexPath.item]
        self.monthInt = indexPath.item + 1
        delegate?.navigationControllers(month: month, monthInt: self.monthInt)
    }
    
    var myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
    
    var delegate : controllers_UIView?
    
    var month = ""
    
    var monthInt = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        
        setupLayout()
    }
    
    let arrayMonthly = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    
    private func setupLayout() {
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(TeamFund_MonthCell.self, forCellWithReuseIdentifier: "cell")
        addSubview(myCollectionView)
        myCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            myCollectionView.heightAnchor.constraint(equalTo: heightAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
