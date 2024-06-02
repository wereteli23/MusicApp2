//
//  albumViewController.swift
//  MusicApp2
//
//  Created by lukga dekanadze on 18.05.24.
//

import UIKit

class albumViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tables: UITableView!
    var albumMusic = [Song1]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAlbum()
        tables.delegate = self
        tables.dataSource = self
    }
    
    func configureAlbum() {
        albumMusic.append(Song1(albumName: "Blonde", Albumcover: "cover1"))
        albumMusic.append(Song1(albumName: "Damn", Albumcover: "cover2"))
        albumMusic.append(Song1(albumName: "432hz", Albumcover: "cover3"))
        albumMusic.append(Song1(albumName: "Blonde", Albumcover: "cover1"))
        albumMusic.append(Song1(albumName: "Damn", Albumcover: "cover2"))
        albumMusic.append(Song1(albumName: "432hz", Albumcover: "cover3"))
        albumMusic.append(Song1(albumName: "Blonde", Albumcover: "cover1"))
        albumMusic.append(Song1(albumName: "Damn", Albumcover: "cover2"))
        albumMusic.append(Song1(albumName: "432hz", Albumcover: "cover3"))

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumMusic.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 =  tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
        let songs =  albumMusic[indexPath.row]
        cell1.textLabel?.textAlignment = .left
        cell1.textLabel?.text = songs.albumName
        cell1.imageView?.image  = UIImage(named: songs.Albumcover)
        cell1.textLabel?.font = UIFont(name: "sHelvetica-Bold", size: 18)
        cell1.accessoryType = .disclosureIndicator
        return cell1

        //cell.imageView?.image = UIImage(named: song.imageName  )
        //cell.detailTextLabel?.text = song.albumName

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 100
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        tableView.deselectRow(at: indexPath, animated: true)
        _ = indexPath.row
        //let position1 = indexPath.row

        guard let albumNextPage = storyboard?.instantiateViewController(withIdentifier: "album1") as? albumNextPageViewController else { return }
        navigationController?.pushViewController(albumNextPage, animated: true)    }
    

}
struct Song1 {
    let albumName: String
    let Albumcover: String
}
