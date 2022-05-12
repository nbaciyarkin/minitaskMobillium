//
//  CustomCheckBox.swift
//  Mobillium Task
//
//  Created by Yarkın Gazibaba on 12.05.2022.
//

import Foundation
import UIKit

class CustomCheckBox: UIView {
    var isChecked = false
    
    let imageview: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "filledCheck")
        image.isHidden = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 8
        return image
    }()
    
    let boxView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.label.cgColor
        view.isHidden = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(boxView)
        addSubview(imageview)
        clipsToBounds = true
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        boxView.frame = CGRect(x: 7, y: 7, width: frame.size.width-30, height: frame.size.width-30)
        imageview.frame = CGRect(x: 7, y: 7, width: boxView.frame.width-1, height: boxView.frame.height-1)
    }
    
        func toggle(){
        self.isChecked = !isChecked
        imageview.isHidden = !isChecked
        boxView.isHidden = isChecked
    }
    
}
