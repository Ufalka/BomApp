//
//  HomeView.swift
//  Kom
//
//  Created by Александр Уфимцев on 13/12/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Добро пожаловать на главный экран!")
                .font(.largeTitle)
                .padding()
        }
        .navigationBarTitle("Главная", displayMode: .inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

