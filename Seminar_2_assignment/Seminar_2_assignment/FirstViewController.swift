//
//  ViewController.swift
//  Seminar_2_assignment
//
//  Created by 홍유정 on 2023/04/15.
//

import UIKit
import SnapKit

final class FirstViewController: UIViewController, UITextFieldDelegate {
    
    private let BackButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_before"), for: .normal)
        return button
    }()
    
    private let LoginLabel: UILabel = {
        let label = UILabel()
        label.text = "TIVING ID 로그인"
        label.font = .systemFont(ofSize: 23)
        label.textColor = UIColor(hexCode: "D6D6D6")
        return label
    }()
    
    private let IDTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "아이디", attributes: [.foregroundColor: UIColor(hexCode: "9C9C9C")])
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = UIColor(hexCode: "626262")
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()
    
    private let PWTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "비밀번호", attributes: [.foregroundColor: UIColor(hexCode: "9C9C9C")])
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = UIColor(hexCode: "626262")
        textField.layer.cornerRadius = 8.0
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var LoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그인하기", for: .normal)
        button.setTitleColor(UIColor(hexCode: "9C9C9C"), for: .highlighted)
        button.layer.cornerRadius = 8.0
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 1.0
        button.addTarget(self, action: #selector(pushToSecondViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var FIDButton: UIButton = {
        let button = UIButton()
        button.setTitle("아이디 찾기", for: .normal)
        button.setTitleColor(UIColor(hexCode: "9C9C9C"), for: .normal)
        return button
    }()
    
    private lazy var FPWButton: UIButton = {
        let button = UIButton()
        button.setTitle("비밀번호 찾기", for: .normal)
        button.setTitleColor(UIColor(hexCode: "9C9C9C"), for: .normal)
        return button
    }()
    
    private let NoIDLabel: UILabel = {
        let label = UILabel()
        label.text = "아직 계정이 없으신가요?"
        label.font = .systemFont(ofSize: 15)
        label.textColor = UIColor(hexCode: "626262")
        return label
    }()
    
    private lazy var MNButton: UIButton = {
        let button = UIButton()
        button.setTitle("닉네임 만들러가기", for: .normal)
        button.setTitleColor(UIColor(hexCode: "9C9C9C"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15)
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
        
        [BackButton, LoginLabel,IDTextField, PWTextField, LoginButton, NoIDLabel, FIDButton, FPWButton, MNButton].forEach {
            view.addSubview($0)
        }
        
        BackButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(65)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(8)
            $0.height.equalTo(15)
        }

        
        LoginLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(90)
        }
        IDTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(LoginLabel.snp.bottom).offset(31)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        PWTextField.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(IDTextField.snp.bottom).offset(7)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        LoginButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(PWTextField.snp.bottom).offset(21)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        
        FIDButton.snp.makeConstraints{
            $0.top.equalTo(LoginButton.snp.bottom).offset(31)
            $0.leading.equalToSuperview().inset(85)
            $0.trailing.equalTo(view.snp.centerX)
            $0.height.equalTo(22)
        }
        FPWButton.snp.makeConstraints{
            $0.top.equalTo(LoginButton.snp.bottom).offset(31)
            $0.leading.equalTo(view.snp.centerX)
            $0.trailing.equalToSuperview().inset(85)
            $0.height.equalTo(22)
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

extension UIColor {
    
    convenience init(hexCode: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexCode.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        assert(hexFormatted.count == 6, "Invalid hex code used.")
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
