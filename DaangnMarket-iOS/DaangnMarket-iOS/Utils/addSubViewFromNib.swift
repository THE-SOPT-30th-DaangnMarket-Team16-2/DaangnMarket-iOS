//
//  addSubViewFromNib.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/16.
//

import UIKit

extension UIView{
  public func addSubviewFromNib(view : UIView){
    let view = Bundle.main.loadNibNamed(view.className, owner: self, options: nil)?.first as! UIView
    view.frame = bounds
    view.clipsToBounds = true
    addSubview(view)
  }
}

class XibView : UIView{
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubviewFromNib(view: self)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    addSubviewFromNib(view: self)
  }
}
