//
//  SecondViewController.swift
//  Seminar_2_assignment
//
//  Created by 홍유정 on 2023/04/21.
//

import UIKit
import SnapKit


class SecondViewController: UIViewController {
    
    var id: String?
    
    private let Logo: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "logo"), for: .normal)
        return button
    }()

    private let GreetingLabel: UILabel = {
        let label = UILabel()
        label.text = "반가워요!"
        label.font = .systemFont(ofSize: 23)
        label.textColor = .white
        return label
    }()
    
    private lazy var MainButton: UIButton = {
        let button = UIButton()
        button.setTitle("메인으로", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hexCode: "FF143C")
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(pushToFirstViewController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
        dataBind()
    }
    
    func dataBind() {
        GreetingLabel.text = "\(id!)님 반가워요!"
    }
}


private extension SecondViewController{
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setLayout(){
        [Logo, GreetingLabel, MainButton].forEach {
            view.addSubview($0)
        }
        
        Logo.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(58)
            $0.height.equalTo(210)
            $0.leading.trailing.equalToSuperview()
        }
        
        GreetingLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            //$0.leading.trailing.equalToSuperview().inset(20)

        }
        MainButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func pushToFirstViewController() {
        let firstViewController = FirstViewController()
        present(firstViewController, animated: true)
    }
}
