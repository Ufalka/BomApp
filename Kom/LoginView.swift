//
//  LoginView.swift
//  Kom
//
//  Created by Александр Уфимцев on 13/12/2024.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @Binding var showSignUp: Bool

    var body: some View {
        VStack {
            Spacer()

            Text("Welcome to Bom!")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.black)
                .padding(.bottom, 30)

            TextField("Введите логин", text: $authViewModel.username)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal, 30)
                .foregroundColor(.black)
                .padding(.bottom, 20)
                .shadow(radius: 5)

            SecureField("Введите пароль", text: $authViewModel.password)
                .padding()
                .background(Color.white.opacity(0.8))
                .cornerRadius(10)
                .padding(.horizontal, 30)
                .foregroundColor(.black)
                .padding(.bottom, 30)
                .shadow(radius: 5)

            Button(action: {
                authViewModel.logIn()
            }) {
                Text("Войти")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
                    .shadow(radius: 10)
                    .padding(.bottom, 20)
            }

            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding(.bottom, 20)
            }

            Button(action: {
                showSignUp.toggle()
            }) {
                Text("Создать учетную запись")
                    .font(.subheadline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .padding(.horizontal, 30)
            }

            Spacer()
        }
        .sheet(isPresented: $showSignUp) {
            SignUpView(authViewModel: authViewModel, isPresented: $showSignUp)
        }
        .navigationDestination(isPresented: $authViewModel.isLoggedIn) {
            HomeView()
        }
    }
}




