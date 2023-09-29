//
//  HomeVC+UICollectionViewDelegate+UICollectionViewDataSource.swift
//  Practical_Bring_Weather
//

import Foundation
import UIKit

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource & UICollectionViewLayout Extension
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrBookmarkCities?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifiers.kCellBookmarkCities, for: indexPath) as! BookmarkCitiesCVC

        cell.lblCity.text = arrBookmarkCities?[indexPath.row].city ?? ""

        cell.btnRemoveCity.tag = indexPath.row
        cell.btnRemoveCity.addTarget(self, action: #selector(btnRemoveCityAction(_:)) , for: .touchUpInside)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        addAnnotationPin(city: arrBookmarkCities?[indexPath.row].city ?? "", lat: arrBookmarkCities?[indexPath.row].lat ?? 0.0, lon: arrBookmarkCities?[indexPath.row].long ?? 0.0)

        callWeatherBySeachAPI(search: arrBookmarkCities?[indexPath.row].city ?? "")
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let lblCity = UILabel()
        lblCity.font = Fonts.InterRegular16
        lblCity.text = arrBookmarkCities?[indexPath.row].city ?? ""
        lblCity.sizeToFit()

        return CGSize(width: lblCity.frame.width + 25, height: 50)
    }

    @objc func btnRemoveCityAction(_ sender: UIButton) {

        if mapView.annotations.contains(where: {$0.title == (arrBookmarkCities?[sender.tag].city ?? "")}) {
            outer : for annotation in mapView.annotations {
                if let title = annotation.title, title == arrBookmarkCities?[sender.tag].city ?? "" {
                    mapView.removeAnnotation(annotation)
                    break outer
                }
            }
        }

        arrBookmarkCities?.remove(at: sender.tag)

        setBookmarkCities()

        if let data = try? JSONEncoder().encode(arrBookmarkCities) {
            setUserDefault(data, key: UserDefaultsKey.kBookmarkCities)
        }
    }
}
