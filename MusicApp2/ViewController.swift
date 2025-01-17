//
//  ViewController.swift
//  MusicApp2
//
//  Created by lukga dekanadze on 13.05.24.
//

import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var table: UITableView!
    var songs = [Song]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    func configureSongs() {

        songs.append(Song(name: "pink and white", albumName: "Blonde", artistName: "Frank Ocean", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "PRIDE", albumName: "Damn", artistName: "Kendrick Lamar", imageName: "cover3", trackName: "song2"))
        songs.append(Song(name: "Location", albumName: "Playboy Carti", artistName: "432hz", imageName: "cover2", trackName: "song3"))
        songs.append(Song(name: "pink and white", albumName: "Blonde", artistName: "Frank Ocean", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "PRIDE", albumName: "Damn", artistName: "Kendrick Lamar", imageName: "cover3", trackName: "song2"))
        songs.append(Song(name: "Location", albumName: "Playboy Carti", artistName: "432hz", imageName: "cover2", trackName: "song2"))
        songs.append(Song(name: "pink and white", albumName: "Blonde", artistName: "Frank Ocean", imageName: "cover1", trackName: "song1"))
        songs.append(Song(name: "PRIDE", albumName: "Damn", artistName: "Kendrick Lamar", imageName: "cover3", trackName: "song3"))
        songs.append(Song(name: "Location", albumName: "Playboy Carti", artistName: "432hz", imageName: "cover2", trackName: "song3"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier:  "cell", for: indexPath  )
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName  )
        cell.textLabel?.font = UIFont(name: "sHelvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17  )
        cell.detailTextLabel?.textColor = UIColor(.primary)
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
    }
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        tableView.deselectRow(at: indexPath, animated: true  )
      let position = indexPath.row
      guard let vc =  storyboard?.instantiateViewController(identifier: "player") as? playerViewController else { return }
       vc.songs = songs
       vc.position = position
      present(vc, animated: true)
      // navigationController?.pushViewController(vc, animated: true)

    }
}
 
struct Song {
    let name : String
    let albumName : String
    let artistName : String
    let imageName: String
    let trackName: String
}

