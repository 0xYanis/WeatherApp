//
//  TodaysWeatherElements.swift
//  WeatherApp
//
//  Created by Yan Rybkin on 14.03.2023.
//

import UIKit

final class TodaysWeatherElements: UICollectionViewCell {
	
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(
            name: "Helvetica-Bold",
            size: UIConstants.locationLabelFontSize)
        label.text = "My location"
        label.textColor = .white
        return label
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(
            name: "Helvetica-Bold",
            size: UIConstants.todayLabelFontSize)
        label.textColor = .systemGray6
        return label
    }()
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(
            name: "Helvetica-Bold",
            size: UIConstants.temperatureLabelFontSize)
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 3)
        label.layer.shadowRadius = 5
        label.layer.shadowOpacity = 0.5
        label.layer.masksToBounds = false
        return label
    }()
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(
            name: "Helvetica-Bold",
            size: UIConstants.degreeLabelFontSize)
        label.text = "\u{00B0}"
        label.textColor = .white
        label.layer.shadowColor = UIColor.black.cgColor
        label.layer.shadowOffset = CGSize(width: 0, height: 3)
        label.layer.shadowRadius = 2
        label.layer.shadowOpacity = 0.5
        label.layer.masksToBounds = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Helvetica-Bold",
                            size: UIConstants.descriptionLabelFontSize)
        label.textColor = .systemGray6
        return label
    }()
    
	override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private enum UIConstants {
		static let locationLabelFontSize: CGFloat          = 32
		static let todayLabelFontSize: CGFloat             = 14
		static let todayLabelToLocationOffset: CGFloat     = 15
		static let imageViewToTodayOffset: CGFloat         = 20
		static let imageViewWidth: CGFloat                 = 200
		static let temperatureLabelFontSize: CGFloat       = 72
		static let temperatureLabelToImageOffset: CGFloat  = 5
		static let degreeLabelFontSize: CGFloat            = 48
		static let descriptionLabelFontSize: CGFloat       = 16
		static let descriptionLabelToTempOffset: CGFloat   = 10
	}
    
    func configure(with todaysWeather: Weather, today: String) {
        locationLabel.text = todaysWeather.geoObject.province?.name ?? "Earth"
        todayLabel.text = today
        imageView.image = UIImage(named: todaysWeather.fact.condition?.rawValue ?? "")
        temperatureLabel.text = String(describing: todaysWeather.fact.temp ?? 0)
        descriptionLabel.text = todaysWeather.fact.condition?.rawValue
    }
    
}

private extension TodaysWeatherElements {
    
	func initialize() {
		contentView.addSubview(locationLabel)
		locationLabel.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.centerX.equalToSuperview()
		}
		contentView.addSubview(todayLabel)
		todayLabel.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(locationLabel.snp.bottom)
				.offset(UIConstants.todayLabelToLocationOffset)
		}
		contentView.addSubview(imageView)
		imageView.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(todayLabel.snp.bottom)
				.offset(UIConstants.imageViewToTodayOffset)
			make.width.equalTo(UIConstants.imageViewWidth)
		}
		contentView.addSubview(temperatureLabel)
		temperatureLabel.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(imageView.snp.bottom)
				.offset(UIConstants.temperatureLabelToImageOffset)
		}
		contentView.addSubview(degreeLabel)
		degreeLabel.snp.makeConstraints { make in
			make.top.equalTo(temperatureLabel.snp.top).inset(5)
			make.trailing.equalTo(temperatureLabel.snp.trailing).offset(17)
		}
		contentView.addSubview(descriptionLabel)
		descriptionLabel.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.top.equalTo(temperatureLabel.snp.bottom)
				.offset(UIConstants.descriptionLabelToTempOffset)
		}
	}
    
}
