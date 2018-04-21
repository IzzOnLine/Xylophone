import UIKit
import AVFoundation

class ViewController: UIViewController{
    
    // AVAudioPlayer object
    var player: AVAudioPlayer?
    
    let noteArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"];

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        // reference to a wave sound location
        let url = Bundle.main.url(forResource: noteArray[sender.tag], withExtension: "wav")
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url!, fileTypeHint: AVFileType.wav.rawValue)

            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
}

