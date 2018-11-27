//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Гранченко Максим on 9/25/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var panGesture: UIPanGestureRecognizer!
    
    var visualEffectView: UIView?
    var attachedImage: UIImageView!
    let label = UILabel()
    let pressendButton = UIButton(type: .system)
    var ressetButton = UIButton(type: .system)
    
    
    //Usage
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(label)
        
        print("Begin of code")
        if let url = URL(string: "https://vignette.wikia.nocookie.net/fantendo/images/6/6e/Small-mario.png/revision/latest?cb=2012071802411") {
            imageView.contentMode = .scaleAspectFit
            downloadImage(from: url)
        }
        
        createPressedButton()
        createRessetButton()
        
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
        
        let shareRightButton = UIBarButtonItem(image: #imageLiteral(resourceName: "QuickActions_Share"), style: .done, target: self, action: #selector(handleShareButton))
        shareRightButton.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let cloudRigthButton = UIBarButtonItem(image: #imageLiteral(resourceName: "QuickActions_Cloud"), style: .done, target: self, action: #selector(handleCloudButton))
        cloudRigthButton.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        let addedItemButton = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(handleAddButton))
        addedItemButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        let customButton = UIBarButtonItem(image: #imageLiteral(resourceName: "TabBar_More"), style: .done, target: self, action: #selector(handleLabelButton))
        customButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        
        navigationItem.leftBarButtonItems = [addedItemButton, customButton]
        navigationItem.rightBarButtonItems = [shareRightButton, cloudRigthButton]
    }
    
    @objc func handleLabelButton() {
        label.text = "The image will continue downloading in the background"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        label.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 10).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
    
    @objc func handleCloudButton() {
        let imageView = LOTAnimationView(name: "stopwatch.json")
        imageView.play()
        imageView.loopAnimation = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    @objc func handleShareButton() {
        setupIsBlurred(isBlurred: true)
        let imageView = UIImageView(frame: CGRect(x: 120, y: 10, width: 40, height: 40))
        let alertMessage = UIAlertController(title: "New image", message: "Download Finished.", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
            self.setupIsBlurred(isBlurred: false)
        })
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        action.setValue(#imageLiteral(resourceName: "more"), forKey: "image")
        cancel.setValue(#imageLiteral(resourceName: "star"), forKey: "image")
        alertMessage.view.tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        alertMessage.addAction(action)
        alertMessage.addAction(cancel)
        alertMessage.view.addSubview(imageView)
        
        self.present(alertMessage, animated: true, completion: nil)
    }
    
    @objc func handleAddButton() {
        let alrt = UIAlertController(title: "Created by Гранченко Максим on 9/25/18.", message: "End of code. The image will continue downloading in the background and it will be loaded when it ends.", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Dismiss", style: .cancel)
        
        alrt.addAction(cancel)
        let subview = (alrt.view.subviews.first?.subviews.first?.subviews.first)! as UIView
        subview.tintColor = #colorLiteral(red: 0.4392156899, green: 0.01176470611, blue: 0.1921568662, alpha: 1)
        alrt.view.tintColor = UIColor.black
        let imageView = UIImageView(frame: CGRect(x: 120, y: 5, width: 40, height: 40))
        imageView.image = UIImage(named: "star")
        alrt.view.addSubview(imageView)
        self.present(alrt, animated: true, completion: nil)
    }
    
    @objc func handlePressedButton() {
        let secondVC = SecondViewController()
        present(secondVC, animated: false, completion: nil)
    }
    
    @objc func handlerRessetButton() {
        
        
        
    }
        
        func createPressedButton() {
            pressendButton.setTitle("ClickMe", for: .normal)
            pressendButton.setTitle("TouchMe", for: .highlighted)
            pressendButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            pressendButton.layer.cornerRadius = 15
            pressendButton.layer.borderWidth = 1
            pressendButton.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            pressendButton.clipsToBounds = true
            pressendButton.translatesAutoresizingMaskIntoConstraints = false
            pressendButton.addTarget(self, action: #selector(handlePressedButton), for: .touchUpInside)
            view.addSubview(pressendButton)
            
            pressendButton.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
            pressendButton.heightAnchor.constraint(equalTo: label.heightAnchor, multiplier: 1).isActive = true
            pressendButton.leftAnchor.constraint(equalTo: label.rightAnchor, constant: 5).isActive = true
            pressendButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        }
        
        func createRessetButton() {
            ressetButton.setTitle("Resset", for: .normal)
            ressetButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
            ressetButton.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            ressetButton.layer.cornerRadius = 15
            ressetButton.layer.borderWidth = 1
            ressetButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            ressetButton.clipsToBounds = true
            ressetButton.translatesAutoresizingMaskIntoConstraints = false
            ressetButton.addTarget(self, action: #selector(handlerRessetButton), for: .touchUpInside)
            view.addSubview(ressetButton)
            
            ressetButton.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
            ressetButton.heightAnchor.constraint(equalTo: label.heightAnchor, multiplier: 1).isActive = true
            ressetButton.rightAnchor.constraint(equalTo: label.leftAnchor, constant: -5).isActive = true
            ressetButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        }
        
        func setupIsBlurred(isBlurred: Bool) {
            if isBlurred {
                if self.visualEffectView == nil {
                    let blurEffect = UIBlurEffect(style: .light)
                    let visualEffectView = UIVisualEffectView(effect: blurEffect)
                    
                    visualEffectView.frame = view.bounds
                    view.addSubview(visualEffectView)
                    self.visualEffectView = visualEffectView
                }
            } else {
                visualEffectView?.removeFromSuperview()
                visualEffectView = nil
            }
        }
        
        func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
        
        //Create a method to download the image (start the tasks
        func downloadImage(from url: URL) {
            print("Download Started")
            getData(from: url) { data, response, error in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() {
                    self.setupIsBlurred(isBlurred: true)
                    self.handleShareButton()
                    self.activityIndicator.stopAnimating()
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    //Extension:
    extension UIImageView {
        func downloaded(from url: URL, contentMode mode: UIViewContentMode = .scaleAspectFit) {
            contentMode = mode
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard
                    let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                    let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                    let data = data, error == nil,
                    let image = UIImage(data: data)
                    else { return }
                DispatchQueue.main.async() {
                    self.image = image
                }
                }.resume()
        }
        func downloaded(from link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
            guard let url = URL(string: link) else { return }
            downloaded(from: url, contentMode: mode)
        }
}
