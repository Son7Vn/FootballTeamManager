//
//  ListTeam_Add.swift
//  FTM_App
//
//  Created by SonGoku on 27/09/2022.
//

import UIKit
//import SwiftUI

class ListTeam_Add: UIViewController {
    
    let img_Background: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "licogi12")
        img.alpha = 0.1
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let lbl_Tittle: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.text = "Add Member"
        lbl.font = UIFont.boldSystemFont(ofSize: 24)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let txt_ten: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "Ten thanh vien *"
//        txt.attributedPlaceholder = NSAttributedString(
//            string: "Ten thanh vien",
//            attributes: [NSAttributedString.Key.foregroundColor: UIColor.red]
//        )
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocapitalizationType = .none
        txt.layer.cornerRadius = 2
        txt.autocorrectionType = .no
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_phone: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "So dien thoai"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocorrectionType = .no
        txt.layer.cornerRadius = 2
        txt.autocapitalizationType = .none
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_soao: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "Số áo"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocorrectionType = .no
        txt.layer.cornerRadius = 2
        txt.autocapitalizationType = .none
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_sizeao: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "Size ao"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocorrectionType = .no
        txt.layer.cornerRadius = 2
        txt.autocapitalizationType = .none
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_namsinh: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "Năm sinh"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocorrectionType = .no
        txt.layer.cornerRadius = 2
        txt.autocapitalizationType = .none
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_vitri: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "Vị trí"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocorrectionType = .no
        txt.layer.cornerRadius = 2
        txt.autocapitalizationType = .none
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    let txt_bqt: LeafPaddedTextField = {
        let txt = LeafPaddedTextField()
        txt.placeholder = "Bqt *"
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.layer.borderColor = UIColor.darkGray.cgColor
        txt.layer.borderWidth = 1
        txt.autocorrectionType = .no
        txt.layer.cornerRadius = 2
        txt.autocapitalizationType = .none
//        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    lazy var btn_AddListTeam: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add Member", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 2
        btn.backgroundColor = .systemOrange
        btn.addTarget(self, action: #selector(addList_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
//    var arrTeamate = [Teamates]()
    
    var delegate: reload_Teamate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupLayout()
    }
}

