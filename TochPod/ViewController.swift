//
//  ViewController.swift
//  TochPod
//
//  Created by 石森愛海 on 2015/12/11.
//  Copyright © 2015年 石森愛海. All rights reserved.
//


import UIKit
import AVFoundation

//TableViewのデータそーすメソッドとデリゲートメソッドを使う為の『プルトコル宣言』を行う

class ViewController: UIViewController , UITableViewDataSource  , UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    
    //曲名を入れる為の配列
    var songNameArray = [String]()
    
    //曲のファイル名を入れる為の配列
    var fileNameArray = [String]()
    
    //音楽家の画像を入れる為の配列
    var imageNameArray = [String]()
    
    //音楽を再生させる為の変数
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //テーブルビューのデータソースメソッドはviewControllerクラスに書く、と言う設定
        table.dataSource = self
        
        //UITableViewが持っているデリゲートメソッドの処理の委託先をviewcontroller.swiftに設定
        table.delegate = self
        
        //songNameArrayに曲名を入れていく
        songNameArray = ["Part of your World","輝く未来","くまのプーさん","A Whole New World","コンパス　オブ　ユア　ハート","Under the Sea","星に願いを","生まれて初めて","扉開けて","Let It Go"]
        
        //filenamearrayに曲のファイルを入れていく
        fileNameArray = ["Part of your World (japanese Version) ??????????????","輝く未来"
            ,"くまのプーさん","アラジン","?????????????????????????","Under the Sea ","ピノキオ","生まれて初めて","扉開けて","レリゴー"]
        
        //imagearrayに音楽家の画像を入れていく
        imageNameArray =  ["ariel.jpg","lapunzel.jpg","pooh.jpg","aladdin.jpg","チャンドゥ.jpg","Ariel2.jpg","pinokio.jpg","アナ雪.jpg","扉開けて.jpg","エルサ.jpg"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //セルの数を指定
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextLabelに「テスト」と表示させてみる
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell!
        
        cell.textLabel!.text = songNameArray[indexPath.row]
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])//音楽家の画像をcellに表示
        return cell
    }
    
    //セルが押されたときに呼ばれるデリゲートメソッド
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
     //   var cell = tableView.cellForRowAtIndexPath(indexPath) as! TableViewCell
     //   cell.checkbox_image.image = UIImage(named:"checkbox_on")
        NSLog("%@がえらばれた", songNameArray[indexPath.row])
        print(indexPath.row)
       // cell.accessoryType = UITableViewCellAccessoryCheckmark;

        
        //音楽ファイルの設定
        let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileNameArray[indexPath.row], ofType: "mp3")!)
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOfURL: audioPath)
        
        //音楽を再生
        audioPlayer.play()
        
        
    }
    
   // let audioPath2
    
    @IBAction func stop(){
        if audioPlayer.playing == true{
            audioPlayer.stop()
        }
    }
    
    
    @IBAction func start(){
        if audioPlayer.playing == false{
           audioPlayer.play()
        }
    
    }
    
    @IBAction func back(){

}

}