//
//  LoadingView.swift
//  BryanMandiriAssesment
//
//  Created by Bryan Kenneth on 08/07/23.
//

import UIKit
import SnapKit

class LoadingView: UIView {

  private lazy var loadingViewContainer: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.white
    view.layer.cornerRadius = 10
    view.layer.cornerRadius = 10
    view.layer.shadowColor = UIColor.lightGray.cgColor
    view.layer.shadowOpacity = 0.5
    view.layer.shadowOffset = .init(width: 0, height: 4)
    view.layer.shadowRadius = 4
    return view
  }()
  
  private lazy var viewContainer: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    return view
  }()
  
  private lazy var loadingIndicator: UIActivityIndicatorView = {
    let loadingIndicator = UIActivityIndicatorView(frame: CGRectMake(10, 5, 50, 50)) as UIActivityIndicatorView
    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.style = .medium
    loadingIndicator.color = .black
    loadingIndicator.startAnimating()
    return loadingIndicator
  }()
  
  private lazy var labelLoading: UILabel = {
    let label = UILabel()
    label.text = "Loading Data"
    label.textColor = .black
    label.font = .boldSystemFont(ofSize: 17)
    return label
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  private func configureView() {
    self.addSubview(viewContainer)
    viewContainer.snp.makeConstraints { make in
      make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
      make.top.equalTo(self.safeAreaLayoutGuide.snp.top)
      make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading)
      make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing)
    }
    
    viewContainer.addSubview(loadingViewContainer)
    loadingViewContainer.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.centerY.equalToSuperview()
      make.width.equalTo(UIScreen.main.bounds.width/2)
      make.height.equalTo(40)
    }
    
    loadingViewContainer.addSubview(loadingIndicator)
    loadingIndicator.snp.makeConstraints { make in
      make.leading.equalTo(loadingViewContainer.snp.leading).offset(15)
      make.centerY.equalToSuperview()
    }
    
    loadingViewContainer.addSubview(labelLoading)
    labelLoading.snp.makeConstraints { make in
      make.leading.equalTo(loadingIndicator.snp.trailing).offset(5)
      make.trailing.equalTo(loadingViewContainer.snp.trailing).offset(15)
      make.centerY.equalToSuperview()
    }
    
    
    
  }

}
