//
//  CharacterPresenter.swift
//  FriendsCollection
//
//  Created by Johan Guenaoui on 01/10/2020.
//
//  Goal: This view is a View Model to present the characters cards in the list. The main characters are on a red background with a star and the special guest are in a blue background with a "i" in a circle

import SwiftUI

enum StatusIcon:String {
    case main = "star.circle.fill"
    case guest = "info.circle.fill"
}

struct CharacterPresenter: View {
    private var _content:Character
    private var _status:StatusIcon
    private var _color:Color
    
    init(content:Character) {
        _content = content
        if _content._isMain {
            _status = .main
            _color = Color.red
        } else {
            _status = .guest
            _color = Color.blue
        }
    }
    
    var body: some View {
        HStack {
            VStack {
                Image(_content._picture)
                    .resizable()
                    .frame(width:60.0, height:60.0, alignment:.center)
                    .clipShape(Circle())
                Spacer()
                Image(systemName: _status.rawValue)
                    .frame(width: 60.0,
                           height:80.0,
                           alignment:.center)
                    .font(.system(size:32))
            }
            
            VStack {
                Text("\(_content._name) (\(_content._actor))")
                    .font(.system(.headline))
                Text(_content._bio)
                    .font(.system(size:14))
                    .truncationMode(.head)
            }
        }
        .padding(.all, 10)
        .frame(height: 150)
        .background(_color)
    }
}
