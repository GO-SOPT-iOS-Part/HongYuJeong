//
//  ViewController.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/05/06.
//

import UIKit

final class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUp()
    }
    
    private func signUp() {
        SignUpService.shared.signUp(email: "hyj422@gmail.com",
                                    nickname: "yujeong",
                                    password: "Hh85300422!!") { response in
            switch response {
            case .success(let data):
                print("success")
                guard let data = data as? SignUpResponse else { return }
                dump(data)
            default:
                print("default")
                return
            }
        }
    }
}
