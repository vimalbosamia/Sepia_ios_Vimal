//
//  PetListViewModel.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import Foundation

protocol PetListViewModelDelegate {
    func getPets() -> PetModel
}

class PetListViewModel {
   
    init(useCases: PetListUseCases? = nil) {
        self.petListUseCase = useCases ?? petListUseCases()
    }
   
    private let petListUseCase: PetListUseCases
}

extension PetListViewModel : PetListViewModelDelegate{
    func getPets() -> PetModel{
        return self.petListUseCase.getPetListData()
    }
}
