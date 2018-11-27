//
//  SecondViewController.swift
//  ActivityIndicator
//
//  Created by Гранченко Максим on 11/26/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    let dissmisButton = UIButton()
    let imageView = UIImageView(image: UIImage(named: "cat"))
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        createImageConstraints()
        createDissmisConstraints()
        createTitleConstant()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func createImageConstraints() {
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        view.addSubview(imageView)
    }
    
    func createDissmisConstraints() {
        dissmisButton.frame = CGRect(x: 0, y: 0, width: 0, height: 35)
        dissmisButton.setTitle("Dissmis", for: .normal)
        dissmisButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 25)
        dissmisButton.translatesAutoresizingMaskIntoConstraints = false
        dissmisButton.setTitleColor(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), for: .normal)
        dissmisButton.layer.cornerRadius = 17.5
        dissmisButton.layer.borderWidth = 1
        dissmisButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        dissmisButton.addTarget(self, action: #selector(handleTargerButton), for: .touchUpInside)
        view.addSubview(dissmisButton)
        
        dissmisButton.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        dissmisButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        dissmisButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15).isActive = true
        dissmisButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
    
    func createTitleConstant() {
        titleLabel.text = "Created by Гранченко Максим on 9/25/18. End of code. The image will continue downloading in the background and it will be loaded when it ends."
        titleLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 200).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    @objc func handleTargerButton() {
        dismiss(animated: false, completion: nil)
    }
    
    
    
}
