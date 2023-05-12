//
//  WeatherViewController.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/05/06.
//

import UIKit

class WeatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        requestWeather()
        print("WeatherViewController")
        // Do any additional setup after loading the view.
    }
    
    private func requestWeather() {
        WeatherService.shared.getWeather { response in
            switch response {
            case .success(let data):
                print("success")
                guard let data = data as? WeatherResponse else { return }
                dump(data)
            default:
                print("default")
                return
            }
        }
    }
    

}
