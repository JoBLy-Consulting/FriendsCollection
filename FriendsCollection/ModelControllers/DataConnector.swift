//
//  DataConnector.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//
//  Goal: This class is a Model Controller to connect and import the initial characters (JSON file)

import Foundation

class DataConnector {
    public static func loadCharacters() -> [Character] {
        var result:[Character] = []
        if let url = Bundle.main.url(forResource: "FriendsCharacters.json", withExtension: nil){
            if let data = try? Data(contentsOf: url){
                let jsondecoder = JSONDecoder()
                do {
                    result = try jsondecoder.decode([Character].self, from: data)
                } catch {
                    print("error trying parse json")
                }
            }
        }
        return result
    }
}
