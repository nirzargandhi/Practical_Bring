//
//  ServiceRequest.swift
//  TensorIoT_Practical
//

//MARK: - Service Request
struct ServiceRequest {

    //MARK: - Webservice Call Methods
    func wsWeather(strSearch : String, completion : @escaping (_ success: Bool, _ object: AnyObject?) -> ()) {

        let strURL = "\(WebServiceURL.weatherURL)\(WebServiceParameter.pSearch)=\(strSearch)&\(WebServiceParameter.pUnits)=metric&\(WebServiceParameter.pAppId)=\(OpenWeather.pAPIKey)"

        ApiCall().get(apiUrl: strURL, model: GeneralResponseModel.self) { (success, responseData) in

            if success {
                completion(true, responseData)
            } else {
                completion(false, responseData)
            }
        }
    }
}
