//
//  ListTeam_UpdateDelControllers.swift
//  FTM_App
//
//  Created by SonGoku on 06/10/2022.
//

import UIKit

extension ListTeam_UpdateDelete {
    
    func setText() {
        guard let teamate = teamate else {return}
        
        DispatchQueue.main.async {
            self.txt_ten.text = teamate.ten
            self.txt_soao.text = teamate.soao
            self.txt_phone.text = teamate.phone
            self.txt_sizeao.text = teamate.sizeao
            self.txt_namsinh.text = teamate.namsinh
            self.txt_vitri.text = teamate.vitri
            self.txt_bqt.text = teamate.bqt
        }
    }
    
    @objc func update_Action() {
        
        let alertView = UIAlertController(title: "Update", message: "Do you want to Update?", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
            self.update_Teamate()
        }))
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertView, animated: true)
    }
    
    func update_Teamate() {
        
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            
            guard let id = teamate?._id else {return}
            guard let ten = txt_ten.text else {return}
            guard let soao = txt_soao.text else {return}
            guard let phone = txt_phone.text else {return}
            guard let sizeao = txt_sizeao.text else {return}
            guard let namsinh = txt_namsinh.text else {return}
            guard let vitri = txt_vitri.text else {return}
            guard let bqt = txt_bqt.text else {return}
            
            let addData = "token=\(token)&id=\(id)&ten=\(ten)&soao=\(soao)&phone=\(phone)&sizeao=\(sizeao)&namsinh=\(namsinh)&vitri=\(vitri)&bqt=\(bqt)".data(using: .utf8)
            
            let url = URL(string: Config.url_Server + "/teamate/update")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpBody = addData
            urlRequest.httpMethod = "POST"
            
            let update_Session = URLSession.shared
            update_Session.dataTask(with: urlRequest, completionHandler: { rawData, urlResponseHTTP, err in
                
                guard let urlRes = urlResponseHTTP as? HTTPURLResponse else {return}
                let statuscode = urlRes.statusCode
                if (err != nil) {
                    print(statuscode)
                    print(err as Any)
                } else {
                    if (statuscode == 200) {
    //                    DispatchQueue.main.async {
                            self.findAll_Teamtes()
    //                    }
                    } else {
                        print(statuscode)
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
            }).resume()
            
        } else {
            print("Token in valid!")
        }
        
        
    }
    
    func findAll_Teamtes() {
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            let url = URL(string: Config.url_Server + "/teamate/findAll")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = "token=\(token)".data(using: .utf8)
            
            let findAll_Teamate = URLSession.shared
            findAll_Teamate.dataTask(with: urlRequest) { rawData, urlResponseHTTP, err in
                
                guard let urlRes = urlResponseHTTP as? HTTPURLResponse else {return}
                
                if (err != nil) {
                    print(urlRes.statusCode)
                    print(err as Any)
                } else {
                    
                    if (urlRes.statusCode == 200) {
                        let decoded = JSONDecoder()
                        guard let dataDecode = try? decoded.decode(Json_Teamate.self, from: rawData!) else {
                            print("Failed to decode")
                            return
                        }
                        let arrTeamate = dataDecode.dataTeamate
                        self.delegate?.reloadData(teamlist: arrTeamate)
                        
                    } else {
                        print(urlRes.statusCode)
                        print("findAll Failed")
                        guard let dataDecode = try? JSONSerialization.jsonObject(with: rawData!, options: .fragmentsAllowed) else {
                            print("Failed to decode")
                            return
                        }
                        print(dataDecode)
                    }
                }
                
            }.resume()
        }
    }
    
    @objc func delete_Action() {
        
        let alertView = UIAlertController(title: "Delete", message: "Do you want to Delete this Teamate?", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Ok", style: .default, handler: { alert in
            self.delete_Teamate()
        }))
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertView, animated: true)
        
    }
    
    func delete_Teamate() {
        
        guard let id = teamate?._id else {return}
        
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            let url = URL(string: Config.url_Server + "/teamate/delete")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = "token=\(token)&id=\(id)".data(using: .utf8)
            
            let deleteTeamate_Session = URLSession.shared
            deleteTeamate_Session.dataTask(with: urlRequest, completionHandler: { rawData, urlResponseHTTP, err in
                
                guard let urlRes = urlResponseHTTP as? HTTPURLResponse else {return}
                let statuscode = urlRes.statusCode
                
                if(err != nil) {
                    print(statuscode)
                    print("Delete err: ", err as Any)
                } else {
                    
                    if (statuscode == 200) {
                        
                        print("Delete is ok!")
                        self.findAll_Teamtes()
                        
                    } else {
                        print(statuscode)
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
                
            }).resume()
        } else {
            print("Token in valid!")
        }
        
    }
    
}
