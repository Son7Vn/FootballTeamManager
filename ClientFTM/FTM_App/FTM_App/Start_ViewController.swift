//
//  ViewController.swift
//  FTM_App
//
//  Created by SonGoku on 19/09/2022.
//

import UIKit

class Start_ViewController: UIViewController {

    let imgBackground: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    lazy var btn_Start: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Welcome", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .systemOrange
        btn.layer.cornerRadius = 4
        btn.alpha = 0.8
        btn.addTarget(self, action: #selector(Start_Action), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let verifyTokenIsOk = true
    
    @objc private func Start_Action() {
        
        UserDefaults.standard.set("dfsdf", forKey: "UserToken")
        if let token = UserDefaults.standard.string(forKey: "UserToken") {
            let url = URL(string: Config.url_Server + "/auth/verify")
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "POST"
            urlRequest.httpBody = "token=\(token)".data(using: .utf8)
            
            let verifySession = URLSession.shared
            verifySession.dataTask(with: urlRequest) { data, urlResponse, Error in
                
                let urlRes = urlResponse as! HTTPURLResponse
                print(urlRes.statusCode)
//                print(token)
                if (Error != nil) {
                    print(Error as Any)
                    
                } else {
                    let dataDecode = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                    
                    if let dataDe = dataDecode as? [String: Any] {
                        print(dataDe)
                        if (urlRes.statusCode == 200) {
                            DispatchQueue.main.async {
                                let homeSence = Home_Scene()
                                self.navigationController?.pushViewController(homeSence, animated: true)
                            }
                        } else {
                            DispatchQueue.main.async {
                                let loginScene = Login_Scene()
                                self.navigationController?.pushViewController(loginScene, animated: true)
                            }
                        }
                        
                        
                    } else {
                        
                    }
                }
            }.resume()
        } else {
            
        }
        
        
        
//        tabbarController.modalPresentationStyle = .fullScreen
//        present(tabbarController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        view.addSubview(imgBackground)
        imgBackground.image = UIImage(named: "licogi12")
        NSLayoutConstraint.activate([
            imgBackground.topAnchor.constraint(equalTo: view.topAnchor),
            imgBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imgBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imgBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        view.addSubview(btn_Start)
        NSLayoutConstraint.activate([
            btn_Start.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            btn_Start.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            btn_Start.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            btn_Start.heightAnchor.constraint(equalTo: btn_Start.widthAnchor, multiplier: 0.3)
        ])
    }

}

