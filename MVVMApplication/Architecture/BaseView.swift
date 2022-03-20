//
//  BaseScene.swift
//  Architecture
//
//  Created by Vadim Marchenko on 15.03.2022.
//

import Foundation
import UIKit

open class BaseView: UIView {
    
    // MARK: Init
      override public init(frame: CGRect) {
          super.init(frame: frame)
          makeUI()
      }

      @available(*,
                 unavailable,
                 message: "Loading this view from a nib is resticted")
      public required init?(coder: NSCoder) {
          fatalError("Loading this view from a nib is resticted")
      }
      
      // MARK: UI
      func makeUI() {
          fatalError("This method was not implemented.")
      }

}
