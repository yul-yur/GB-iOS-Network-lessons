//
//  Session.swift
//  Client VK
//
//

import Foundation

class Session {
    private init() {}
    static let instance = Session()
    
    var token = "" // хранение токена в VK
    var userId = 0 // хранение идентификатора пользователя VK
}
