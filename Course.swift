//
//  Course.swift
//  Infoeduka
//
//  Created by Tomislav Zvonarek on 22.06.2023..
//

import Foundation

struct Course: Identifiable, Equatable, Codable {
    var id = UUID()
    var title: String
    var lecturer: User
    
    func contains(_ string: String) -> Bool {
        let properties = [title, lecturer.name].map { $0.lowercased() }
        let query = string.lowercased()
        
        let matches = properties.filter { $0.contains(query)}
        return !matches.isEmpty
    }
}
extension Course {
    enum CodingKeys: CodingKey {
        case title, lecturer
    }
}
extension Course {
    static let testCourse = Course(title: "PRA", lecturer: User.testUser)
}




