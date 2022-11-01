//
//  ListTeam_Cell.swift
//  FTM_App
//
//  Created by SonGoku on 23/09/2022.
//

import UIKit

class ListTeam_Cell: UICollectionViewCell {
    
    var txt_name: UILabel = {
        let txt = UILabel()
        txt.text = "defaut"
        txt.textAlignment = .left
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txt_squadnum: UILabel = {
        let txt = UILabel()
        txt.text = "none"
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    var txt_position: UILabel = {
        let txt = UILabel()
        txt.text = "none"
        txt.textAlignment = .center
        txt.font = UIFont.systemFont(ofSize: 14)
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupLayOut()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
