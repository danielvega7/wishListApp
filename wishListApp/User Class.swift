//
//  User Class.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/7/22.
//

import Foundation
import UIKit

public class Items: Codable{
    var name: String
    var link: String
    init(n: String, l: String){
        name = n
        link = l
    }
}
public class User: Codable{
    var username: String
    var password: String
    var userImageString: String
    var itemArray:[Items]
    var groupArray:[Groups]
    init(u: String, p: String, i: String) {
        username = u
        password = p
        userImageString = i
        itemArray = [Items]()
        groupArray = [Groups]()
    }
    
}
public class Groups: Codable{
    var groupName: String
    var users = [User]()
    func add() {
        users.append(User(u: "default", p: "default", i: "defaultUser"))
    }
    var groupImage: String
    init(gn: String, gi: String){
        groupName = gn
        groupImage = gi
    }
}

