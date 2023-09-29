//
//  Constants.swift
//

import UIKit

//MARK: - Colors
extension UIColor {

    class func appBackgroundColor() -> UIColor { return UIColor(named: "AppBackground")! }
    class func appGrayColor() -> UIColor { return UIColor(named: "AppGray")! }
    class func appPrimaryColor() -> UIColor { return UIColor(named: "AppPrimary")! }
    class func appRedColor() -> UIColor { return UIColor(named: "AppRed")! }
    class func appToastMessageBgColor() -> UIColor { return UIColor(named: "AppToastMessageBg")! }
    class func appToastMessageFontColor() -> UIColor { return UIColor(named: "AppToastMessageFont")! }
}

//MARK: - StoryBoard Identifier's
enum AllStoryBoard {

    static let Main = UIStoryboard(name: "Main", bundle: nil)
}

//MARK: - ViewController Names
enum ViewControllerName {

    static let kTabbarVC = "TabbarVC"
    static let kHomeVC = "HomeVC"
    static let kHelpVC = "HelpVC"
    static let kSettingVC = "SettingVC"
}

//MARK: - Cell Identifiers
enum CellIdentifiers {

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
}

//MARK: - Web Service URLs
enum WebServiceURL {

    //Main URL
    static let mainURL = "https://api.openweathermap.org/data/2.5/"

    static let weatherURL = mainURL + "weather?"

    static let iconURL = "https://openweathermap.org/img/wn/"
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

    static let kBookMarkCity = "bookmark_city"
}

//MARK: - DateTime Format
enum DateAndTimeFormatString {

    static let strDateFormat_yyyymmddHHmmss = "yyyy-MM-dd HH:mm:ss"
    static let strDateFormat_yyyyMMdd = "yyyy/MM/dd"
    static let strDateFormate_hhmma = "hh:mm a"
}

//MARK: - Location Status Message
enum LocationStatus {

    static let kNotDetermined = "notDetermined"
    static let kAuthorizedAlways = "authorizedAlways"
    static let kAuthorizedWhenInUse = "authorizedWhenInUse"
    static let kDenied = "denied"
    static let kRestricted = "restricted"
}

//MARK: - Fonts
enum Fonts {

    static let InterBold16 = UIFont(name: "Inter-Bold", size: 16) ?? UIFont.systemFont(ofSize: 16, weight: .bold)
    static let InterRegular14 = UIFont(name: "Inter-Regular", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .regular)
}

//MARK: - Open Weather APIKey
enum OpenWeather {

    static let pAPIKey = "c6e381d8c7ff98f0fee43775817cf6ad"
}
