//
//  ViewController.swift
//  ActivityIndicator
//
//  Created by Гранченко Максим on 9/25/18.
//  Copyright © 2018 Гранченко Максим. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var visualEffectView: UIView?
    var attachedImage: UIImageView!
    
    //Usage
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Begin of code")
        if let url = URL(string: "https://vignette.wikia.nocookie.net/fantendo/images/6/6e/Small-mario.png/revision/latest?cb=2012071802411") {
            imageView.contentMode = .scaleAspectFit
            downloadImage(from: url)
        }
        
        print("End of code. The image will continue downloading in the background and it will be loaded when it ends.")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "QuickActions_Share"), style: .done, target: self, action: #selector(handlerRightButton))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(handlerLeftButton))
    }
    
    @objc func handlerRightButton() {
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
    
    @objc func handlerLeftButton() {
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
                self.handlerRightButton()
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
