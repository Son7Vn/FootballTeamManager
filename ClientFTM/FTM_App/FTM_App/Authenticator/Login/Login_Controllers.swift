//
//  Login_Controllers.swift
//  FTM_App
//
//  Created by SonGoku on 22/09/2022.
//

import UIKit

extension Login_Scene {
    
    @objc func Login_Action() {
        
        let url = URL(string: Config.url_Server + "/auth/login")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        let username = txt_Username.text!
        let password = txt_Password.text!
        urlRequest.httpBody = "username=\(username)&password=\(password)".data(using: .utf8)
        
        let session_Login = URLSession.shared
        session_Login.dataTask(with: urlRequest) { data, urlResponse, Error in
            var http_status = 0
            if let urlRes = urlResponse as? HTTPURLResponse {
                http_status = urlRes.statusCode
                print("StatusCode: ", http_status)
            }
            
            if (Error != nil) {
                print("Failed to Login: ", Error as Any)
            } else {
                
                let decodeJson = JSONDecoder()
                let dataJsondecode = try? decodeJson.decode(Login_Data.self, from: data!)
                
                if let dataData = dataJsondecode {
                    let data_message = dataData.message
                    if http_status == 200 {
                        print("Login Success!")
//                        print(dataData)
                        let token = dataData.token
                        UserDefaults.standard.set(token, forKey: "UserToken")
                        DispatchQueue.main.async {
                            let alertView = UIAlertController(title: "Successfully", message: data_message, preferredStyle: .alert)
                            alertView.addAction(UIAlertAction(title: "Go to Home Scene", style: .default, handler: { alertview in
                                let home_Scene = Home_Scene()
                                self.navigationController?.pushViewController(home_Scene, animated: true)
                            }))
                            self.present(alertView, animated: true, completion: nil)
                        }
                        
                    }
                } else {
                    let message = try? decodeJson.decode(Message.self, from: data!)
                    if let message = message {
                        DispatchQueue.main.async {
                            let alertView = UIAlertController(title: "Error!", message: message.message, preferredStyle: .alert)
                            alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }
                }
            }
        }.resume()
    }
    
    @objc func register_Action() {
        let register_Scene = Register_Scene()
        self.navigationController?.pushViewController(register_Scene, animated: true)
    }
    
}
