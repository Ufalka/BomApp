//
//  SignUpView.swift
//  Kom
//
//  Created by Александр Уфимцев on 13/12/2024.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var authViewModel: AuthViewModel
    @Binding var isPresented: Bool

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()

                Text("Создайте учетную запись")
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

                if let errorMessage = authViewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding(.bottom, 20)
                }

                Button(action: {
                    withAnimation {
                        authViewModel.signUp()
                        if authViewModel.errorMessage == nil {
                            isPresented = false
                        }
                    }
                }) {
                    Text("Зарегистрироваться")
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

                Spacer()
            }
            .padding()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        let previewContext = PersistenceController.preview.container.viewContext
        SignUpView(authViewModel: AuthViewModel(managedObjectContext: previewContext), isPresented: .constant(true))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}



