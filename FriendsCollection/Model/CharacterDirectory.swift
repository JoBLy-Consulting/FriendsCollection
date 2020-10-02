//
//  CharacterDirectory.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//
//  Goal: This class will manage the charcater directory and the new characters

import Foundation
import Combine

class CharacterDirectory: ObservableObject {
    @Published private var _charactersList:[Character]
    @Published private var _maxId:Int
    
    var objectWillChange = PassthroughSubject<Void,Never>()
    
    public init() {
        _charactersList = DataConnector.loadCharacters()
        _maxId = 8
    }
    
    public func getCharacters() -> [Character]{
        return _charactersList
    }
    
    public func getMaxId() -> Int {
        return _maxId
    }
    
    public func addCharacter(newCharacter:Character) {
        _charactersList.append(newCharacter)
        _maxId = _maxId + 1
        objectWillChange.send()
    }
}
