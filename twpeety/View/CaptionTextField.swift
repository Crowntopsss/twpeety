//
//  CaptionTextField.swift
//  twpeety
//
//  Created by Temitope on 17/04/2021.
//

import UIKit

class CaptionTextField: UITextView {
    
    // MARK: = Properties

    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.text = "Whats happening"
        return label
    }()
    
    // MARK: = LifeCycle
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame,  textContainer: textContainer)
        
        
        layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        layer.borderWidth = 1.0

        backgroundColor = .white
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        self.sizeToFit()

        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 4)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: = Selectors

    @objc func handleTextInputChange() {
        placeholderLabel.isHidden = !text.isEmpty
    }
    // MARK: = Properties

}
