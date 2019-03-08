//
//  ViewController.swift
//  BluetoothApp
//
//  Created by Alan Sax on 3/7/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit
import CoreBluetooth

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CBCentralManagerDelegate {
    
    var centralManager: CBCentralManager?
    var names: [String] = []
    var RSSIs: [NSNumber] = []
    var timer: Timer?
    
    @IBOutlet weak var tableview: UITableView!
    
    @IBAction func handleRefresh(_ sender: Any) {
        startTimer()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    // MARK: BLUETOOTH
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true, block: { (timer) in
            self.startScan()
        })
    }
    
    func startScan() {
        names = []
        RSSIs = []
        tableview.reloadData()
        centralManager?.stopScan() 
        centralManager?.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        RSSIs.append(RSSI)
        names.append(peripheral.name ?? peripheral.identifier.uuidString)
        
        tableview.reloadData()
        
        print("NAME: \(peripheral.name ?? "No Name Specified")")
        print("UUID: \(peripheral.identifier.uuidString)")
        print("RSSI", RSSI)
        print("AD DATA: \(advertisementData) ")
        
        print("***********************")
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
        if central.state == .poweredOn {
            // working
            self.startScan()
            startTimer()
        } else {
            // not working
            let alertVC = UIAlertController(title: "Bluetooth is not working", message: "Make sure your bluetooth is on and ready to rock and roll", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
                alertVC.dismiss(animated: true, completion: nil)
            })
            
            alertVC.addAction(okAction)
            present(alertVC, animated: true, completion: nil)
        }
        
        
    }
    
    // MARK: TABLEVIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BluetoothDeviceCell
        cell.nameLabel.text = names[indexPath.item]
        cell.rssiLabel.text = "RSSI: \(RSSIs[indexPath.item]))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    
}

