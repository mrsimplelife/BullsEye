//
//  ViewController.swift
//  BullsEye
//
//  Created by youme on 2023/02/05.
//

import SwiftUI

class ViewController: UIViewController {

    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Background"))
        view.contentMode = .scaleAspectFill
        return view
    }()

    private lazy var inView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var titleView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [titleTextLabel, titleNumberLabel])
        view.spacing = 8
        return view
    }()

    private lazy var titleTextLabel: UILabel = {
        let view = UILabel()
        view.text = "Put the Bull's Eye as close as you can to:"
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: 1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var titleNumberLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: -1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var oneLabel: UILabel = {
        let view = UILabel()
        view.text = "1"
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: -1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var hundredLabel: UILabel = {
        let view = UILabel()
        view.text = "100"
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: -1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var bottomLabel: UIStackView = {
        let view = UIStackView(arrangedSubviews: [scoreLabel, roundLabel])
        view.spacing = 80
        return view
    }()

    private lazy var scoreLabel: UIStackView = {
        let view = UIStackView(arrangedSubviews: [scoreTextLabel, scoreNumberLabel])
        view.spacing = 6
        return view
    }()

    private lazy var scoreTextLabel: UILabel = {
        let view = UILabel()
        view.text = "Score:"
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: 1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var scoreNumberLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: -1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var roundLabel: UIStackView = {
        let view = UIStackView(arrangedSubviews: [roundTextLabel, roundNumberLabel])
        view.spacing = 6
        return view
    }()

    private lazy var roundTextLabel: UILabel = {
        let view = UILabel()
        view.text = "Round:"
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: 1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 16)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var roundNumberLabel: UILabel = {
        let view = UILabel()
        view.textColor = .white
        view.shadowColor = .init(red: 0, green: 0, blue: 0, alpha: 0.5)
        view.shadowOffset = .init(width: 0, height: -1)
        view.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        view.adjustsFontSizeToFitWidth = false
        return view
    }()

    private lazy var slider: UISlider = {
        let view = UISlider()
        view.minimumValue = 0
        view.maximumValue = 100

        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        view.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        view.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        view.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        view.setMaximumTrackImage(trackRightResizable, for: .normal)

        view.addTarget(nil, action: #selector(self.valueChangedSlider(_:)), for: .valueChanged)
        return view
    }()

    private lazy var hitMeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Hit Me!", for: .normal)

        view.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        view.setTitleColor(UIColor(red: 96 / 255, green: 30 / 255, blue: 0 / 255, alpha: 1), for: .normal)
        view.setTitleShadowColor(.init(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.5), for: .normal)
        view.titleLabel?.shadowOffset = .init(width: 0, height: 1)
        view.reversesTitleShadowWhenHighlighted = true

        view.setBackgroundImage(UIImage(named: "Button-Normal"), for: .normal)
        view.setBackgroundImage(UIImage(named: "Button-Highlighted"), for: .highlighted)

        view.addTarget(nil, action: #selector(self.touchUpInsideHitMeButton), for: .touchUpInside)
        return view
    }()

    private lazy var startNewGameButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "StartOverIcon"), for: .normal)
        view.setBackgroundImage(UIImage(named: "SmallButton"), for: .normal)
        view.addTarget(nil, action: #selector(self.touchUpInsideStartNewGameButton), for: .touchUpInside)
        return view
    }()

    private lazy var showInfoButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setImage(UIImage(named: "InfoButton"), for: .normal)
        view.setBackgroundImage(UIImage(named: "SmallButton"), for: .normal)
        view.addTarget(nil, action: #selector(self.touchUpInsideShowInfoButton), for: .touchUpInside)
        return view
    }()

    private var currentValue = 0
    private var targetValue = 0
    private var score = 0
    private var round = 0

}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupConstraints()
        self.startNewGame()
    }

    private func setupViews() {
        [
            self.backgroundImage,
            self.inView
        ]
        .forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
        [
            self.titleView,
            self.oneLabel,
            self.hundredLabel,
            self.bottomLabel,

            self.slider,
            self.hitMeButton,
            self.startNewGameButton,
            self.showInfoButton
        ]
        .forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.inView.addSubview($0)
        }

    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            self.backgroundImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.backgroundImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.backgroundImage.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            self.inView.widthAnchor.constraint(equalToConstant: 667),
            self.inView.heightAnchor.constraint(equalToConstant: 359),
            self.inView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.inView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),

            self.titleView.centerXAnchor.constraint(equalTo: self.inView.centerXAnchor),
            self.titleView.topAnchor.constraint(equalTo: self.inView.topAnchor, constant: 20),

            self.oneLabel.leadingAnchor.constraint(equalTo: self.inView.leadingAnchor),
            self.oneLabel.trailingAnchor.constraint(equalTo: self.slider.leadingAnchor, constant: -8),
            self.oneLabel.centerYAnchor.constraint(equalTo: self.slider.centerYAnchor),
            self.hundredLabel.trailingAnchor.constraint(equalTo: self.inView.trailingAnchor),

            self.bottomLabel.centerXAnchor.constraint(equalTo: self.inView.centerXAnchor),
            self.bottomLabel.centerYAnchor.constraint(equalTo: self.startNewGameButton.centerYAnchor),

            self.slider.trailingAnchor.constraint(equalTo: self.hundredLabel.leadingAnchor),
            self.slider.centerYAnchor.constraint(equalTo: self.hundredLabel.centerYAnchor),
            self.slider.bottomAnchor.constraint(equalTo: self.hitMeButton.topAnchor, constant: -50),

            self.hitMeButton.bottomAnchor.constraint(equalTo: self.bottomLabel.topAnchor, constant: -80),
            self.hitMeButton.centerXAnchor.constraint(equalTo: self.inView.centerXAnchor),

            self.startNewGameButton.leadingAnchor.constraint(equalTo: self.inView.leadingAnchor),
            self.startNewGameButton.bottomAnchor.constraint(equalTo: self.inView.bottomAnchor),
            self.startNewGameButton.centerYAnchor.constraint(equalTo: self.showInfoButton.centerYAnchor),

            self.showInfoButton.trailingAnchor.constraint(equalTo: self.inView.trailingAnchor),
            self.showInfoButton.bottomAnchor.constraint(equalTo: self.inView.bottomAnchor)
        ])
    }

}

extension ViewController {
    private func startNewGame() {
        self.score = 0
        self.round = 0
        self.startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        self.view.layer.add(transition, forKey: nil)
    }

    private func startNewRound() {
        self.round += 1
        self.targetValue = Int.random(in: 1 ... 100)
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.updateLabels()
    }

    private func updateLabels() {
        self.titleNumberLabel.text = String(self.targetValue)
        self.scoreNumberLabel.text = String(self.score)
        self.roundNumberLabel.text = String(self.round)
    }
}

extension ViewController {
    @objc
    private func valueChangedSlider(_ slider: UISlider) {
        self.currentValue = lroundf(slider.value)
    }

    @objc
    private func touchUpInsideHitMeButton() {
        let difference = abs(self.targetValue - self.currentValue)
        var points = 100 - difference

        let title: String
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        self.score += points

        let message = "You scored \(points) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { _ in self.startNewRound() }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @objc
    private func touchUpInsideStartNewGameButton() {
        self.startNewGame()
    }

    @objc
    private func touchUpInsideShowInfoButton() {
        let vc = AboutViewController()
        vc.modalTransitionStyle = .flipHorizontal
        self.present(vc, animated: true)
    }
}

struct MainView: UIViewControllerRepresentable {
    func makeUIViewController(context _: Context) -> ViewController {
        ViewController()
    }

    func updateUIViewController(_: ViewController, context _: Context) {}
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
