//
//  HelpVC.swift
//  Practical_Bring_Weather
//

import UIKit
import WebKit

class HelpVC: UIViewController {

    //MARK: - WKWebView Outlet
    @IBOutlet weak var webKit: WKWebView!

    //MARK: - UIActivityIndicatorView Outlet
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    //MARK: - ViewController Method
    override func viewDidLoad() {
        super.viewDidLoad()

        initialization()

        loadURL()
    }

    //MARK: - Initialization Method
    private func initialization() {
        hideNavigationBar(isTabbar: true)
    }

    //MARK: - Load URL Method
    private func loadURL() {

        if let url = URL(string: WebServiceURL.helpURL) {

            var request = URLRequest(url: url)

            webKit.load(request)

            activityIndicator.startAnimating()
        }
    }
}
