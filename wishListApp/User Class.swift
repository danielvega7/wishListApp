//
//  User Class.swift
//  wishListApp
//
//  Created by Daniel Vega on 1/7/22.
//

import Foundation
import UIKit
import SwiftUI
public class StaticClass: Codable{
    static var groupArray = [Groups]()
    static var indexOf = 0
    static var userArray = [User]()
    static var userArrayData = [Data]()
    static var currentUser = User(u: "default", p: "default", i: "defaultUser")
    static var imagePicker = UIImagePickerController()
    static var alertController = UIAlertController()
    
}

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
    init(u: String, p: String, i: String, ia: [Items], ga: [Groups]) {
        username = u
        password = p
        userImageString = i
        itemArray = ia
        groupArray = ga
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
public class ConvertedGroups{
    var group: Groups
    var dataFromGroup = Data()
    var users = [User]()
    
    var groupImage: UIImage
    init(g: Groups, i: UIImage){
        group = g
        groupImage = i
    }
    
    func convert() {
        //dataFromGroup = group.groupImage
    }
}

