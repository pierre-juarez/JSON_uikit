//
//  UserViewModel.swift
//  JSON_UiKit
//
//  Created by Pierre Juarez U. on 3/07/23.
//

import Foundation

class UserViewModel{
    
    public static var shared = UserViewModel()
    
    @Published var dataModel = UserModel(data: [])
   
    func fetch(completion: @escaping(_ done: Bool) -> Void){
           guard let url = URL(string: "https://reqres.in/api/users") else { return }
           
           URLSession.shared.dataTask(with: url) { data, _, _ in
               
               guard let data = data else { return }
               
               do{
                   let json = try JSONDecoder().decode(UserModel.self, from: data)
                   DispatchQueue.main.async {
                       self.dataModel = json
                       completion(true)
                   }
               }catch let error as NSError{
                   print("Error al obtener información del endpoint,", error.localizedDescription)
               }
               
           }.resume()
           
       }
    
}
