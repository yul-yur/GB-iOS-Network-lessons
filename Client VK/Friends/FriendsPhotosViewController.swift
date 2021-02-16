//
//  FriendsPhotosViewController.swift
//  Client VK
//
//

import UIKit

class FriendsPhotosViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let recognizer = UIPanGestureRecognizer(target: self, action: #selector(onPan))
        view.addGestureRecognizer(recognizer)
        
        photoCurent.image = allPhotos[countCurentPhoto]
    }
    
    @IBOutlet weak var photoCurent: UIImageView!
    
    var allPhotos:[UIImage?] = []
    var countCurentPhoto = 0
    
    
    // MARK: - Animator
    var interactiveAnimator: UIViewPropertyAnimator!
    
    @objc func onPan(_ recognizer: UIPanGestureRecognizer) {
        
        switch recognizer.state {
        case .began:
            interactiveAnimator?.startAnimation()
            interactiveAnimator = UIViewPropertyAnimator(
                duration: 0.5,
                curve: .easeInOut,
                animations: {
                    self.photoCurent.alpha = 0.5
                    self.photoCurent.transform = .init(scaleX: 1.5, y: 1.5)
            })
            interactiveAnimator.pauseAnimation()
            
        case .changed:
            let translation = recognizer.translation(in: self.view)
            interactiveAnimator.fractionComplete = abs(translation.x / 100)
            self.photoCurent.transform = CGAffineTransform(translationX: translation.x, y: 0)
            
        case .ended:
            interactiveAnimator.stopAnimation(true)
            if recognizer.translation(in: self.view).x < 0 { // проверка в какую сторону движется палец (лево/право)
                if  countCurentPhoto < allPhotos.count - 1  { // проверка, что фотка будет в массиве и не делать счетчик больше
                    self.countCurentPhoto += 1
                }
            } else {
                if countCurentPhoto != 0 {  // проверка, что фотка будет в массиве и не делать счетчик меньше
                    self.countCurentPhoto -= 1
                }
            }
            interactiveAnimator.addAnimations {
                self.photoCurent.transform = .identity
                self.photoCurent.alpha = 1
            }
            interactiveAnimator?.startAnimation()
            
        default: break
        }
        photoCurent.image = allPhotos[countCurentPhoto]
        
    }
    
    
}
