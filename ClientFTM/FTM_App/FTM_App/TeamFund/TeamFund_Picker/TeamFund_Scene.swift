//
//  TeamFund_Scene.swift
//  FTM_App
//
//  Created by SonGoku on 23/09/2022.
//

import UIKit

struct MonthYear {
    var month: String
    var monthInt: Int
    var year: Int
}

class TeamFund_Scene: UIViewController {
    
    var testProtocol: Bool = false
    
    var month_year = MonthYear(month: "", monthInt: 0, year: 0)
    
    var month = ""
    var year = 2022
    
    let view1 = TeamFund_YearView()
    let view2 = TeamFund_MonthView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Team Fund"
        
        setupLayout()
    }
    
    func loadMonthDetails(month: String, year: Int, monthInt: Int) {
        
        DispatchQueue.main.async {
//            let view1 = TeamFund_YearView()
//            self.month_year.year = view1.year
            self.month_year.month = month
            self.month_year.year = year
            self.month_year.monthInt = monthInt
            let tfMonthDetailsScene = TF_MonthDetailsScene()
            tfMonthDetailsScene.month_year = self.month_year
            self.navigationController?.pushViewController(tfMonthDetailsScene, animated: true)
        }
    }
    
    private func setupLayout() {
        
        view.addSubview(view1)
        view1.delegate = self
        view1.backgroundColor = .systemOrange
        view1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            view1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            view1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            view1.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
        view.addSubview(view2)
        view2.delegate = self
        view2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: +30),
            view2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: +10),
            view2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            view2.heightAnchor.constraint(equalTo: view1.heightAnchor, multiplier: 6.0)
        ])
    }
    
}

extension TeamFund_Scene: controllers_UIView, YearDelegate {
    func changeYear(year: Int) {
        self.year = year
    }
    
    func navigationControllers(month: String, monthInt: Int) {
        self.loadMonthDetails(month: month, year: self.year, monthInt: monthInt)
    }
}
