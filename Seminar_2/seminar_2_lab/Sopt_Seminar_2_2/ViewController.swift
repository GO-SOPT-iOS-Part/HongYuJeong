//
//  ViewController.swift
//  Sopt_Seminar_2_2
//
//  Created by 홍유정 on 2023/04/15.
//

import UIKit
import SnapKit


class ViewController: UIViewController {
        
    private let rectView_1 : UIView = {
       let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private let rectView_2 : UIView = {
       let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private let rectView_3 : UIView = {
       let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    private let rectView_4 : UIView = {
       let view = UIView()
        view.backgroundColor = .blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setLayout()
    }
    
}

private extension ViewController{
    func style() {
        view.backgroundColor = .white
    }
    
    func setLayout(){
        [rectView_1, rectView_2, rectView_3, rectView_4].forEach {
            view.addSubview($0)
        }
        
        rectView_1.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(UIScreen.main.bounds.width / 2)
            $0.top.leading.equalToSuperview()
            $0.bottom.equalTo(rectView_2.snp.top)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        rectView_2.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(UIScreen.main.bounds.width / 2)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
        rectView_3.snp.makeConstraints{
            $0.trailing.equalToSuperview().inset(UIScreen.main.bounds.width / 2)
            $0.top.equalTo(rectView_2.snp.bottom)
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
            $0.leading.equalToSuperview()
        }
        rectView_4.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(UIScreen.main.bounds.width / 2)
            $0.top.equalTo(rectView_3.snp.bottom)
            $0.bottom.trailing.equalToSuperview()
            $0.height.equalTo(UIScreen.main.bounds.height / 4)
        }
    }
}


