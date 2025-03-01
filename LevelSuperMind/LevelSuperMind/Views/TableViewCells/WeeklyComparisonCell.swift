//
//  WeeklyComparisonCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//


import UIKit

class WeeklyComparisonCell: UITableViewCell {

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryBackgroundColor.withAlphaComponent(0.5)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly comparison"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This week, your average number of activities dropped 30% from last week. To boost your consistency, commit to streaks after an activity."
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var barChartView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dashedLinesView: DashedLineView = {
        let view = DashedLineView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bar1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bar2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemPurple
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var bar1Label: UILabel = {
        let label = UILabel()
        label.text = "325\nXP"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var bar2Label: UILabel = {
        let label = UILabel()
        label.text = "415\nXP"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initView()
    }
}

// MARK: Tableview Cell Functions
extension WeeklyComparisonCell{
    private func initView(){
        backgroundColor = .clear
        selectionStyle = .none
        setupView()
    }

    private func setupView() {
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(barChartView)
        barChartView.addSubview(dashedLinesView)
        barChartView.addSubview(bar1)
        barChartView.addSubview(bar2)
        bar1.addSubview(bar1Label)
        bar2.addSubview(bar2Label)

        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),

            barChartView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            barChartView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 32),
            barChartView.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -32),
            barChartView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -16),
            barChartView.heightAnchor.constraint(equalToConstant: 120),

            dashedLinesView.topAnchor.constraint(equalTo: barChartView.topAnchor),
            dashedLinesView.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor),
            dashedLinesView.trailingAnchor.constraint(equalTo: barChartView.trailingAnchor),
            dashedLinesView.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor),

            bar1.widthAnchor.constraint(equalToConstant: 50),
            bar1.heightAnchor.constraint(equalToConstant: 80),
            bar1.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor),
            bar1.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor, constant: 40),

            bar2.widthAnchor.constraint(equalToConstant: 50),
            bar2.heightAnchor.constraint(equalToConstant: 100),
            bar2.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor),
            bar2.trailingAnchor.constraint(equalTo: barChartView.trailingAnchor, constant: -40),

            bar1Label.centerXAnchor.constraint(equalTo: bar1.centerXAnchor),
            bar1Label.bottomAnchor.constraint(equalTo: bar1.topAnchor, constant: -8),

            bar2Label.centerXAnchor.constraint(equalTo: bar2.centerXAnchor),
            bar2Label.bottomAnchor.constraint(equalTo: bar2.topAnchor, constant: -8),
        ])
    }
}

