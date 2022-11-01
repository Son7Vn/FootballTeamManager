//
//  TFM_AddControllers.swift
//  FTM_App
//
//  Created by SonGoku on 27/10/2022.
//

import UIKit

struct TFM_AddMongoDB: Encodable, Decodable{
    let idTeamate: String
    let nam: Int
    let ten: String
    let thang: Int
    let tien: Int
    let note: String
}

protocol ReloadTFM_CollectionDelegate {
    func reloadTFM_View2()
}

extension TF_MonthDetails_View2_Add {
    
    func loadTeamates() {
//        self.arr_TFMAdd = []
        let url = URL(string: Config.url_Server + "/teamate/findAll2")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { rawData, urlResponse, error in
            guard let urlRes = urlResponse as? HTTPURLResponse else {return}
            let statusCode = urlRes.statusCode
            print("StatusCode of loadTeamates: ",statusCode)
            if (error != nil) {
                print("Error loadTeamates: ", error as Any)
            } else {
                let decode = JSONDecoder()
                guard let dataDecode = try? decode.decode(Json_Teamate.self, from: rawData!) else {
                    print("Failed to decode loadTeamates!")
                    return
                }
                self.arr_Teamate = dataDecode.dataTeamate
                self.createNewArray(arr_Teamates: self.arr_Teamate, arr_TFM: self.arr_TFM)
            }
            
        }.resume()
    }
    
    func createNewArray(arr_Teamates: [Teamates], arr_TFM: [DataMonthly]) {
        
        guard let month_year = month_year else {return}
        
        for i in 0..<arr_Teamates.count {
            
            if arr_TFM.count == 0 {
                let arr = arr_Teamates[i]
                let newTFM = TFMAdd(idTeamate: arr._id, nam: month_year.year, ten: arr.ten, thang: month_year.monthInt, tien: 0, note: "")
                self.arr_TFMAdd.append(newTFM)
            } else {
                for k in 0..<arr_TFM.count {
                    let tfm = arr_TFM[k].idTeamate
                    let teamate = arr_Teamates[i]._id
                    if tfm == teamate {
                        break
                    } else {
                        if (k == arr_TFM.count - 1) {
                            let arr = arr_Teamates[i]
                            let newTFM = TFMAdd(idTeamate: arr._id, nam: month_year.year, ten: arr.ten, thang: month_year.monthInt, tien: 0, note: "")
                            self.arr_TFMAdd.append(newTFM)
                        }
                    }
                }
            }
        }
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    @objc func add_Action() {
        
        let alertView = UIAlertController(title: "Add Option", message: "Please confirm to add new TeamFunds", preferredStyle: .alert)
        alertView.addAction(UIAlertAction(title: "Confirmed", style: .default, handler: { action in
            self.addAllUserSelected()
            
            self.dismiss(animated: true)
        }))
        alertView.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in
            
        }))
        self.present(alertView, animated: true)
    }
    
    func addAllUserSelected() {
        
        for (i,num) in self.arr_TFMAdd.enumerated().reversed() {
            if (num.uncheck == false) {
                let newTFM = TFM_AddMongoDB(idTeamate: num.idTeamate, nam: num.nam, ten: num.ten, thang: num.thang, tien: num.tien, note: num.note)
                self.arr_AddMongoDB.append(newTFM)
                self.arr_TFMAdd.remove(at: i)
            }
        }
        guard let dataTest = try? JSONEncoder().encode(self.arr_AddMongoDB) else {
            print("cannot convert")
            return
        }
        guard let resultString = String(data: dataTest, encoding: .utf8) else {
            return
        }
        self.saveOnMongoDB(dataTest: resultString)
    }
    
    func saveOnMongoDB(dataTest: String) {
        
        let url = URL(string: Config.url_Server + "/teamate/addManyTFM")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = "arrayTFM=\(dataTest)".data(using: .utf8)
        
        let urlSession = URLSession.shared
        urlSession.dataTask(with: urlRequest) { rawData, urlResponse, error in
            guard let urlRes = urlResponse as? HTTPURLResponse else {return}
            let statuscode = urlRes.statusCode
            if (error != nil) {
                print("save mongodb statuscode: ",statuscode)
                print("save Mongo Failed: ", error as Any)
            } else {
                self.loadTFM()
            }
            
        }.resume()
    }
    
    func loadTFM() {
        guard let month_year = month_year else {return}
        let url = URL(string: Config.url_Server + "/teamate/findAllTeamFundMonth")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = "thang=\(month_year.monthInt)&nam=\(month_year.year)".data(using: .utf8)
        
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
                self.arr_TFM = dataDee.dataMonth
                self.delegate?.reloadData(dataMonth: self.arr_TFM)
            }
        }.resume()
    }
    
}
