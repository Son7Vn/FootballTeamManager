//
//  TF_MonthDetails_View2_Update&Delete.swift
//  FTM_App
//
//  Created by SonGoku on 22/10/2022.
//

import UIKit

class TF_MonthDetails_View2_UpdateDelete: UIViewController {
    
    var tfm = DataMonthly(_id: "", idTeamate: "dfdf", nam: 2022, ten: "Son", thang: 9, tien: 0, note: "")
    var data_TFMonthly: [DataMonthly] = []
    var delegate: teamFundDetailsTrans?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        txtField_tien.delegate = self
        setupLayout()
        self.txtField_tien.text = "\(self.tfm.tien)"
        self.txtField_Note.text = self.tfm.note
    }
    
    let lbl_tittle: UILabel = {
        let lbl = UILabel()
        lbl.text = "Update/Delete"
        lbl.textAlignment = .center
        lbl.backgroundColor = .systemOrange
        lbl.layer.cornerRadius = 10
        lbl.font = .boldSystemFont(ofSize: 25)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let lbl_tien: TextPaddedLabel = {
        let lbl = TextPaddedLabel()
        lbl.text = "Money:"
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 18)
//        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    let txtField_tien: CustomTextField = {
        let txt = CustomTextField()
        txt.placeholder = "123"
        txt.textAlignment = .right
        txt.textColor = .darkText
        txt.font = .systemFont(ofSize: 18)
        return txt
    }()
    let lbl_Note: TextPaddedLabel = {
        let lbl = TextPaddedLabel()
        lbl.text = "Note:"
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 18)
        return lbl
    }()
    let txtField_Note: CustomTextField = {
        let txt = CustomTextField()
        txt.placeholder = "note..."
//        txt.text = "Cong hoa xa hoi chu nghia dia thit ngan Doc lap tu do mieng nao to thi gap"
        txt.textAlignment = .left
//        txt.frame.size.height = 53
        txt.font = .systemFont(ofSize: 16)
        return txt
    }()
    lazy var btn_Update: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Update", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.setTitleColor(UIColor.darkText, for: .normal)
        btn.addTarget(self, action: #selector(Update_Action), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var btn_Delete: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Delete", for: .normal)
        btn.backgroundColor = .systemOrange
        btn.setTitleColor(UIColor.darkText, for: .normal)
        btn.addTarget(self, action: #selector(Del_Action), for: .touchUpInside)
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    @objc func Update_Action() {
        let alertView = UIAlertController(title: "Update", message: "Do you want update?", preferredStyle: .alert)
        alertView.addAction(UIAlertAction.init(title: "Confirmed", style: .default, handler: { conf in
            self.update_FTM()
            
            
        }))
        alertView.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alertView, animated: true)
        
    }
    
    
    private func update_FTM() {
        
        guard let txttien = self.txtField_tien.text else {return}
        guard let tien: Int = Int(txttien) else {return}
        guard let note = self.txtField_Note.text else {return}
        let id = self.tfm._id
        
        let url = URL(string: Config.url_Server + "/teamate/updateMoneyTeamFund")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        urlRequest.httpBody = "id=\(id)&newtien=\(tien)&newnote=\(note)".data(using: .utf8)
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { rawData, urlResponse, error in
            guard let urlRes = urlResponse as? HTTPURLResponse else {return}
            let statusCode = urlRes.statusCode
            print(statusCode)
            if (error != nil) {
                print("Error update: ", error as Any)
            } else {
//                guard let dataDecode = try? JSONSerialization.jsonObject(with: rawData!, options: .fragmentsAllowed) else {return}
//                print(dataDecode)
                self.load_TFM()
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            }
        }.resume()
    }
    
    @objc func Del_Action() {
        let alertView = UIAlertController(title: "Delete", message: "Do you want Delete?", preferredStyle: .alert)
        alertView.addAction(UIAlertAction.init(title: "Confirmed", style: .default, handler: { conf in
            self.del_tfm()
            
        }))
        alertView.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
        present(alertView, animated: true)
    }
    private func del_tfm() {
        
        let id = self.tfm._id
        
        let url = URL(string: Config.url_Server + "/teamate/deleteTFM")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        urlRequest.httpBody = "id=\(id)".data(using: .utf8)
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { rawData, urlResponse, error in
            guard let urlRes = urlResponse as? HTTPURLResponse else {return}
            let statusCode = urlRes.statusCode
            print(statusCode)
            if (error != nil) {
                print("Error update: ", error as Any)
            } else {
                self.load_TFM()
                DispatchQueue.main.async {
                    self.dismiss(animated: true)
                }
            }
        }.resume()
    }
    var total_TFM = 0
    private func load_TFM() {
        
        let url = URL(string: Config.url_Server + "/teamate/findAllTeamFundMonth")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = "thang=\(self.tfm.thang)&nam=\(self.tfm.nam)".data(using: .utf8)
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { rawData, urlResponse, error in
            
            guard let urlRes = urlResponse as? HTTPURLResponse else {return}
            let statusCode = urlRes.statusCode
            
            if (error != nil) {
                print(statusCode)
                print("Failed to findAllTeamFundMonth: ", error as Any)
            } else {
                let decode = JSONDecoder()
                let dataDecode = try? decode.decode(TF_MonDetails.self, from: rawData!)
                guard let dataDee = dataDecode else {
                    print("Failed decoded")
                    return
                }
                self.data_TFMonthly = dataDee.dataMonth
                if(self.data_TFMonthly.count != 0) {
                    for i in 0..<self.data_TFMonthly.count {
                        let tf = self.data_TFMonthly[i].tien
                        self.total_TFM += tf
                    }
                }
                self.data_TFMonthly = dataDee.dataMonth
                self.delegate?.reload_frUpdateAddDel(dataMonth: self.data_TFMonthly, total_TFM: self.total_TFM)
            }
        }.resume()
    }
}

extension TF_MonthDetails_View2_UpdateDelete: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let allowCharactors = CharacterSet.decimalDigits
        let allowCharactorSet = CharacterSet(charactersIn: string)
//            let typeCharactorSetIn = CharacterSet(charactersIn: allowCharactors)
        let numbers = allowCharactors.isSuperset(of: allowCharactorSet)
        return numbers
    
    }
}
