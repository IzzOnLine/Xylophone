import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate{
    
    // AVAudioPlayer object
    var player: AVAudioPlayer!
    
    let noteArray = ["note1", "note2", "note3", "note4", "note5", "note6", "note7"];
    var selectedSound : String = "";

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func notePressed(_ sender: UIButton) {
        selectedSound = noteArray[sender.tag];
        playSound()
    }
    
    func playSound(){
        // reference to a wave sound location
        let soundUrl = Bundle.main.url(forResource: selectedSound, withExtension: "wav")
        
        do {
            player = try AVAudioPlayer(contentsOf: soundUrl!)
        } catch {
            print(error)
        }
        
        player.play()
    }
    
}

