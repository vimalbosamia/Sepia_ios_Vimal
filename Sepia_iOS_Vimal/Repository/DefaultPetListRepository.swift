//
//  DefaultPetListRepository.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import Foundation

class DefaultPetListRepository : PetListRepository{
    func getPetList() -> PetModel {
        let jsonData = readLocalJSONFile(forName: "pets_list")!
        return parse(jsonData: jsonData)!
    }
}

extension DefaultPetListRepository{
    func readLocalJSONFile(forName name: String) -> Data? {
        do {
            if let filePath = Bundle.main.path(forResource: name, ofType: "json") {
                let fileUrl = URL(fileURLWithPath: filePath)
                let data = try Data(contentsOf: fileUrl)
                return data
            }
        } catch {
            print("error: \(error)")
        }
        return nil
    }

    func parse(jsonData: Data) -> PetModel? {
        do {
            let decodedData = try JSONDecoder().decode(PetModel.self, from: jsonData)
            return decodedData
        } catch {
            print("error: \(error)")
        }
        return nil
    }
}
