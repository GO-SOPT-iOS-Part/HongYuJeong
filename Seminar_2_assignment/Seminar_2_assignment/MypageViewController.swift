//
//  MypageViewController.swift
//  Seminar_2_assignment
//
//  Created by 홍유정 on 2023/05/05.
//

import UIKit
import SnapKit

class MypageViewController: UIViewController {
    
    private let tableView = UITableView()
    
    private let BackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_before"), for: .normal)
        return button
    }()
    
    private lazy var ProfileImageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "doosan"), for: .normal)
        button.layer.cornerRadius = 8.0
        return button
    }()
    
    private lazy var ProfileChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 전환", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        return button
    }()
    
    private let IDLabel: UILabel = {
        let label = UILabel()
        label.text = "id"
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}



private extension MypageViewController{
    func setStyle() {
        view.backgroundColor = .black
        
        
    }
    
    func setLayout(){
        [BackButton, ProfileImageButton, ProfileChangeButton, IDLabel].forEach {
            view.addSubview($0)
        }
        
        BackButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }
        
        ProfileImageButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.leading.equalToSuperview().offset(24)
            $0.width.height.equalTo(75)
        }
        
        IDLabel.snp.makeConstraints {
            $0.centerY.equalTo(ProfileImageButton.snp.centerY)
            $0.leading.equalTo(ProfileImageButton.snp.trailing).offset(20)
        }
        
        ProfileChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(ProfileImageButton.snp.centerY)
            $0.width.equalTo(70)
            $0.height.equalTo(25)
            $0.trailing.equalToSuperview().offset(24)
        }
    }
}
