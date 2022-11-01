//
//  ListTeam_Scene.swift
//  FTM_App
//
//  Created by SonGoku on 23/09/2022.
//

import UIKit

class ListTeam_CollectionView: UICollectionViewController, UICollectionViewDelegateFlowLayout, reload_Teamate {
    
    
    let lbl_name: UILabel = {
        let lbl = UILabel()
        lbl.text = "Name"
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lbl_squadNum: UILabel = {
        let lbl = UILabel()
        lbl.text = "Number"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lbl_position: UILabel = {
        let lbl = UILabel()
        lbl.text = "Positions"
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 18)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var arr_ListTeamate = [Teamates]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Team List"
        
        self.load_TeamList()
        self.setupLayout()
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionView.invalidateIntrinsicContentSize()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr_ListTeamate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! ListTeam_Cell
        
        cell.txt_name.text = arr_ListTeamate[indexPath.item].ten
        
        let soao = arr_ListTeamate[indexPath.item].soao
        cell.txt_squadnum.text = soao
        
        cell.txt_position.text = arr_ListTeamate[indexPath.item].vitri
        cell.txt_position.text = arr_ListTeamate[indexPath.item].vitri
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.size.width, height: view.frame.size.height/15)
    }
    
    
    
}
