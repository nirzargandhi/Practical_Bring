//
//  AppDelegate+Configuration.swift
//  Practical_Bring_Weather
//

//MARK: - AppDelegate Extension
extension AppDelegate {

    //MARK: - Config App Method
    func configApp() {

        //Setting Default Unit Type if not present. Default Unit Type is Metric
        if !isKeyPresentInUserDefaults(key: UserDefaultsKey.kUnitType) {
            Utility().setDefaultUnitType()
        }

        setRootController()
    }

    //MARK: - Set Root Controller Method
    func setRootController() {
        Utility().setRootTabbarVC()
    }
}
