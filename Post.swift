//
//  Post.swift
//  Infoeduka
//
//  Created by Tomislav Zvonarek on 22.06.2023..
//

import Foundation

struct Post: Identifiable, Equatable {
    var id = UUID()
    var course: Course
    var title: String
    var content: String
    var author: User
    var timestamp = Date()
    var imageURL: URL?
    var isFavorite = false
    
    func contains(_ string: String) -> Bool {
        let properties = [course.title, title, content, author.name, timestamp.formatted()].map { $0.lowercased() }
        let query = string.lowercased()
        let matches = properties.filter { $0.contains(query) }
        return !matches.isEmpty
    }
}

extension Post: Codable {
    enum CodingKeys: CodingKey {
        case title, content, author, timestamp, course, id
    }
}

extension Post {
    static let testPost = Post(
        course: Course.testCourse,
        title: "Lorem ipsum",
        content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        author: User.testUser
    )
}
