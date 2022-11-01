//
//  TF_MonthDetails_View2.swift
//  FTM_App
//
//  Created by SonGoku on 21/10/2022.
//

import UIKit

protocol teamFundDetailsTrans {
    func gotoUpdateDelScene(dataTFM: DataMonthly)
    func reloadData(dataMonth: [DataMonthly])
    func reload_frUpdateAddDel(dataMonth: [DataMonthly], total_TFM: Int)
}

class TF_MonthDetails_View2: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr_TFMDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TF_MonthDetails_View2_Cell
        cell.lbl_Name.text = arr_TFMDetails[indexPath.item].ten
        cell.lbl_Money.text = "\(arr_TFMDetails[indexPath.item].tien)"
        cell.lbl_Note.text = arr_TFMDetails[indexPath.item].note
//        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dataTFM = self.arr_TFMDetails[indexPath.item]
        delegate?.gotoUpdateDelScene(dataTFM: dataTFM)
    }
    
    var arr_TFMDetails: [DataMonthly] = []
    
    var myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: UICollectionViewFlowLayout())
    
    var delegate: teamFundDetailsTrans?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        DispatchQueue.main.async {
            self.myCollectionView.reloadData()
        }
        setupLayout()
    }
    
    private func setupLayout() {
        backgroundColor = .systemBackground
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        myCollectionView.register(TF_MonthDetails_View2_Cell.self, forCellWithReuseIdentifier: "cell")
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
