//
//  AuthViewModel.swift
//  Kom
//
//  Created by Александр Уфимцев on 13/12/2024.
//

import Foundation
import Combine
import CoreData

class AuthViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String? = nil
    @Published var isLoggedIn: Bool = false  // Для управления переходом

    private var cancellables = Set<AnyCancellable>()
    
    private let managedObjectContext: NSManagedObjectContext
    
    // Инициализатор с контекстом CoreData
    init(managedObjectContext: NSManagedObjectContext) {
        self.managedObjectContext = managedObjectContext
    }

    // Логика для логина
    func logIn() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@ AND password == %@", username, password)
        
        do {
            let users = try managedObjectContext.fetch(fetchRequest)
            
            if users.first != nil {
                // Если нашли пользователя
                isLoggedIn = true
                errorMessage = nil
            } else {
                // Если пользователь не найден
                errorMessage = "Неправильный логин или пароль"
            }
        } catch {
            errorMessage = "Ошибка при загрузке данных"
        }
    }


    // Логика для регистрации
    func signUp() {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "username == %@", username)
        
        do {
            let existingUsers = try managedObjectContext.fetch(fetchRequest)
            if !existingUsers.isEmpty {
                errorMessage = "Пользователь с таким логином уже существует"
                return
            }
            
            let newUser = User(context: managedObjectContext)
            newUser.username = username
            newUser.password = password
            
            try managedObjectContext.save()
            errorMessage = nil
        } catch {
            errorMessage = "Ошибка при создании учетной записи"
        }
    }

}


