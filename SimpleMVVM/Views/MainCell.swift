//
//  MainCell.swift
//  SimpleMVVM
//
//  Created by Nikolai  on 20.09.2023.
//

import UIKit

class MainCell: UITableViewCell {
    
    static var identifier: String {
        "MainCell"
    }
    
    private let nameLable = UILabel()
    private let emailLable = UILabel()
    private var labelsStackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        nameLable.font = .systemFont(ofSize: 16)
        emailLable.font = .systemFont(ofSize: 14)
        emailLable.textColor = .gray
        
        labelsStackView = UIStackView(arrangedSubviews: [nameLable, emailLable])
        labelsStackView.axis = .vertical
        labelsStackView.spacing = 2
        labelsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(labelsStackView)
        
        NSLayoutConstraint.activate([
            labelsStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            labelsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
    }
    
    func setupCell(viewModel: MainCellViewModel) {
        nameLable.text = viewModel.name
        emailLable.text = viewModel.email
    }
    
}
