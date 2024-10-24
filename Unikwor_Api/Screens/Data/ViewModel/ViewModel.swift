//
//  ViewModel.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 23/10/24.
//

import Foundation


class ViewModel {
    
    var data: [Data] = []
    
    func fetchData(completion: @escaping (Result<Bool, Error>) -> Void) {
        Task {
            do {
                let response = try await ApiManager.shared.request(modelType: [Data].self, type: EndPointItems.data)
                self.data = response
                completion(.success(true))
            } catch {
                print("Error: \(error.localizedDescription)")
                completion(.failure(error))
            }
        }
    }
}
