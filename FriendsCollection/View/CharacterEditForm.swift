//
//  CharacterEditForm.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 02/10/2020.
//
//  Goal: This view is the edit form to enter new characters in the list.

import SwiftUI

struct CharacterEditForm: View {
    @State private var _characterName:String = ""
    @State private var _characterActor:String = ""
    @State private var _characterBio:String = ""
    @State private var _characterIsMain:Bool = false
    @State private var _characterSeason:Int = 1
    @Environment(\.presentationMode) var _presentationMode
    var _characterDirectory:CharacterDirectory
    
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Identity")) {
                    HStack {
                        Text("Name:")
                        TextField("Complete name", text:$_characterName)
                    }
                    HStack {
                        Text("Actor:")
                        TextField("Complete name", text:$_characterActor)
                    }
                    VStack(alignment: .leading) {
                        Text("Description:")
                        TextEditor(text:$_characterBio)
                    }
                    Toggle(isOn: $_characterIsMain, label: {
                        Text("Main character")
                    })
                }
                if !_characterIsMain {
                    Section(header:Text("Season")){
                        Picker(selection: $_characterSeason, label: Text("Season")){
                            Text("1").tag(1)
                            Text("2").tag(2)
                            Text("3").tag(3)
                            Text("4").tag(4)
                            Text("5").tag(5)
                            Text("6").tag(6)
                            Text("7").tag(7)
                            Text("8").tag(8)
                            Text("9").tag(9)
                            Text("10").tag(10)
                        }
                    }
                }
                Button(action: {
                    self._characterDirectory.addCharacter(newCharacter: Character(_id:_characterDirectory.getMaxId(),_picture:"",_name:_characterName,_actor:_characterActor,_bio:_characterBio,_isMain:_characterIsMain,_season:_characterSeason))
                        self._presentationMode.wrappedValue.dismiss()
                }){
                    Text("Add")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                
            }
            .navigationBarTitle("Add a character")
        }
    }
}
