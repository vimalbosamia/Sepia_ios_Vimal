//
//  PetListUseCases.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import Foundation

protocol PetListUseCases{
    func getPetListData() -> PetModel
}

final class petListUseCases : PetListUseCases{
    
    private let petListRepository: PetListRepository
    
    init(petListRepository: PetListRepository? = nil) {
        self.petListRepository = petListRepository ?? DefaultPetListRepository()
    }
    
    func getPetListData() -> PetModel {
       return self.petListRepository.getPetList()
    }
}
