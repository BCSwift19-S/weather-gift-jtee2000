//
//  WeatherLocatio.swift
//  WeatherGift
//
//  Created by Jason Tee on 3/20/19.
//  Copyright © 2019 Jason Tee. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather () {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        Alamofire.request(weatherURL).responseJSON { response in
            print(response)
        }
    }
}
