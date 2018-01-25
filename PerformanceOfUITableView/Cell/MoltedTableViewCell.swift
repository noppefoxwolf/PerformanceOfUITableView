//
//  MoltedTableViewCell.swift
//  PerformanceOfUITableView
//
//  Created by Tomoya Hirano on 2018/01/26.
//  Copyright © 2018年 Tomoya Hirano. All rights reserved.
//

import UIKit

final class MoltedTableViewCell: UITableViewCell {
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    molt()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func molt() {
    // 効：removeFromSuperViewすることでvisibleCells分のviewが減らせる
    // 調：removeFromSuperViewのコスト
    // 調：removeFromSuperViewのコール回数とタイミング
    contentView.removeFromSuperview()
  }
  
  override func draw(_ rect: CGRect) {
    super.draw(rect)
    
    // 効：drawを使うことでsubViewを増やさずに文字を描画出来る
    let textFont = UIFont.systemFont(ofSize: 14)
    let textFontAttributes = [
      NSAttributedStringKey.font: textFont,
      NSAttributedStringKey.foregroundColor: UIColor.black,
    ]
    "myText😩".draw(in: rect, withAttributes: textFontAttributes)
  }
  
  // 効：setSelectedをoverrideすることでレイヤーを増やさずに選択色を指定出来る
  private let selectedColor = UIColor.lightGray
  private var _backgroundColor: UIColor? = UIColor.white
  override func setSelected(_ selected: Bool, animated: Bool) {
    if selected {
      _backgroundColor = backgroundColor
      backgroundColor = selectedColor
    } else {
      backgroundColor = _backgroundColor
    }
  }
}
