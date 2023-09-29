//
//  HelpVC.swift
//  Practical_Bring_Weather
//
import UIKit

class HelpVC: UIViewController {

    //MARK: - ViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()
    }

    //MARK: - Initialization Method
    private func initialization() {
        hideNavigationBar(isTabbar: true)
    }
}
