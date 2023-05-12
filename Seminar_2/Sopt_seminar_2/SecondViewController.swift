//
//  SecondViewController.swift
//  Sopt_seminar_2
//
//  Created by 홍유정 on 2023/04/08.
//

import UIKit
import SnapKit
import Then

protocol DataBindProtocol: AnyObject {
    func dataBind(text: String)
}

class SecondViewController: UIViewController {
    var j: Int = 0
    
    private lazy var pushButton = UIButton().then {
        $0.setTitle("눌러줘", for: .normal)
        $0.backgroundColor = .purple
        $0.addTarget(self, action: #selector(counter), for: .touchUpInside)
        
    }
    
    private lazy var backButton = UIButton().then {
        $0.setTitle("이전으로", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .purple
        $0.addTarget(self, action: #selector(pushToFirstViewController), for: .touchUpInside)
    }
    
    weak var delegate: DataBindProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        style()
        setLayout()
    
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}

private extension SecondViewController {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        view.addSubview(pushButton)
        pushButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            
        }
        
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.top.equalTo(pushButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
    }
    
    @objc //?
    func pushToFirstViewController() {
        dismiss(animated: true)
    }
    
    @objc
    func counter() {
        delegate?.dataBind(text: "")
    }
    
    @objc
        func popSecondViewController() {
            
//            if let text =  {
//                delegate?.dataBind(text: text)
//            }
          
            self.navigationController?.popViewController(animated: true)
        }
    
    
}
