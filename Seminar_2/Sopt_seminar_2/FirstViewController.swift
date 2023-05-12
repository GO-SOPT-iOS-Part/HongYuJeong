//
//  ViewController.swift
//  Sopt_seminar_2
//
//  Created by 홍유정 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

class ViewController: UIViewController {
    
    var i: Int = 0
    
    private let countLabel = UILabel().then {
        $0.text = "횟수 : "
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = .white
        $0.backgroundColor = .black
    }
    
    private lazy var countButton = UIButton().then {
        $0.setTitle("다음으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .blue
        $0.addTarget(self, action: #selector(pushToSecondViewController), for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        setLayout()
        
    }

}


private extension ViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        view.addSubview(countLabel)
        countLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        
        view.addSubview(countButton)
        countButton.snp.makeConstraints { make in
            make.top.equalTo(countLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc //?
    func pushToSecondViewController() {
        
        let secondViewController = SecondViewController()
        secondViewController.delegate = self
        present(secondViewController, animated: true)
    }
    

    
}

extension ViewController: DataBindProtocol {
    func dataBind(text: String) {
        i += 1
        print(i)
        countLabel.text = "횟수: \(i)"
        if (i>=10) {
            countLabel.text = "10번 이상 누름"
        }
    }
    
    
}
