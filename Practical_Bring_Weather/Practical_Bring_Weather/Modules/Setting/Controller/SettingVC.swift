//
//  SettingVC.swift
//  Practical_Bring_Weather
//

import UIKit

class SettingVC: UIViewController {

    //MARK: - UIButton Outlets
    @IBOutlet weak var btnMetric: UIButton!
    @IBOutlet weak var btnImperial: UIButton!

    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()
    }

    override func viewWillAppear(_ animated: Bool) {

        checkUnitType()
    }

    //MARK: - Initialization Method
    private func initialization() {
        hideNavigationBar(isTabbar: true)
    }

    //MARK: - UIButton Action Methods
    @IBAction func btnUnitTypeAction(_ sender: UIButton) {

        updateUnitType(intSelected: sender.tag)

        setUserDefault(sender.tag, key: UserDefaultsKey.kUnitType)
    }

    @IBAction func btnClearDataAction(_ sender: Any) {
        userDefaultDataClear()
    }

    //MARK: - Check Unit Type Method
    private func checkUnitType() {

        if let intUnitType : Int = getUserDefault(UserDefaultsKey.kUnitType) as? Int {
            updateUnitType(intSelected: intUnitType)
        }
    }

    //MARK: - Update Unit Type Method
    private func updateUnitType(intSelected : Int) {

        unSelectUnitType()

        switch intSelected {

        case 2:
            btnImperial.isSelected = true

        default:
            btnMetric.isSelected = true
        }
    }

    //MARK: - UnSelect Unit Type Method
    private func unSelectUnitType() {

        btnMetric.isSelected = false
        btnImperial.isSelected = false
    }

    //MARK: - UserDefault Data Clear Method
    private func userDefaultDataClear() {

        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.kBookmarkCities)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKey.kUnitType)
        UserDefaults.standard.synchronize()

        Utility().dynamicToastMessage(strMessage: AlertMessage.msgDataClearSuccess)

        Utility().setDefaultUnitType()

        checkUnitType()
    }
}
