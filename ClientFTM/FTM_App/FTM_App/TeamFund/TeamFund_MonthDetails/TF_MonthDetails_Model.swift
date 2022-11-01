//
//  TF_MonthDetails_Model.swift
//  FTM_App
//
//  Created by SonGoku on 23/10/2022.
//

import UIKit

struct TF_MonDetails: Decodable {
    let dataMonth: [DataMonthly]
}

struct DataMonthly: Decodable {
    let _id: String
    let idTeamate: String
    let nam: Int
    let ten: String
    let thang: Int
    let tien: Int
    let note: String
}
