//
//  ViewController.swift
//  Weather
//
//  Created by Abhinay Pratap on 06/07/22.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var weatherManager = WeatherManager()

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        if let city = searchTextField.text {
            print(searchTextField.text!)
            cityLabel.text = city
            searchTextField.endEditing(true)
        }
    }
    
}

// MARK: - UITextFieldDelegate
extension WeatherViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(searchTextField.text!)
        textField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            textField.placeholder = "City"
            return true
        } else {
            textField.placeholder = "Type the City Name"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        textField.text = ""
    }
}
