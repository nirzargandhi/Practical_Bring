//
//  HomeVC+UITextFieldDelegate.swift
//  Practical_Bring_Weather
//

import Foundation
import UIKit

//MARK: - UITextField Delegate Extension
extension HomeVC : UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        if textField.returnKeyType == UIReturnKeyType.next {
            textField.superview?.superview?.superview?.viewWithTag(textField.tag + 1)?.becomeFirstResponder()
        } else if textField.returnKeyType == UIReturnKeyType.done {
            textField.resignFirstResponder()
        }

        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        if txtSearch.isEmpty {
            callWeatherBySeachAPI(search: "Kolkata")
        } else {
            callWeatherBySeachAPI(search: txtSearch.text ?? "")
        }
    }
}
