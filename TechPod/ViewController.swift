//
//  ViewController.swift
//  TechPod
//
//  Created by 高橋　龍 on 2021/08/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet var table: UITableView!
    
    //なんの()なんだ？
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        table.dataSource = self
        
        table.delegate = self
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア","コナンメインテーマ"]
        
        fileNameArray = ["cannon", "elise", "aria","conan_maintheme"]
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg", "conan.jpg"]
    }
    
    //cellの数を指定する
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
        //セルの数＝Arrayの数に合わせて設定
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ID付きのセルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //textLabelにテストと表示させる
//        cell?.textLabel?.text = "テスト"
        //indexPath＝何列目なのか
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        //空のcellをreturn?
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルの設定（音楽ファイルがあるパスの取得）
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備(audioPlayerに音楽のファイルパスを渡す)
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
        
    }


}

