//
//  Groups.swift
//  Client VK
//
//

import UIKit

struct Group: Equatable {
    let groupName: String
    let groupLogo: UIImage?
    
    // для проведения сравнения (.contains), только по имени
    static func ==(lhs: Group, rhs: Group) -> Bool {
        return lhs.groupName == rhs.groupName //&& lhs.groupLogo == rhs.groupLogo
    }
}
