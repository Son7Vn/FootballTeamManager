//
//  TF_MonthDetailsScene.swift
//  FTM_App
//
//  Created by SonGoku on 19/10/2022.
//

import UIKit

class TF_MonthDetailsScene: UIViewController {
    
    var month_year = MonthYear(month: "", monthInt: 0, year: 0)
    var data_TFMonthly: [DataMonthly] = []
    
    var total_TFM: Int = 0
    
    let view1 = TF_MonthDetails_View1()
    let view2 = TF_MonthDetails_View2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "TeamFundMonthDetails"
        self.loadTeamFundMonth()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    @objc private func add_Action() {
        let layout = UICollectionViewFlowLayout()
        let addScene = TF_MonthDetails_View2_Add(collectionViewLayout: layout)
        addScene.delegate = self
        addScene.arr_TFM = self.data_TFMonthly
        addScene.month_year = self.month_year
        present(addScene, animated: true)
    }
    
    private func setupLayout() {
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add_Action))
        
        view1.lbl_MonthYear.text = "\(month_year.month)-\(month_year.year)"
        view1.lbl_totalValue.text = ": \(self.total_TFM)"
//        print(view1.total_tfm)
        view.addSubview(view1)
        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
        view.addSubview(view2)
        view2.delegate = self
        view2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor),
            view2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: +5),
            view2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            view2.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        ])
    }
    
    private func loadTeamFundMonth() {
        
        let url = URL(string: Config.url_Server + "/teamate/findAllTeamFundMonth")
        var urlRequest = URLRequest(url: url!)
        urlRequest.httpMethod = "POST"
        urlRequest.httpBody = "thang=\(self.month_year.monthInt)&nam=\(month_year.year)".data(using: .utf8)
        
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
                print(self.total_TFM)
                
                self.view2.arr_TFMDetails = self.data_TFMonthly
                DispatchQueue.main.async {
                    self.view1.lbl_totalValue.text = "\(self.total_TFM)"
                    self.view2.myCollectionView.reloadData()
                }
            }
        }.resume()
    }
    
}
extension TF_MonthDetailsScene: teamFundDetailsTrans {
    func gotoUpdateDelScene(dataTFM: DataMonthly) {
        let updateDelScene = TF_MonthDetails_View2_UpdateDelete()
        updateDelScene.tfm = dataTFM
        updateDelScene.delegate = self
        present(updateDelScene, animated: true)
    }
//    func reloadData(data) {
//        self.loadTeamFundMonth()
//    }
    func reloadData(dataMonth: [DataMonthly]) {
        self.view2.arr_TFMDetails = dataMonth
        self.data_TFMonthly = dataMonth
        DispatchQueue.main.async {
            self.view2.myCollectionView.reloadData()
        }
    }
    
    func reload_frUpdateAddDel(dataMonth: [DataMonthly], total_TFM: Int) {
        self.view2.arr_TFMDetails = dataMonth
        self.data_TFMonthly = dataMonth
        
        DispatchQueue.main.async {
            self.view1.lbl_totalValue.text = "\(total_TFM)"
            self.view2.myCollectionView.reloadData()
        }
    }
}
