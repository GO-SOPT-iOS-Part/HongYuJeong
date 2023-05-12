//
//  TDMBViewController.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/05/12.
//

import UIKit

class TDMBViewController: BaseViewController {
    
    
    private let tableView = UITableView()
    private var index = 0
    
    private var resultArray: [ResultDataModel] = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    //private let dummy = TDMB.dummy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        requestMovie()
    }
    
    override func setStyle() {
        
        view.backgroundColor = .white
        
        tableView.do {
            $0.register(TDMBTableViewCell.self, forCellReuseIdentifier: TDMBTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func setLayout() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
    
    private func requestMovie() {
        TDMBService.shared.getMovie { response in
            switch response {
            case .success(let data):
                print("success")
                guard let data = data as? TDMBResponse else { return }
                self.resultArray.append(.init(originalTitle: data.results[self.index].originalTitle, overview: data.results[self.index].overview, popularity: data.results[self.index].popularity, releaseDate: data.results[self.index].releaseDate, posterPath: data.results[self.index].posterPath))
                self.index += 1
                if self.index < data.results.count {
                    self.requestMovie()
                }
                
            default:
                print("default")
                return
            }
        }
    }
}

extension TDMBViewController: UITableViewDelegate {}

extension TDMBViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TDMBTableViewCell.identifier, for: indexPath) as? TDMBTableViewCell else { return UITableViewCell() }
        
        cell.configureCell(resultArray[indexPath.row])
        
        return cell
    }
}
