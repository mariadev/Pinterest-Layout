//
//  PinterestCell.swift
//  Pinterest
//
//  Created by Maria on 08/12/2020.
//

import UIKit

class PinterestCell : UICollectionViewCell {
    
    var image: UIImage! {
        didSet {
            imageView.image = image
            imageView.layer.cornerRadius = 8
            imageView.clipsToBounds = true
        }
    }
    
    fileprivate lazy var verticalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, horizontalStackView])
        stack.axis = .vertical
        return stack
    }()
    
    fileprivate lazy var horizontalStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [label, button])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        return stack
    }()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.text = "Subscribe to my blogging channel"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 10, weight: .bold)
        return label
    }()
    
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    fileprivate let button: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "dots")?.withRenderingMode(.alwaysTemplate), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.imageView?.tintColor = .darkGray
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        

        contentView.addSubview(verticalStackView)
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        verticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        horizontalStackView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        button.widthAnchor.constraint(equalToConstant: 24).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 6, left: 4, bottom: 6, right: 4))
    }
}
