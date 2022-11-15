//
//  DefaultPetListRepository.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import Foundation

class DefaultPetListRepository : PetListRepository{
    func getPetList() -> PetModel {
        return readJSONFromFile(fileName: "pets_list", type: PetModel.self)!
    }
}

extension DefaultPetListRepository{
    
    func readJSONFromFile<T: Decodable>(fileName: String, type: T.Type) -> T? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(T.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
