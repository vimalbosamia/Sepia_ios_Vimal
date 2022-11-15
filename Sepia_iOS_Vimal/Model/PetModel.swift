//
//  PetModel.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import Foundation

struct PetModel : Codable {

    let pets : [Pet]?

    enum CodingKeys: String, CodingKey {
        case pets = "pets"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pets = try values.decodeIfPresent([Pet].self, forKey: .pets)
    }
}

struct Pet : Codable {

    let contentUrl : String?
    let dateAdded : String?
    let imageUrl : String?
    let title : String?

    enum CodingKeys: String, CodingKey {
        case contentUrl = "content_url"
        case dateAdded = "date_added"
        case imageUrl = "image_url"
        case title = "title"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        contentUrl = try values.decodeIfPresent(String.self, forKey: .contentUrl)
        dateAdded = try values.decodeIfPresent(String.self, forKey: .dateAdded)
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
}


struct Welcome: Codable {
    let settings: Settings
}

// MARK: - Settings
struct Settings: Codable {
    let workHours: String
}

//struct RootClass : Codable {
//
//    let settings : Setting?
//
//    enum CodingKeys: String, CodingKey {
//        case settings
//    }
//    init(from decoder: Decoder) throws {
//        _ = try decoder.container(keyedBy: CodingKeys.self)
//        settings = try Setting(from: decoder)
//    }
//}
//
//struct Setting : Codable {
//
//    let workHours : String?
//
//    enum CodingKeys: String, CodingKey {
//        case workHours = "workHours"
//    }
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//        workHours = try values.decodeIfPresent(String.self, forKey: .workHours)
//    }
//}
