//
//  Character.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//
//  Goal: This struct is a the Model that describe the characters properties

import Foundation

struct Character:Decodable {
    var _id:Int
    var _picture:String
    var _name:String
    var _actor:String
    var _bio:String
    var _isMain:Bool
    var _season:Int
}
