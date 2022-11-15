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
    private var config : Welcome?
    private var response : String = ""
    private let workDayArray = ["M","T","W","F"]
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let repo = DefaultPetListRepository()
        self.config = repo.readJSONFromFile(fileName: "config", type: Welcome.self)!
        response = (config?.settings.workHours)!
        self.checkWorkingHours(workHours: response)
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
    
    private func displayData(){
        let viewModel = self.viewModel ?? PetListViewModel()
        self.viewModel = viewModel
        registerXib()
        self.bindViewModel()
    }
    
private func checkWorkingHours(workHours : String){
        let response = workHours
        let pattern = "^[A-Z]-[A-Z]\\s{1}(\\d{1,2}:\\d{2})\\s{1}-\\s{1}(\\d{1,2}:\\d{2})$"
        let regex = try! NSRegularExpression(pattern: pattern)
        if let match = regex.matches(in: response, range: .init(response.startIndex..., in: response)).first,match.numberOfRanges == 3 {
            let start = match.range(at: 1)
            print(response[Range(start, in: response)!])
            let end = match.range(at: 2)
            print(response[Range(end, in: response)!])
            let startTime = String(response[Range(start, in: response)!])
            let endTime = String(response[Range(end, in: response)!])
            let numbers = response.components(separatedBy: ["-"," "])
            let isAvailable = workDayArray.contains(where: { $0 == numbers[0] || $0 == numbers[1] })
            if self.checkIfCurrentTimeIsBetween(startTime: startTime, endTime: endTime) && isAvailable{
                self.displayData()
            } else {
                self.alert()
            }
        }
    }
    
    private func alert(){
        presentAlertWithTitle(title: "Test", message: "Your working hours is over please try later", options: "Retry") { (option) in
            print("option: \(option)")
            switch(option) {
                case 0:
                    self.checkWorkingHours(workHours: self.response)
                    break
                default:
                    break
            }
        }
    }
    
    func checkIfCurrentTimeIsBetween(startTime: String, endTime: String) -> Bool {
        guard let start = Formatter.today.date(from: startTime),
              let end = Formatter.today.date(from: endTime) else {
            return false
        }
        return DateInterval(start: start, end: end).contains(Date())
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.petTblView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "PetDetailVC") as? PetDetailVC
        vc?.list = self.pets[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}

extension Formatter {
    static let today: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = .init(identifier: "en_US_POSIX")
        dateFormatter.defaultDate = Calendar.current.startOfDay(for: Date())
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
        
    }()
}
