//
//  Collection_Model.swift
//  FTM_App
//
//  Created by SonGoku on 03/10/2022.
//

import Foundation


struct Json_Teamate: Decodable {
//    let message: String
    let dataTeamate: [Teamates]
}

struct Teamates: Decodable {
    let _id: String
    let ten: String
    let soao: String
    let phone: String
    let sizeao: String
    let namsinh: String
    let vitri: String
    let bqt: String
}
