//
//  ListTeamCollec_Controllers.swift
//  FTM_App
//
//  Created by SonGoku on 03/10/2022.
//

import UIKit

extension ListTeam_CollectionView {
    
    
    func reloadData(teamlist: [Teamates]) {
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                    self.arr_ListTeamate = teamlist
                    self.collectionView.reloadData()
            }
        }
    }
    
    @objc func add_Action() {
        let addListTeam_View = ListTeam_Add()
        addListTeam_View.delegate = self
        self.present(addListTeam_View, animated: true, completion: nil)
//        self.navigationController?.pushViewController(addListTeam_View, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let updateDel_View = ListTeam_UpdateDelete()
        updateDel_View.delegate = self
        updateDel_View.teamate = self.arr_ListTeamate[indexPath.item]
        self.present(updateDel_View, animated: true, completion: nil)
    }
    
    func load_TeamList() {
        
        let token = UserDefaults.standard.string(forKey: "UserToken")
        if (token != nil) {
            
            let url = URL(string: Config.url_Server + "/teamate/findAll")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            guard let token = token else {return}
            urlRequest.httpBody = "token=\(token)".data(using: .utf8)
            
            let loadTeamList_Session = URLSession.shared
            loadTeamList_Session.dataTask(with: urlRequest) { rawData, urlResponse, Error in
                
                guard let urlStatus = urlResponse as? HTTPURLResponse else {return}
                
                if (Error != nil) {
                    print(urlStatus)
                    print("Failed to load: ", Error as Any)
                } else {
                    let decoded = JSONDecoder()
                    guard let data = try? decoded.decode(Json_Teamate.self, from: rawData!) else {
                        print("Failed to decode")
                        return

                    }
                    self.arr_ListTeamate = data.dataTeamate
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                
            }.resume()
        } else {
            print("please provide the token")
        }
        
    }
    
    
}
