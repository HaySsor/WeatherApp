//
//  ContentView.swift
//  WeatherApp
//
//  Created by Przemek Hussar on 13/09/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var weatherDaysArray :[WeatherDay] = [
        WeatherDay(dayOfWeek:"THU", imageName: "cloud.sun.fill", temperature: 76),
        WeatherDay(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 88),
        WeatherDay(dayOfWeek: "THU", imageName: "cloud.fill", temperature: 55),
        WeatherDay(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 60),
        WeatherDay(dayOfWeek: "SAT", imageName: "sunset.fill", temperature: 70)
    ]
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            VStack {
                CityTextView(cityName: "Cupertion, CA")
                
                MainWeatherStatusView(
                    imageName:isNight ? "moon.stars.fill"  :"cloud.sun.fill",
                    temperature: 76
                )
        
                HStack(spacing:20){
                    ForEach (weatherDaysArray){ day in
                        
                        WeatherDayView(
                            dayOfWeek: day.dayOfWeek,
                            imageName: day.imageName,
                            temperature: day.temperature)
                        
                    }
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .black,
                                  backgroudColor: .white
                    )
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek : String
    var imageName : String
    var temperature : Int
    
    var body: some View {
        
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .foregroundStyle(.white, .yellow, .cyan)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40 , height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
    
}

struct BackgroundView: View {
    
    var isNight :Bool
    
    var body: some View {
//        LinearGradient(
//            gradient: Gradient(
//                colors: [isNight ? .black : .blue,isNight ? .gray : Color("lightBlue")]
//            ),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView : View{
    
    var cityName :String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName :String
    var temperature : Int
    
    var body: some View {
        VStack( spacing: 10 ){
            Image(systemName: imageName)
                .symbolRenderingMode(.palette)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180 , height: 180)
                .foregroundStyle(.white, .yellow)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom , 50)
    }
}
