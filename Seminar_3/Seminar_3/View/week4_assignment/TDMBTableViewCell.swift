//
//  TDMBTableViewCell.swift
//  Seminar_3
//
//  Created by 홍유정 on 2023/05/12.
//

import UIKit
import SnapKit
import Then
import Kingfisher

final class TDMBTableViewCell: UITableViewCell {
    
    static let identifier = "TDMBTableViewCell"
    
    private let originalTitleLabel = UILabel()
    private let originalLanguageLabel = UILabel()
    private let overviewLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let popularityLabel = UILabel()
    private let posterImageView = UIImageView()
    private let stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setStyle() {
        
        separatorInset.left = 0
        
        selectionStyle = .none
                
        originalTitleLabel.do {
            $0.font = UIFont.systemFont(ofSize: 12)
        }
        
        originalLanguageLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        overviewLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
            $0.numberOfLines = 6
        }
        
        releaseDateLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 11)
        }
        
        popularityLabel.do {
            $0.font = UIFont.boldSystemFont(ofSize: 13)
        }
        
        stackView.do {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.alignment = .center
            $0.spacing = 5
        }
    }
    
    func setLayout() {
        
        [stackView]
            .forEach { contentView.addSubview($0) }
        
        [posterImageView, originalTitleLabel, overviewLabel, releaseDateLabel, popularityLabel]
            .forEach { stackView.addArrangedSubview($0) }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        posterImageView.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(130)
        }
        
        
    }
    
    func configureCell(_ result: ResultDataModel) {
        let posterURL = URL(string: "https://image.tmdb.org/t/p/original/\(result.posterPath)")
        posterImageView.kf.setImage(with: posterURL)
        
        originalTitleLabel.text = result.originalTitle
        overviewLabel.text = result.overview
        releaseDateLabel.text = result.releaseDate
        popularityLabel.text = String(result.popularity)
        
    }
}
