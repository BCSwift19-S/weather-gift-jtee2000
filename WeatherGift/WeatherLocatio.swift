//
//  WeatherLocatio.swift
//  WeatherGift
//
//  Created by Jason Tee on 3/20/19.
//  Copyright © 2019 Jason Tee. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemperature = "--"
    var currentDescription = ""
    var currentIcon = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let description = json["daily"]["summary"].string {
                    self.currentDescription = description
                } else {
                    print("Error")
                }
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("Error")
                }
                if let temperature = json["currently"]["temperature"].double {
                    print("**** TEmp inside get weather")
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemperature = roundedTemp + "°"
                } else {
                    print("Could not return a temperature")
                }
            case .failure(let error):
                print(error)
            }
        completed()
        }
    }
}
