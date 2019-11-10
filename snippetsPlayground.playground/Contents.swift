import UIKit

class ViewController: UIViewController {

    var counter = 0
    var timer = Timer()
    var currentTime:Int?

    // start timer
    @IBAction func startTimerButtonTapped(sender: UIButton) {
        
        timer.invalidate() // just in case this button is tapped multiple times
        // start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }

    // called every time interval from the timer
    @objc func timerAction() {
        counter += 1
        currentTime = counter
        print(currentTime!)
    }
    
    
    
    // stop timer
     @IBAction func cancelTimerButtonTapped(sender: UIButton) {
        // stop timer
        timer.invalidate()
     }
}
