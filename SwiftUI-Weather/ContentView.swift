//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Matt Watters on 2024-02-15.
//

import SwiftUI

struct ContentView: View {
	
	@State private var isNight = false
	
    var body: some View {
		ZStack {
			BackgroundView(isNight: isNight)
			VStack {
				CityTextView(cityName: "Ottawa, ON")
				
				MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
									  temperature: 25)
				
				HStack (spacing: 20) {
					WeatherDayView(dayOfWeek: "TUE",
								   imageName: "cloud.sun.fill",
								   temperature: 21)
					WeatherDayView(dayOfWeek: "WED",
								   imageName: "wind",
								   temperature: 26)
					WeatherDayView(dayOfWeek: "THU",
								   imageName: "cloud.heavyrain.fill",
								   temperature: 22)
					WeatherDayView(dayOfWeek: "FRI",
								   imageName: "cloud.fill",
								   temperature: 23)
					WeatherDayView(dayOfWeek: "SAT",
								   imageName: "sun.max.fill",
								   temperature: 29)
				}
				
				Spacer()
				
				Button {
					isNight.toggle()
				} label: {
					WeatherButton(title: "Change Day Time",
								  textColor: .white,
								  backgroundColor: .mint)
				}
				
				Spacer()
			}
		}
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
	
	var dayOfWeek: String
	var imageName: String
	var temperature: Int
	
	var body: some View {
		VStack (spacing: 10){
			Text(dayOfWeek)
				.font(.system(size: 16, weight: .regular, design: .default))
				.foregroundColor(.white)
			Image(systemName: imageName)
				.symbolRenderingMode(.multicolor)
				.resizable()
//				.foregroundStyle(.white, .orange, .green)
				.aspectRatio(contentMode: .fit)
				.frame(width: 40, height: 40)
			Text("\(temperature)°")
				.font(.system(size: 28, weight: .regular, design: .default))
				.foregroundColor(.white)
		}
	}
}

struct BackgroundView: View {
	
	var isNight: Bool
	
	var body: some View {
//		LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//												   isNight ? .gray : Color("lightBlue")]),
//					   startPoint: .topLeading,
//					   endPoint: .bottomTrailing)
//		.ignoresSafeArea()
		ContainerRelativeShape()
			.fill(isNight ? Color.black.gradient : Color.blue.gradient)
			.ignoresSafeArea()
	}
}

struct CityTextView: View {
	
	var cityName: String
	
	var body: some View {
		Text(cityName)
			.font(.system(size: 32, weight: .medium, design: .default))
			.foregroundColor(.white)
			.padding()
	}
}

struct MainWeatherStatusView: View {
	
	var imageName: String
	var temperature: Int
	
	var body: some View {
		VStack (spacing: 10) {
			Image(systemName: imageName)
				.renderingMode(.original)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(width: 180, height: 180)
			
			Text("\(temperature)°")
				.font(.system(size: 70, weight: .medium))
				.foregroundColor(.white)
		}
		.padding(.bottom, 40)
	}
}
