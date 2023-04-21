//
//  NViewController.swift
//  Seminar_2_assignment
//
//  Created by 홍유정 on 2023/04/21.
//

import UIKit
import SnapKit

class NViewController: UIViewController {
    
    private let NicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "닉네임을 입력해주세요"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .black
        return label
    }()
    
    private let NicknameTextField: UITextField = {
        let textField = UITextField()
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .gray
        textField.layer.cornerRadius = 8.0
        return textField
    }()
    
    private lazy var NSaveButton: UIButton = {
        let button = UIButton()
        button.setTitle("저장하기", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(dismissNViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

private extension NViewController {
    
    func setStyle() {
        view.backgroundColor = .white
    }
    
    func setLayout(){
        
        [NicknameLabel, NicknameTextField, NSaveButton].forEach {
            view.addSubview($0)
        }
        
        NicknameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalToSuperview().offset(30)
        }
        NicknameTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(NicknameLabel.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        NSaveButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func dismissNViewController() {
        let firstViewController = FirstViewController()
        present(firstViewController, animated: true)
    }
}
