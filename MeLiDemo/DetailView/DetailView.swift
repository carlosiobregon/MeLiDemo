//
//  DetailView.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import UIKit

class DetailView: UIView {

    
    //MARK: - Outlets
    lazy var stackView: UIStackView = {
        let it = UIStackView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.axis = .vertical
        it.alignment = .center
        return it
    }()
    
    lazy var imageView: UIImageView = {
        let it = UIImageView()
        it.translatesAutoresizingMaskIntoConstraints = false
        it.contentMode = .scaleAspectFit
        return it
    }()
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = .zero
        return lbl
    }()
    private let subtitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .left
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var model : Item? {
        didSet {
            guard let it = model else { return }
            titleLabel.text = it.title
            subtitleLabel.text = "Precio: $ \(it.price) \(it.currency)"
            if let urlPicture = it.urlPicture {
                imageView.downloaded(from: urlPicture)
            }
            
        }
    }
    
    //Mark: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyViewCode()
    }
    
}

//Mark: - ViewCodeConfiguration
extension DetailView: ViewCodeConfiguration {
    func buildHierarchy() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(imageView)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 32),
            subtitleLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            subtitleLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -10),
            imageView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
    
}
    

