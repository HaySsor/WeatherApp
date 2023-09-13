//
//  WeatherButton.swift
//  WeatherApp
//
//  Created by Przemek Hussar on 13/09/2023.
//

import SwiftUI

struct WeatherButton: View {
    
    var title :String
    var textColor :Color
    var backgroudColor :Color
    
    var body: some View{
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroudColor.gradient)
            .font(.system(size: 20 , weight: .bold))
            .cornerRadius(10)
            .foregroundColor(textColor)
    }
}
