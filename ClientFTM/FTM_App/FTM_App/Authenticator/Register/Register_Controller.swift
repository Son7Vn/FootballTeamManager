//
//  Register_Controller.swift
//  FTM_App
//
//  Created by SonGoku on 20/09/2022.
//

import UIKit

extension Register_Scene {
    
    @objc func dismissAction() {
        view.endEditing(true)
    }
    
    @objc func tapAva_Action() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey(rawValue: UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
            self.img_Avatar.image = image
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func Register_Action() {
        upload_Avatar()
    }
    
    func upload_Avatar() {
        //cre boundary:
        let boundary = UUID().uuidString
        //cre data
        var data = Data()
        data.append("\r\n--\(boundary)\r\n".data(using: .utf8)!)
        data.append("Content-Disposition: form-data; name=\"avatar\"; filename=\"appios.png\"\r\n".data(using: .utf8)!)
        data.append("Content-Type: image/png\r\n\r\n".data(using: .utf8)!)
        data.append((self.img_Avatar.image?.pngData())!)
        data.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        let url = URL(string: Config.url_Server + "/user/upload")
        var urlRequest = URLRequest(url: url!)
        urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = "POST"
        
        let session = URLSession.shared
        session.uploadTask(with: urlRequest, from: data) { data, urlRespose, error in
            var http_status = 0
            if let httpResponse = urlRespose as? HTTPURLResponse {
                    print("statusCode_UploadIMG: \(httpResponse.statusCode)")
                http_status = httpResponse.statusCode
                }
            
            if (error != nil) {
                print("Failed to upload: ", error as Any)
            } else {
                
                let decodeData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                
                if let dataDecode = decodeData as? [String: Any] {
                    if (http_status == 200) {
                        let urlAva = dataDecode["message"]! as! String
                        self.register_withAvatar(avatar_url: urlAva)
                    } else {
                        print(dataDecode as Any)
                    }
                }
            }
        }.resume()
    }
    
    func register_withAvatar(avatar_url: String) {
        DispatchQueue.main.async {
            let username = self.txt_Username.text!
            let email = self.txt_Email.text!
            let password = self.txt_Password.text!
            let avatar = avatar_url
            
            let url = URL(string: Config.url_Server + "/auth/register")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = "username=\(username)&password=\(password)&email=\(email)&avatar=\(avatar)".data(using: .utf8)
            
            let sessionRegister = URLSession.shared
            sessionRegister.dataTask(with: urlRequest) { data, urlRes, Error in
                
                var http_Status = 0
                if let url_Res = urlRes as? HTTPURLResponse {
                    print("statusCode_Register: \(url_Res.statusCode)")
                    http_Status = url_Res.statusCode
                }
                
                if (Error != nil) {
                    print("Failed to register: ", Error as Any)
                } else {
                    let decodeData = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    if let dataData = decodeData as? [String: Any] {
                            if (http_Status == 200) {
                                DispatchQueue.main.async {
                                    let alerView = UIAlertController(title: "Succesfully!", message: "You're a member now", preferredStyle: .alert)
                                    alerView.addAction(UIAlertAction(title: "Go to SignIn", style: .default, handler: { alertview in
                                        let login_Scene = Login_Scene()
                                        self.navigationController?.pushViewController(login_Scene, animated: true)
                                    }))
                                    self.present(alerView, animated: true, completion: nil)
                                }
                            } else {
                                if let message = dataData["message"] as? String {
                                    DispatchQueue.main.async {
                                        let alertView = UIAlertController(title: "Error!", message: message, preferredStyle: .alert)
                                        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                                        self.present(alertView, animated: true, completion: nil)
                                    }
                                }
                                
                            }
                    } else {
                        
                    }
                }
            }.resume()
        }
    }
}
