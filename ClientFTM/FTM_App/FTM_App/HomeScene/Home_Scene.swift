//
//  Home_Scene.swift
//  FTM_App
//
//  Created by SonGoku on 22/09/2022.
//

import UIKit

class Home_Scene: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        let listeamView = ListTeam_CollectionView(collectionViewLayout: layout)
        let listTeam_Scene = UINavigationController(rootViewController: listeamView)
        
        listeamView.title = "List team"
        let teamFund_Scene = UINavigationController(rootViewController: TeamFund_Scene())
        teamFund_Scene.title = "Team fund"
        let matchSchedule_Scene = UINavigationController(rootViewController: MatchSchedule_Scene())
        matchSchedule_Scene.title = "Match Schedule"
        
        self.setViewControllers([teamFund_Scene, listTeam_Scene, matchSchedule_Scene], animated: false)
        
        guard let items = self.tabBar.items else {return}
        
        let imageList = ["list.bullet","dollarsign.circle","alarm"]
//        let tittleList = ["ListTeam", "TeamFund", "MatchSche"]
        
        for x in 0..<items.count {
            items[x].image = UIImage(systemName: imageList[x])
//            items[x].title = tittleList[x]
        }
        self.tabBar.backgroundColor = .white
        self.tabBar.alpha = 1
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
}
