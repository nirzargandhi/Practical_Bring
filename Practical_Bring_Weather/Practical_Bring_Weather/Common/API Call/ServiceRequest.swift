//
//  ServiceRequest.swift
//  TensorIoT_Practical
//

//MARK: - Service Request
struct ServiceRequest {

    //MARK: - Webservice Call Methods
    func wsWeatherByLatLong(latitude : Double, longitude : Double, completion : @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {

        let strUnitType = (getUserDefault(UserDefaultsKey.kUnitType) as? Int ?? 1) == 1 ? UnitType.kMetric : UnitType.kImperial

        let strURL = "\(WebServiceURL.weatherURL)\(WebServiceParameter.pLat)=\(latitude)&\(WebServiceParameter.pLon)=\(longitude)&\(WebServiceParameter.pUnits)=\(strUnitType)&\(WebServiceParameter.pAppId)=\(OpenWeather.pAPIKey)"

        ApiCall().get(apiUrl: strURL, model: WeatherForecastModel.self) { (success, responseData) in

            if success {
                completion(true, responseData)
            } else {
                completion(false, responseData)
            }
        }
    }

    func wsWeatherBySearch(strSearch : String, completion : @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {

        let strUnitType = (getUserDefault(UserDefaultsKey.kUnitType) as? Int ?? 1) == 1 ? UnitType.kMetric : UnitType.kImperial

        let strURL = "\(WebServiceURL.weatherURL)\(WebServiceParameter.pSearch)=\(strSearch)&\(WebServiceParameter.pUnits)=\(strUnitType)&\(WebServiceParameter.pAppId)=\(OpenWeather.pAPIKey)"

        ApiCall().get(apiUrl: strURL, model: WeatherForecastModel.self) { (success, responseData) in

            if success {
                completion(true, responseData)
            } else {
                completion(false, responseData)
            }
        }
    }
}
