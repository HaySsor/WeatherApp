//
//  WeatherDayView.swift
//  WeatherApp
//
//  Created by Przemek Hussar on 13/09/2023.
//

import Foundation

struct WeatherDay :Identifiable{
    
    var id = UUID()
    var dayOfWeek :String
    var imageName :String
    var temperature :Int
    
}
