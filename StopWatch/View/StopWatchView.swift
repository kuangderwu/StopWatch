//
//  StopWatchView.swift
//  StopWatch
//
//  Created by apple on 2018/10/9.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class StopWatchView: UIView {

    var resetButton: UIButton!
    var pauseButton: UIButton!
    var startButton: UIButton!
    var timerLabel: UILabel!
    var logoLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        
        self.backgroundColor = UIColor(red: 40/255, green: 43/255, blue: 52/255, alpha: 1.0)
        
        resetButton = {
            let button = UIButton(type: UIButton.ButtonType.system)
            button.layer.cornerRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 4
            button.layer.shadowOffset = CGSize(width: 4, height: 2)
            button.setTitle("Reset", for: UIControl.State.normal)
            button.setTitleColor(UIColor.black, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        pauseButton = {
            let button = UIButton(type: UIButton.ButtonType.system)
            button.layer.cornerRadius = 64
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 4
            button.layer.shadowOffset = CGSize(width: 4, height: 2)
            button.setTitle("Pause", for: UIControl.State.normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.setTitleColor(UIColor.black, for: UIControl.State.normal)
            button.backgroundColor = UIColor.white
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        startButton = {
            let button = UIButton(type: UIButton.ButtonType.system)
            button.layer.cornerRadius = 64
            button.layer.shadowColor = UIColor.black.cgColor
            button.layer.shadowOpacity = 4
            button.layer.shadowOffset = CGSize(width: 4, height: 2)
            button.setTitle("Start", for: UIControl.State.normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
            button.setTitleColor(UIColor.white, for: UIControl.State.normal)
            button.backgroundColor = UIColor(red: 225/255, green: 59/255, blue: 68/255, alpha: 1.0)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        timerLabel = {
            let label = UILabel()
            label.backgroundColor = #colorLiteral(red: 0.448931371, green: 0.448931371, blue: 0.448931371, alpha: 0.7508527729)
            label.layer.cornerRadius = 5
            label.layer.masksToBounds = true
            label.textColor = UIColor.yellow
            label.text = "00:00:00.0"
            label.font = UIFont.boldSystemFont(ofSize: 60)
            label.adjustsFontSizeToFitWidth = true
            label.textAlignment = .left
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        logoLabel = {
            let label = UILabel()
            label.backgroundColor = UIColor.clear
            label.textColor = UIColor.gray
            label.text = "@KuangTeam"
            label.textAlignment = .center
            label.font = UIFont.systemFont(ofSize: 16)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        self.addSubview(resetButton)
        self.addSubview(pauseButton)
        self.addSubview(startButton)
        self.addSubview(timerLabel)
        self.addSubview(logoLabel)
        
        NSLayoutConstraint.activate([
            resetButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 32),
            resetButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            resetButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.2),
            resetButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            timerLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor),
            timerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9),
            timerLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.2)
            ])
        
        NSLayoutConstraint.activate([
            pauseButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 32),
            pauseButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant:16),
            pauseButton.widthAnchor.constraint(equalToConstant: 128),
            pauseButton.heightAnchor.constraint(equalToConstant: 128)
            ])
        
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 32),
            startButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            startButton.widthAnchor.constraint(equalToConstant: 128),
            startButton.heightAnchor.constraint(equalToConstant: 128)
            ])
        
        NSLayoutConstraint.activate([
            logoLabel.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            logoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            logoLabel.heightAnchor.constraint(equalToConstant: 20),
            logoLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.6)
            
            ])
    }
    
}
