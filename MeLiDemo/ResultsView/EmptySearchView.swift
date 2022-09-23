//
//  EmptySearchView.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import UIKit

class EmptySearchView: UIView {

    
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
        it.image = UIImage(named: "icons8-search-100")
        return it
    }()
    
    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "No encontramos publicaciones"
        return lbl
    }()
    private let subtitleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Revisa que la palabra este bien escrita"
        return lbl
    }()
    
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
extension EmptySearchView: ViewCodeConfiguration {
    func buildHierarchy() {
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            subtitleLabel.heightAnchor.constraint(equalToConstant: 32)
        ])
    }
    
}

