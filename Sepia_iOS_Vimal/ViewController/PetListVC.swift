//
//  PetListVC.swift
//  Sepia_iOS_Vimal
//
//  Created by Vimal on 15/11/22.
//

import UIKit

class PetListVC: UIViewController {

    @IBOutlet weak var petTblView: UITableView!
    
    init(viewModel: PetListViewModelDelegate) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private var viewModel : PetListViewModelDelegate?
    private var pets = [Pet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
