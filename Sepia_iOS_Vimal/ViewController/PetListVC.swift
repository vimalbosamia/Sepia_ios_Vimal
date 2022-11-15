//
//  PetListVC.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import UIKit

class PetListVC: UIViewController {

    @IBOutlet weak var petTblView: UITableView!
    
    private var viewModel : PetListViewModelDelegate?
    private var pets = [Pet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewModel = self.viewModel ?? PetListViewModel()
        self.viewModel = viewModel
        registerXib()
        self.bindViewModel()
        // Do any additional setup after loading the view.
    }

    private func registerXib() {
        let nibName = UINib(nibName: PetListTableViewCell.identifier, bundle: nil)
        petTblView.register(nibName, forCellReuseIdentifier: PetListTableViewCell.identifier)
        petTblView.rowHeight = 109
    }
    
    private func bindViewModel() {
       self.viewModel?.getPets().pets.flatMap({ petsData in
           self.pets = petsData
        })
        print(self.pets)
        self.petTblView.reloadData()
    }
}
extension PetListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PetListTableViewCell.identifier,for: indexPath) as? PetListTableViewCell
        cell?.setupView(model: self.pets[indexPath.row])
        return cell!
    }
}
