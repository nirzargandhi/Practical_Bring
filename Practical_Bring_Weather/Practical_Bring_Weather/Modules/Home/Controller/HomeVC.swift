//
//  HomeVC.swift
//  Practical_Bring_Weather
//

import MapKit
import UIKit

class HomeVC: UIViewController {

    //MARK: - UITextField Outlet
    @IBOutlet weak var txtSearch: UITextField!

    //MARK: - MKMapView Outlet
    @IBOutlet weak var mapView: MKMapView!

    //MARK: - UICollectionView Outlet
    @IBOutlet weak var cvBookmarkCities: UICollectionView!

    //MARK: - NSLayoutConstraint Outlet
    @IBOutlet weak var nslcCVBookmarkCitiesHeight: NSLayoutConstraint!

    //MARK: - UILabel Outlet
    @IBOutlet weak var lblNoBookmarkCitiesData: UILabel!

    //MARK: - Variable Declaration
    var arrBookmarkCities : [BookmarkCity]?

    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()
    }

    override func viewWillAppear(_ animated: Bool) {
        getBookmarkCitiesData()
    }

    //MARK: - Initialization Method
    private func initialization() {

        hideNavigationBar(isTabbar: true)

        addTapGesture()
    }

    //MARK: - Add & Handle Tap Gesture Methods
    private func addTapGesture() {

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        mapView.addGestureRecognizer(tapGesture)
    }

    @objc private func handleTap(_ sender: UITapGestureRecognizer? = nil) {

        if let touchLocation = sender?.location(in: mapView) {
            let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
            callWeatherByLatLongAPI(latitude: locationCoordinate.latitude, longitude: locationCoordinate.longitude)
        }
    }

    //MARK: - Get Bookmark Cities Data Method
    private func getBookmarkCitiesData() {

        if isKeyPresentInUserDefaults(key: UserDefaultsKey.kBookmarkCities) {
            guard let data : Data = getUserDefault(UserDefaultsKey.kBookmarkCities) as? Data else { return }

            if let array = try? JSONDecoder().decode([BookmarkCity].self, from: data) {
                arrBookmarkCities = array
            }

            setBookmarkCities()
        } else {
            if arrBookmarkCities != nil {
                arrBookmarkCities = []

                for annotation in mapView.annotations {
                    mapView.removeAnnotation(annotation)
                }
            }

            setBookmarkCities()
        }
    }

    //MARK: - Set Bookmark Cities Data Method
    internal func setBookmarkCities() {

        if arrBookmarkCities?.count ?? 0 > 0 {
            cvBookmarkCities.reloadData()

            cvBookmarkCities.isHidden = false
            lblNoBookmarkCitiesData.isHidden = true

            setAnnotation()
        } else {
            lblNoBookmarkCitiesData.isHidden = false
            cvBookmarkCities.isHidden = true
        }
    }

    //MARK: - Set Annotation Method
    internal func setAnnotation() {

        for i in 0..<(arrBookmarkCities?.count ?? 0) {
            addAnnotationPin(city: arrBookmarkCities?[i].city ?? "", lat: arrBookmarkCities?[i].lat ?? 0.0, lon: arrBookmarkCities?[i].long ?? 0.0)
        }
    }

    //MARK: - Call Weather API Methods
    private func callWeatherByLatLongAPI(latitude : Double, longitude : Double) {

        guard case ConnectionCheck.isConnectedToNetwork() = true else {
            Utility().dynamicToastMessage(strMessage: AlertMessage.msgNetworkConnection)
            return
        }

        ServiceRequest().wsWeatherByLatLong(latitude: latitude, longitude: longitude) { [weak self] (success, responseData) in

            guard let self else { return }

            if success, let responseData = responseData as? WeatherForecastModel, responseData.cod == 200 {

                addAnnotationPin(city: responseData.name ?? "", lat: latitude, lon: longitude)

                navigateToCityForecastVC(dictResponseData: responseData)
            } else {
                mainThread {
                    Utility().dynamicToastMessage(strMessage: responseData != nil ? Utility().wsFailResponseMessage(responseData: responseData!) : AlertMessage.msgError)
                }
            }
        }
    }

    internal func callWeatherBySeachAPI(search : String) {

        guard case ConnectionCheck.isConnectedToNetwork() = true else {
            Utility().dynamicToastMessage(strMessage: AlertMessage.msgNetworkConnection)
            return
        }

        ServiceRequest().wsWeatherBySearch(strSearch: search) { [weak self] (success, responseData) in

            guard let self else { return }

            if success, let responseData = responseData as? WeatherForecastModel, responseData.cod == 200 {

                addAnnotationPin(city: responseData.name ?? "", lat: responseData.coord?.lat ?? 0.0, lon: responseData.coord?.lon ?? 0.0)

                navigateToCityForecastVC(dictResponseData: responseData)
            } else {
                mainThread {
                    Utility().dynamicToastMessage(strMessage: responseData != nil ? Utility().wsFailResponseMessage(responseData: responseData!) : AlertMessage.msgError)
                }
            }
        }
    }

    //MARK: - Navigate To CityForecastVC Method
    private func navigateToCityForecastVC(dictResponseData : WeatherForecastModel) {
        let objCityForecastVC = AllStoryBoard.Main.instantiateViewController(withIdentifier: ViewControllerName.kCityForecastVC) as! CityForecastVC
        objCityForecastVC.dictWeatherForecast = dictResponseData
        self.tabBarController?.navigationController?.pushViewController(objCityForecastVC, animated: true)
    }
}

