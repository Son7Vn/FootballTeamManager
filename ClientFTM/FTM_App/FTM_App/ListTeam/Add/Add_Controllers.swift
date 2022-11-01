//
//  Add_Controllers.swift
//  FTM_App
//
//  Created by SonGoku on 04/10/2022.
//

import UIKit

protocol reload_Teamate {
    func reloadData(teamlist: [Teamates])
}

extension ListTeam_Add {
    
    @objc func dismissAction() {
        view.endEditing(true)
    }
    
    @objc func addList_Action() {
        
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            
            let url = URL(string: Config.url_Server + "/teamate/add")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            
            guard let ten = txt_ten.text else {return}
            guard let soao = txt_soao.text else {return}
            guard let phone = txt_phone.text else {return}
            guard let sizeao = txt_sizeao.text else {return}
            guard let namsinh = txt_namsinh.text else {return}
            guard let vitri = txt_vitri.text else {return}
            guard let bqt = txt_bqt.text else {return}
            
            let addData = "token=\(token)&ten=\(ten)&soao=\(soao)&phone=\(phone)&sizeao=\(sizeao)&namsinh=\(namsinh)&vitri=\(vitri)&bqt=\(bqt)".data(using: .utf8)
            urlRequest.httpBody = addData
            
            let add_ListTeamSession = URLSession.shared
            add_ListTeamSession.dataTask(with: urlRequest) { rawData, urlResponse, Error in
                
                guard let urlRes = urlResponse as? HTTPURLResponse else {return}
                let url_statuscode = urlRes.statusCode
                
                if (Error != nil) {
                    
                    print(url_statuscode)
                    print("Hello")
                    print(Error as Any)
                    
                } else {
//                    guard let decoded = try? JSONSerialization.jsonObject(with: rawData!, options: .fragmentsAllowed) else {return}
                    if (url_statuscode == 200) {
                        self.find_AllTeamate()
                        
                    } else {
                        print(url_statuscode)
                        guard let dataDecode = try? JSONSerialization.jsonObject(with: rawData!, options: .fragmentsAllowed) else {
                            print("Failed to decode delete session!")
                            return
                        }
                        guard let dataDecodeDic = dataDecode as? [String: Any] else {
                            print("data is nil")
                            return
                        }
                        guard let dataString = dataDecodeDic["message"] as? String else {
                            return
                        }
                        print(dataString)
                        DispatchQueue.main.async {
                            let alertView = UIAlertController(title: "Warning!", message: dataString, preferredStyle: .alert)
                            alertView.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
                            self.present(alertView, animated: true)
                        }
                    }
                }
            }.resume()
            
        } else {
            print("Token in valid!")
        }
    }
    
    func find_AllTeamate() {
        
        if let token = UserDefaults.standard.string(forKey: "UserToken")  {
            let url = URL(string: Config.url_Server + "/teamate/findAll")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = "token=\(token)".data(using: .utf8)
            
            let findAllSession = URLSession.shared
            findAllSession.dataTask(with: urlRequest) { rawData, urlResponseHTTP, err in
                
                guard let urlRes = urlResponseHTTP as? HTTPURLResponse else {
                    return
                }
                if (err != nil) {
                    print(urlRes.statusCode)
                    print(err as Any)
                }
                else {
                    if (urlRes.statusCode == 200) {
                        let decode = JSONDecoder()
                        let dataDecode = try? decode.decode(Json_Teamate.self, from: rawData!)
                        
                        let arrTeamate = dataDecode!.dataTeamate
                        self.delegate?.reloadData(teamlist: arrTeamate)
                    } else {
                        print(urlRes.statusCode)
                    }
                }
                
            }.resume()
        } else {
            print("Token is not valid!")
        }
    }
    
}
