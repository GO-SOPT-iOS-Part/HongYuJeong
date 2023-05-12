//
//  MainViewController.swift
//  Seminar_2_assignment
//
//  Created by 홍유정 on 2023/05/05.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    private lazy var MyPageButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "doosan"), for: .normal)
        button.addTarget(self, action: #selector(pushToMypageViewController), for: .touchUpInside)
        return button
    }()
    
    private lazy var MainContentButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "image 19"), for: .normal)
        return button
    }()
    
    private let RecommendLabel: UILabel = {
        let label = UILabel()
        label.text = "티빙에서 꼭 봐야하는 콘텐츠"
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        return label
    }()
    
    private lazy var RContent_1: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "image 20"), for: .normal)
        return button
    }()
    private lazy var RContent_2: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "image 21"), for: .normal)
        return button
    }()

    private lazy var RContent_3: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "image 22"), for: .normal)
        return button
    }()
    
    private lazy var MoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("전체보기", for: .normal)
        button.setTitleColor(UIColor(hexCode: "9C9C9C"), for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
        setLayout()
    }
}

private extension MainViewController{
    func setStyle() {
        view.backgroundColor = .black
    }
    
    func setLayout(){
        [MainContentButton, MyPageButton, RecommendLabel, RContent_1, RContent_2, RContent_3, MoreButton].forEach {
            view.addSubview($0)
        }
        
        MyPageButton.snp.makeConstraints{
            $0.top.equalToSuperview().offset(40)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(50)
        }
        
        MainContentButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(600)
        }
        
        RecommendLabel.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalTo(MainContentButton.snp.bottom).offset(15)
            $0.height.equalTo(20)
        }
        
        MoreButton.snp.makeConstraints{
            $0.bottom.equalTo(RecommendLabel.snp.bottom)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        RContent_1.snp.makeConstraints{
            $0.top.equalTo(RecommendLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(8)
            $0.width.equalTo(98)
            $0.height.equalTo(146)
        }
        RContent_2.snp.makeConstraints{
            $0.top.equalTo(RecommendLabel.snp.bottom).offset(15)
            $0.width.equalTo(98)
            $0.height.equalTo(146)
            $0.leading.equalTo(RContent_1.snp.trailing).inset(8)
        }
        RContent_3.snp.makeConstraints{
            $0.top.equalTo(RecommendLabel.snp.bottom).offset(15)
            $0.width.equalTo(98)
            $0.height.equalTo(146)
            $0.leading.equalTo(RContent_2.snp.trailing).inset(8)
        }
        
    }
    
    @objc
    func pushToMypageViewController() {
        print("touched")
        let mypageViewController = MypageViewController()
        self.navigationController?.pushViewController(mypageViewController, animated: true)
        }

}
