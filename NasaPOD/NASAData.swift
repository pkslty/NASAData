//
//  NASAData.swift
//  NasaPOD
//
//  Created by Denis Kuzmin on 11.03.2021.
//

import Foundation

class NasaData: Decodable {
    var date: String?
    var explanation: String?
    var hdurl: URL?
    var title: String?
    var url: URL?
    
    init() {
        self.date = nil
        self.explanation = nil
        self.hdurl = nil
        self.title = nil
        self.url = nil
    }
}
