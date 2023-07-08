//
//  Extensions.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 06/07/23.
//

import Foundation
import UIKit
import SnapKit

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}

extension UIViewController {
  func showErrorAlert(message: String) {
    let alert = UIAlertController(title: "Error Loading Data", message: "\(message)", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Back to previous page", style: .cancel, handler: { action in
      self.navigationController?.popViewController(animated: true)
    }))
    self.present(alert, animated: true, completion: nil)
  }
  
  func showLoadingView() {
    guard let currentWindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows.filter({$0.isKeyWindow})
        .first else { return }
    
    if currentWindow.viewWithTag(101) == nil {
      let loadingView = LoadingView()
      loadingView.tag = 101
      currentWindow.addSubview(loadingView)
      loadingView.snp.makeConstraints { make in
        make.leading.equalTo(currentWindow.snp.leading)
        make.top.equalTo(currentWindow.snp.top)
        make.trailing.equalTo(currentWindow.snp.trailing)
        make.bottom.equalTo(currentWindow.snp.bottom)
      }
    }
  }
  
  func hideLoadingView() {
    guard let currentWindow = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive})
        .compactMap({$0 as? UIWindowScene})
        .first?.windows.filter({$0.isKeyWindow})
        .first else { return }
    
    if let subView = currentWindow.viewWithTag(101) {
      subView.removeFromSuperview()
    }
  }
}
