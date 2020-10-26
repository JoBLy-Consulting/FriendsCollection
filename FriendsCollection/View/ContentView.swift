//
//  ContentView.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//
//  Goal: This view is the main application's view. It initializes the list of friends characters and displays the list ats the application's opening

import SwiftUI

struct SideBar: View {
    var body: some View {
        List {
            NavigationLink(destination: MainContent(_season: 0, _mainCharacters: 0).navigationTitle("All Characters")) {
                Label("All Characters", systemImage: "person.3")
            }
            Section(header:Text("Seasons")) {
                ForEach(1...10, id:\.self) {number in
                    NavigationLink(destination: MainContent(_season: number, _mainCharacters: 0).navigationTitle("Season \(number)")) {
                        Label("Season \(number)", systemImage: "tv")
                    }
                }
            }
            Section(header:Text("Type")) {
                NavigationLink(destination: MainContent(_season: -1, _mainCharacters: 1).navigationTitle("Main Characters")) {
                    Label("Main", systemImage: "star.circle.fill")
                }
                NavigationLink(destination: MainContent(_season: -1, _mainCharacters: 2).navigationTitle("Guest")) {
                    Label("Guests", systemImage: "info.circle.fill")
                }
            }
        }
        .listStyle(SidebarListStyle())
    }
}

struct MainContent: View {
    @Environment(\.horizontalSizeClass) var _horizontalSizeClass
    @ObservedObject private var _friendsCollection = CharacterDirectory()
    @State private var _showEditForm:Bool = false
    var _friendsGrid:[GridItem] = [
        GridItem(.adaptive(minimum: 320))
    ]
    let _season:Int
    let _mainCharacters:Int
    
    var body: some View {
        if _horizontalSizeClass == .regular {
            ScrollView {
                GeometryReader { geometry in
                    Image("AllCast-clear")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .offset(y: geometry.frame(in: .global).minY/5)
                        .clipped()
                }
                .frame(height: 250)
                LazyVGrid(columns: _friendsGrid){
                    ForEach(_friendsCollection.getCharacters(), id: \._id) {value in
                        switch _season {
                        case 0: CharacterPresenter(content:value)
                        case -1:
                            if _mainCharacters == 1 && value._isMain {
                                CharacterPresenter(content:value)
                            }
                            if _mainCharacters == 2 && !value._isMain {
                                CharacterPresenter(content:value)
                            }
                        default:
                            if _season == value._season {
                                CharacterPresenter(content:value)
                            }
                        }
                    }
                }.padding(.all, 10)
            }
            .edgesIgnoringSafeArea(.top)
            .navigationBarItems(trailing: Button(action: {
                self._showEditForm = true
            }) {
                Image(systemName: "plus.circle")
            }
            .font(.system(size:32))
            .sheet(isPresented: self.$_showEditForm) {
                CharacterEditForm(_characterDirectory: _friendsCollection)
            })
        } else {
            VStack {
                ScrollView {
                    Image("AllCast")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 250)
                        .padding(/*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                    LazyVGrid(columns: _friendsGrid){
                        ForEach(_friendsCollection.getCharacters(), id: \._id) {value in
                            switch _season {
                            case 0: CharacterPresenter(content:value)
                            case -1:
                                if _mainCharacters == 1 && value._isMain {
                                    CharacterPresenter(content:value)
                                }
                                if _mainCharacters == 2 && !value._isMain {
                                    CharacterPresenter(content:value)
                                }
                            default:
                                if _season == value._season {
                                    CharacterPresenter(content:value)
                                }
                            }
                        }
                    }.padding(.all, 10)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self._showEditForm = true
            }) {
                Image(systemName: "plus.circle")
            }
            .font(.system(size:32))
            .sheet(isPresented: self.$_showEditForm) {
                CharacterEditForm(_characterDirectory: _friendsCollection)
            })
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            SideBar().navigationTitle("Friends Collection")
            MainContent(_season: 0, _mainCharacters: 0).navigationTitle("All Characters")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
