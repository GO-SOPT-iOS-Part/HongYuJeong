//
//  ViewController.swift
//  Seminar_2_assignment
//
//  Created by 홍유정 on 2023/04/15.
//

import UIKit
import SnapKit

final class FirstViewController: UIViewController, UITextFieldDelegate {
    
    private let LoginLabel: UILabel = {
        let label = UILabel()
        label.text = "TIVING ID 로그인"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    private let IDTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "아이디"
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .gray
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    private let PWTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .gray
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var LoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(.white, for: .highlighted)
        button.layer.cornerRadius = 8.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(pushToSecondViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var FIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        return button
    }()
    
    private lazy var FPWButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        return button
    }()
    
    private let NoIDLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    private lazy var MNButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.font = .systemFont(ofSize: 15)
        button.addTarget(self, action: #selector(pushToNViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        IDTextField.delegate = self
        PWTextField.delegate = self
        
        setStyle()
        setLayout()
        
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.white.cgColor
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.isFirstResponder {
                textField.layer.borderColor = UIColor.blue.cgColor
            } else {
                textField.layer.borderColor = UIColor.gray.cgColor
            }
    }
}

private extension FirstViewController {
    
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setLayout(){
        
        [LoginLabel,IDTextField, PWTextField, LoginButton, NoIDLabel, FIDButton, FPWButton, MNButton].forEach {
            view.addSubview($0)
        }

        
        LoginLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(150)
        }
        IDTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(LoginLabel.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        PWTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(IDTextField.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        LoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(PWTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        
        FIDButton.snp.makeConstraints{
            $0.top.equalTo(LoginButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(view.snp.centerX)
            $0.height.equalTo(50)
        }
        FPWButton.snp.makeConstraints{
            $0.top.equalTo(LoginButton.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.centerX)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
        NoIDLabel.snp.makeConstraints {
            $0.top.equalTo(FIDButton.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
            $0.trailing.equalTo(view.snp.centerX)
            $0.height.equalTo(50)
        }
        MNButton.snp.makeConstraints{
            $0.top.equalTo(FPWButton.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.centerX)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
        
    }
    
    @objc
    func pushToNViewController() {
        let nViewController = NViewController()
//        nViewController.delegate = self
        present(nViewController, animated: true)
    }
    
    /*@objc
    func pushToSecondViewController() {
        let secondViewController = SecondViewController()
        present(secondViewController, animated: true)
    }*/
    
    
    @objc
    func pushToSecondViewController() {
        let secondViewController = SecondViewController()
        guard let id = IDTextField.text else { return }
        secondViewController.id = id
        self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    
}
