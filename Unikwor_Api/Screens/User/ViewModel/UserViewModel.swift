//
//  UserViewModel.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 24/10/24.
//

import Foundation

class UserViewModel {
    
    var userData: [Users] = []
    
    func fetchUserData(completion: @escaping (Result<Bool, Error>) -> Void) {
        Task {
            do {
                let userData = try await ApiManager.shared.request(modelType: UserData.self, type: EndPointItems.user)
                self.userData = userData.users
                print(self.userData)
                completion(.success(true))
            } catch {
                completion(.failure(error))
                print("Error Fetching user : \(error)")
            }
        }
    }
}
