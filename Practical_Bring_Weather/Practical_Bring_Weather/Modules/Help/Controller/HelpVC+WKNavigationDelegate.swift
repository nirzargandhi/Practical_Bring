//
//  HelpVC+WKNavigationDelegate.swift
//  Practical_Bring_Weather
//

import Foundation
import WebKit

//MARK: - WKNavigationDelegate Extension
extension HelpVC : WKNavigationDelegate {

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    }

    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {

        Utility().dynamicToastMessage(strMessage: error.localizedDescription)

        activityIndicator.stopAnimating()
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
}
