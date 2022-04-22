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
    var userImage: UIImage
    var itemArray:[Items]
    var groupArray:[Groups]
    init(u: String, p: String, i: UIImage) {
        username = u
        password = p
        userImage = i
        itemArray = [Items]()
        groupArray = [Groups]()
    }
    
}
public class Groups: Codable{
    var groupName: String
    var users = [User]()
    func add() {
        users.append(User(u: "default", p: "default", i: UIImage(named: "defaultUser")!))
    }
    var groupImage: UIImage
    init(gn: String, gi: UIImage){
        groupName = gn
        groupImage = gi
    }
}
