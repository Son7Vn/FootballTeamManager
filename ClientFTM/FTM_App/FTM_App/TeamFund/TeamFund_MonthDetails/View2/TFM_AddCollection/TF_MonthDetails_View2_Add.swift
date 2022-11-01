//
//  TF_MonthDetails_View2_Add.swift
//  FTM_App
//
//  Created by SonGoku on 22/10/2022.
//

import UIKit

struct TFMAdd {
    let idTeamate: String
    let nam: Int
    let ten: String
    let thang: Int
    let tien: Int
    let note: String
    var uncheck = true
}

class TF_MonthDetails_View2_Add: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr_TFMAdd.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TFM_View2_AddCell
        cell.backgroundColor = .lightGray
        cell.delegate = self
        cell.lbl_ten.text = arr_TFMAdd[indexPath.item].ten
        cell.lbl_soao.text = "\(arr_TFMAdd[indexPath.item].tien)"
        cell.checkbox.imgView.isHidden = arr_TFMAdd[indexPath.item].uncheck
//        cell.unchecked = arrayX[indexPath.item].uncheck
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Add New TeamFunds"
        print("viewDidLoad")
//        self.arr_TFMAdd = []
        loadTeamates()
        setupLayout()
    }
    
    var delegate: TF_MonthDetailsScene?
    
    var arr_TFM: [DataMonthly] = []
    
    var arr_Teamate: [Teamates] = []
    
    var arr_TFMAdd: [TFMAdd] = []
    
    var month_year: MonthYear?
    
    var arr_AddMongoDB: [TFM_AddMongoDB] = []
    
    let lbl_Tittle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Add New Teamfunds"
        lbl.font = .boldSystemFont(ofSize: 22)
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    lazy var btn_GetAll: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Get All", for: .normal)
        btn.setTitleColor(UIColor.darkText, for: .normal)
        btn.layer.cornerRadius = 10
        btn.backgroundColor = .systemOrange
        btn.addTarget(self, action: #selector(getAll_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var btn_Add: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.darkText, for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.cornerRadius = 5
        btn.addTarget(self, action: #selector(add_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    var getAll = false
    
    @objc func getAll_Action() {
        
        self.getAll = !getAll
        
        if (self.getAll == true) {
            for i in 0..<self.arr_TFMAdd.count {
                self.arr_TFMAdd[i].uncheck = false
            }
                    
        } else if (self.getAll == false) {
            for i in 0..<self.arr_TFMAdd.count {
                self.arr_TFMAdd[i].uncheck = true
            }
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension TF_MonthDetails_View2_Add: TFM_AddDelegate {
    func getAction(cell: UICollectionViewCell) {
        guard let indexTapping = collectionView.indexPath(for: cell) else {return}
        
        let ten = self.arr_TFMAdd[indexTapping.item].ten
        
        let uncheckbase = self.arr_TFMAdd[indexTapping.item].uncheck
        
        self.arr_TFMAdd[indexTapping.item].uncheck = !uncheckbase
        
//        collectionView.reloadItems(at: [indexTapping])
        print("\(ten) , unchecked: \(arr_TFMAdd[indexTapping.item].uncheck)")
        
    }
    
    
}
