//
//  BackgroundColor.swift
//  TodoApp
//
//  Created by Esteban SEMELLIER on 29/04/2023.
//

import SwiftUI

import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        LinearGradient(colors: [Color("Todo blue"), Color("BgColor")], startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

