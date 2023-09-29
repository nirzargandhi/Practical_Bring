//
//  Constants.swift
//

import UIKit

//MARK: - StoryBoard Identifier's
enum AllStoryBoard {

    static let Main = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - ViewController Names
enum ViewControllerName {

    static let kTabbarVC = "TabbarVC"
    static let kHomeVC = "HomeVC"
    static let kCityForecastVC = "CityForecastVC"
    static let kHelpVC = "HelpVC"
    static let kSettingVC = "SettingVC"
}

//MARK: - Cell Identifiers
enum CellIdentifiers {

    static let kCellBookmarkCities = "CellBookmarkCities"
}

//MARK: - Message's
enum AlertMessage {

    //Internet Connection Message
    static let msgNetworkConnection = "You are not connected to internet. Please connect and try again"

    //Unauthorized Message
    static let msgUnauthorized = "You are unauthorized. Please login again"

    //General API Error Messages
    static let msgError = "Oops! That didn't work. Please try later :("
    static let msgError500 = "Error code 500 or more"
    static let msgError402 = "Payment required, go to coins packages"
    static let msgError403 = "User forbidden"

    //City Bookmark Messages
    static let msgCityBookmarkSuccess = "City bookmarked successfully"
    static let msgCityAlreadyBookmark = "City is already bookmarked"

    //Data Clear Message
    static let msgDataClearSuccess = "Data has been cleared successfully"
}

//MARK: - Web Service URLs
enum WebServiceURL {

    //Main URL
    static let mainURL = "https://api.openweathermap.org/data/2.5/"

    static let weatherURL = mainURL + "weather?"

    static let iconURL = "https://openweathermap.org/img/wn/"
    static let helpURL = "https://openweathermap.org"
}

//MARK: - Web Service Parameters
enum WebServiceParameter {

    static let pLat = "lat"
    static let pLon = "lon"
    static let pSearch = "q"
    static let pUnits = "units"
    static let pAppId = "appid"
}

//MARK: - User Default
enum UserDefaultsKey {

    static let kBookmarkCities = "bookmark_cities"
    static let kUnitType = "unit_type" //1-Metric & 2-Imperial
}

//MARK: - DateTime Format
enum DateAndTimeFormatString {

    static let strDateFormate_hhmma = "hh:mm a"
}

//MARK: - Fonts
enum Fonts {

    static let InterBold16 = UIFont(name: "Inter-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    static let InterRegular16 = UIFont(name: "Inter-Regular", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .regular)
    static let InterRegular14 = UIFont(name: "Inter-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
}

//MARK: - Fonts
enum UnitType {

    static let kMetric = "metric"
    static let kImperial = "imperial"
}

//MARK: - Open Weather APIKey
enum OpenWeather {

    static let pAPIKey = "c6e381d8c7ff98f0fee43775817cf6ad"
}
