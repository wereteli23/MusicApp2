//
//  playerViewController.swift
//  MusicApp2
//
//  Created by lukga dekanadze on 13.05.24.
//
import AVFoundation
import UIKit

class playerViewController: UIViewController {
    public var position: Int = 0
    public var songs: [Song] = []
    @IBOutlet weak var holder: UIView!
    var player: AVAudioPlayer?
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode  = .scaleAspectFill
        return imageView
    }()
    private let songNameLabel: UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let artistNameLabel: UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    private let albumNameLabel: UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    override func viewDidLayoutSubviews() {
          super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }
    func configure() {
         let song = songs[position]
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        do{
           try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive( true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString   else {
                print("urlstring is nill")
                return  }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            guard let player = player  else { 
               print("player is nill")
                return}
            player.volume = 0.5
            
            player.play()
            
        }
            
        catch{
            print("erro occurred")
        }
        
        albumImageView.frame  = CGRect(x: 10, y: 10, width: holder.frame.size.width-20, height: holder.frame.size.width-20 )
        albumImageView.image = UIImage(named:   song.imageName)
        holder.addSubview(albumImageView )
        holder.addSubview(songNameLabel)
        holder.addSubview(albumNameLabel)
        holder.addSubview(artistNameLabel)
        songNameLabel.frame  = CGRect(x: 10, y: albumImageView.frame.size.height + 10, width: holder.frame.size.width-20, height: 70 )
        albumNameLabel.frame  = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 70, width: holder.frame.size.width-20 , height: 70 )
        artistNameLabel.frame  = CGRect(x: 10, y: albumImageView.frame.size.height + 10 + 140, width: holder.frame.size.width-20, height: 70 )
        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName
        let slider = UISlider(frame:  CGRect(x: 20, y: holder.frame.size.height-60 , width: holder.frame.size.width-40, height: 50 ))
        slider.value  = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_: )), for: .valueChanged)
        holder.addSubview(slider)
        
    }
    @objc func didSlideSlider(_ slider: UISlider) {
         let value = slider.value
        player?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
}
