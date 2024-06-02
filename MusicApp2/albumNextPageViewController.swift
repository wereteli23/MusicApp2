//
//  albumNextPageViewController.swift
//  MusicApp2
//
//  Created by lukga dekanadze on 18.05.24.
//

import UIKit

class albumNextPageViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
  
    
    @IBOutlet weak var table1: UITableView!
    var songss = [Song2]()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongsw()
        table1.delegate = self
        table1.dataSource = self
    }
    func configureSongsw() {
        
         songss.append(Song2(name: "pink and white", albumName: "Blonde", artistName: "Frank Ocean", imageName: "cover1", trackName: "song1"))
         songss.append(Song2(name: "PRIDE", albumName: "Damn", artistName: "Kendrick Lamar", imageName: "cover3", trackName: "song2"))
         songss.append(Song2(name: "Location", albumName: "Playboy Carti", artistName: "432hz", imageName: "cover2", trackName: "song3"))
         songss.append(Song2(name: "pink and white", albumName: "Blonde", artistName: "Frank Ocean", imageName: "cover1", trackName: "song1"))
         songss.append(Song2(name: "PRIDE", albumName: "Damn", artistName: "Kendrick Lamar", imageName: "cover3", trackName: "song2"))
         songss.append(Song2(name: "Location", albumName: "Playboy Carti", artistName: "432hz", imageName: "cover2", trackName: "song2"))
         songss.append(Song2(name: "pink and white", albumName: "Blonde", artistName: "Frank Ocean", imageName: "cover1", trackName: "song1"))
         songss.append(Song2(name: "PRIDE", albumName: "Damn", artistName: "Kendrick Lamar", imageName: "cover3", trackName: "song3"))
         songss.append(Song2(name: "Location", albumName: "Playboy Carti", artistName: "432hz", imageName: "cover2", trackName: "song3"))
         }
         
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return songss.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let  cells = tableView.dequeueReusableCell(withIdentifier:  "cells", for: indexPath  )
            let song = songss[indexPath.row]
            cells.textLabel?.text = song.name
            cells.detailTextLabel?.text = song.albumName
            cells.imageView?.image = UIImage(named: song.imageName  )
            cells.textLabel?.font = UIFont(name: "sHelvetica-Bold", size: 18 )
            cells.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17  )
            cells.accessoryType = .disclosureIndicator
            return cells
        }
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 100
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
            tableView.deselectRow(at: indexPath, animated: true  )
            let position = indexPath.row
            guard let vc =  storyboard?.instantiateViewController(identifier: "players") as? secondPlayerViewController else { return }
            //vc.songs = songs
            vc.position = position
            present(vc, animated: true)
            ///avigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    struct Song2 {
        let name : String
        let albumName : String
        let artistName : String
        let imageName: String
        let trackName: String
    }
    
    

