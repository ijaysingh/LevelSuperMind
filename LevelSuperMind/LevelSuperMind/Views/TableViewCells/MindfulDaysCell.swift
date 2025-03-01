//
//  MindfulDaysCell.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 01/03/25.
//


import UIKit

class MindfulDaysCell: UITableViewCell {

    private lazy var cardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.secondaryBackgroundColor.withAlphaComponent(0.5)
        view.layer.cornerRadius = 16
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Mindful days this week"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "This week, you were mindful for 5 days! To prevent breaking your streak, try using streak freeze!"
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

    private lazy var horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.systemBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var dashedLineView: DashedLineView = {
        let view = DashedLineView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let days = ["M", "T", "W", "T", "F", "S", "S"]
    private let activities = [80, 40, 60, 20, 60, 30, 100]

    private var barViews: [UIView] = []
    private var dayLabels: [UILabel] = []

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
extension MindfulDaysCell {
    private func initView() {
        backgroundColor = .clear
        selectionStyle = .none
        setupBars()
        setupView()
    }

    private func setupBars() {
        for (index, _) in activities.enumerated() {
            let bar = UIView()
            bar.backgroundColor = UIColor.systemPurple
            bar.layer.cornerRadius = 6
            bar.translatesAutoresizingMaskIntoConstraints = false
            barViews.append(bar)

            let label = UILabel()
            label.text = days[index]
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 14)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            dayLabels.append(label)
        }
    }

    private func setupView() {
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(descriptionLabel)
        cardView.addSubview(barChartView)
        barChartView.addSubview(dashedLineView)
        barChartView.addSubview(horizontalLine)

        for bar in barViews {
            barChartView.addSubview(bar)
        }
        for label in dayLabels {
            barChartView.addSubview(label)
        }

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
            barChartView.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -40),
            barChartView.heightAnchor.constraint(equalToConstant: 120),

            horizontalLine.topAnchor.constraint(equalTo: barChartView.topAnchor, constant: 50),
            horizontalLine.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor),
            horizontalLine.trailingAnchor.constraint(equalTo: barChartView.trailingAnchor),
            horizontalLine.heightAnchor.constraint(equalToConstant: 2),

            dashedLineView.topAnchor.constraint(equalTo: barChartView.topAnchor),
            dashedLineView.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor),
            dashedLineView.trailingAnchor.constraint(equalTo: barChartView.trailingAnchor),
            dashedLineView.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor),
        ])

        let barSpacing: CGFloat = 30
        for (index, bar) in barViews.enumerated() {
            NSLayoutConstraint.activate([
                bar.widthAnchor.constraint(equalToConstant: 12),
                bar.heightAnchor.constraint(equalToConstant: CGFloat(activities[index])),
                bar.bottomAnchor.constraint(equalTo: barChartView.bottomAnchor),
                bar.leadingAnchor.constraint(equalTo: barChartView.leadingAnchor, constant: CGFloat(index) * barSpacing + 20)
            ])
        }

        for (index, label) in dayLabels.enumerated() {
            NSLayoutConstraint.activate([
                label.topAnchor.constraint(equalTo: barChartView.bottomAnchor, constant: 4),
                label.centerXAnchor.constraint(equalTo: barViews[index].centerXAnchor)
            ])
        }
    }
}


