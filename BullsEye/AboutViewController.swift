//
//  AboutViewController.swift
//  BullsEye
//
//  Created by youme on 2023/02/05.
//

import SwiftUI
import WebKit

class AboutViewController: UIViewController {
    private lazy var backgroundImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "Background"))
        view.contentMode = .scaleAspectFit
        return view
    }()

    private lazy var webView: WKWebView = {
        let view = WKWebView()
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            view.load(request)
        }
        return view
    }()

    private lazy var closeButton: UIButton = {
        let view = UIButton(type: .custom)
        view.setTitle("Close", for: .normal)

        view.titleLabel?.font = UIFont(name: "Arial Rounded MT Bold", size: 20)
        view.setTitleColor(UIColor(red: 96 / 255, green: 30 / 255, blue: 0 / 255, alpha: 1), for: .normal)
        view.setTitleShadowColor(.init(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.5), for: .normal)
        view.titleLabel?.shadowOffset = .init(width: 0, height: 1)
        view.reversesTitleShadowWhenHighlighted = true

        view.setBackgroundImage(UIImage(named: "Button-Normal"), for: .normal)
        view.setBackgroundImage(UIImage(named: "Button-Highlighted"), for: .highlighted)

        view.addTarget(nil, action: #selector(touchUpInsideClose), for: .touchUpInside)
        return view
    }()

}

extension AboutViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.setupConstraints()
    }

    private func setupViews() {
        self.view.backgroundColor = .systemBackground
        [
            self.backgroundImage,
            self.webView,
            self.closeButton
        ]
        .forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview($0)
        }
    }

    private func setupConstraints() {
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            self.backgroundImage.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.backgroundImage.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            self.backgroundImage.topAnchor.constraint(equalTo: safeArea.topAnchor),
            self.backgroundImage.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            self.webView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 20),
            self.webView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20),
            self.webView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 20),
            self.webView.bottomAnchor.constraint(equalTo: self.closeButton.topAnchor, constant: -8),
            self.closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.closeButton.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20)
        ])
    }
}

extension AboutViewController {
    @objc
    func touchUpInsideClose() {
        dismiss(animated: true)
    }
}

struct AboutView: UIViewControllerRepresentable {
    func makeUIViewController(context _: Context) -> AboutViewController {
        AboutViewController()

    }

    func updateUIViewController(_: AboutViewController, context _: Context) {}
}

struct AboutViewController_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
