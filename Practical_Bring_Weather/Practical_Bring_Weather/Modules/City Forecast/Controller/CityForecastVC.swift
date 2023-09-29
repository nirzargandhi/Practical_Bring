//
//  CityForecastVC.swift
//  Practical_Bring_Weather
//

import UIKit

class CityForecastVC: UIViewController {

    //MARK: - UILabel Outlets
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblCurrentTemp: UILabel!
    @IBOutlet weak var lblHighLowTemp: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblHumidity: UILabel!
    @IBOutlet weak var lblWindSpeed: UILabel!
    @IBOutlet weak var lblSunriseTime: UILabel!
    @IBOutlet weak var lblSunsetTime: UILabel!

    //MARK: - UIImageView Outlet
    @IBOutlet weak var imgvIcon: UIImageView!

    //MARK: - Variable Declaration
    var dictWeatherForecast : WeatherForecastModel?

    //MARK: - ViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()

        setWeatherData()
    }

    //MARK: - Initialization Method
    private func initialization() {
        hideNavigationBar(isTabbar: true)
    }

    //MARK: - UIButton Action Methods
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func btnHelpAction(_ sender: Any) {
        let objHelpVC = AllStoryBoard.Main.instantiateViewController(withIdentifier: ViewControllerName.kHelpVC) as! HelpVC
        self.navigationController?.pushViewController(objHelpVC, animated: true)
    }

    @IBAction func btnAddToBookmarkAction(_ sender: Any) {

        var arrBookmarkCity = [BookmarkCity]()

        var dictBookmarkCity = BookmarkCity()
        dictBookmarkCity.city = dictWeatherForecast?.name ?? ""
        dictBookmarkCity.lat = dictWeatherForecast?.coord?.lat ?? 0.0
        dictBookmarkCity.long = dictWeatherForecast?.coord?.lon ?? 0.0

        if isKeyPresentInUserDefaults(key: UserDefaultsKey.kBookmarkCities) {
            guard let data : Data = getUserDefault(UserDefaultsKey.kBookmarkCities) as? Data else { return }

            if let array = try? JSONDecoder().decode([BookmarkCity].self, from: data) {
                arrBookmarkCity = array
            }
        }

        if arrBookmarkCity.contains(where: {$0.city == dictBookmarkCity.city}) {
            Utility().dynamicToastMessage(strMessage: AlertMessage.msgCityAlreadyBookmark)
        } else {
            arrBookmarkCity.append(dictBookmarkCity)

            if let data = try? JSONEncoder().encode(arrBookmarkCity) {
                setUserDefault(data, key: UserDefaultsKey.kBookmarkCities)

                Utility().dynamicToastMessage(strMessage: AlertMessage.msgCityBookmarkSuccess)
            }
        }
    }

    //MARK: - Set Weather Data Method
    private func setWeatherData() {

        let intUnitType = getUserDefault(UserDefaultsKey.kUnitType) as? Int ?? 1

        let dictWeather = (dictWeatherForecast?.weather?.count ?? 0) > 0 ? dictWeatherForecast?.weather?[0] : nil

        lblCity.text = (dictWeatherForecast?.name ?? "") + " Forecast"

        if let url = URL(string: "\(WebServiceURL.iconURL)\(dictWeather?.icon ?? "")@2x.png") {
            imgvIcon.downloadImage(from: url)
        } else {
            imgvIcon.image = nil
        }

        let currentDateTime = Date(timeIntervalSinceNow: TimeInterval(dictWeatherForecast?.timezone ?? 0))
        lblTime.text = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormate_hhmma, isTimeZoneUTC: true).string(from: currentDateTime)

        lblCurrentTemp.text = "\(dictWeatherForecast?.main?.temp ?? 0.0) \(intUnitType == 1 ? "C" : "F")"

        lblHighLowTemp.text = "High - \(dictWeatherForecast?.main?.temp_max ?? 0.0) \(intUnitType == 1 ? "C" : "F")" + "\n" + "Low - \(dictWeatherForecast?.main?.temp_min ?? 0.0) \(intUnitType == 1 ? "C" : "F")"

        lblWeather.text = dictWeather?.main ?? ""

        lblHumidity.text = "\(dictWeatherForecast?.main?.humidity ?? 0) %"

        lblWindSpeed.text = "\(dictWeatherForecast?.wind?.speed ?? 0.0) \(intUnitType == 1 ? "metre/sec" : "miles/hour")"

        let sunriseDateTime = Date(timeIntervalSince1970: TimeInterval(dictWeatherForecast?.sys?.sunrise ?? 0))
        lblSunriseTime.text = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormate_hhmma, isTimeZoneUTC: false).string(from: sunriseDateTime)

        let sunsetDateTime = Date(timeIntervalSince1970: TimeInterval(dictWeatherForecast?.sys?.sunset ?? 0))
        lblSunsetTime.text = Utility().datetimeFormatter(strFormat: DateAndTimeFormatString.strDateFormate_hhmma, isTimeZoneUTC: false).string(from: sunsetDateTime)
    }
}
