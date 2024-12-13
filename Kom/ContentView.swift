//
//  ContentView.swift
//  Kom
//
//  Created by Александр Уфимцев on 13/12/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authViewModel: AuthViewModel

    init(authViewModel: AuthViewModel) {
        _authViewModel = StateObject(wrappedValue: authViewModel)
    }

    @State private var showSignUp = false

    var body: some View {
        NavigationStack {
            LoginView(authViewModel: authViewModel, showSignUp: $showSignUp)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authViewModel: AuthViewModel(managedObjectContext: PersistenceController.preview.container.viewContext))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



