//
//  ContentView.swift
//  DermaVigil SwiftUI
//
//  Created by Arhub Dulal on 1/1/20.
//  Copyright © 2020 BelleT. All rights reserved.
//

import SwiftUI
import CoreBluetooth
import Combine

class BluetoothController: NSObject, ObservableObject, CBPeripheralDelegate, CBCentralManagerDelegate {
    @Published var statusLabel = ""
    @Published var impedanceLabel = ""
    @Published var radianceLabel = ""
    @Published var uvaLabel = ""
    @Published var uvbLabel = ""

    
    let led0ServiceUUID = CBUUID(string: "0x1110")
    let impedanceCharacteristicUUID = CBUUID(string: "0x1111")
    let radianceCharacteristicUUID = CBUUID(string: "0x1112")
    
    let buttonServiceUUID = CBUUID(string: "0x1120")
    let uvaCharacteristicUUID = CBUUID(string: "0x1121")
    let uvbCharacteristicUUID = CBUUID(string: "0x1122")
    
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    
    func startCentralManager() {
        self.centralManager = CBCentralManager(delegate: self, queue: nil)
        print("Central Manager State: \(self.centralManager.state)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.centralManagerDidUpdateState(self.centralManager)
        }
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {

        if central.state == CBManagerState.poweredOn{

            //Scan for peripherals if BLE is turned on
            central.scanForPeripherals(withServices: [led0ServiceUUID], options: nil)
            central.scanForPeripherals(withServices: [buttonServiceUUID], options: nil)
            statusLabel = "Searching for BLE Devices"
        }
        else{
            print("Bluetooth switched off or not initialized")
        }
    }
    
    //Check out the discovered peripherals to find sensor Tag
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        self.centralManager.stopScan()
        statusLabel = "Bluetooth sensor found"
        self.peripheral = peripheral
        self.peripheral.delegate = self
        self.centralManager.connect(self.peripheral, options: nil)
        }
    
    //Connect and discover services
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if peripheral == self.peripheral {
            statusLabel = "Connecting, Discovering services..."
            peripheral.discoverServices(nil)
        }
    }
    
    //Discover characteristics
    func peripheral(peripheral: CBPeripheral, didDiscoverServices error: NSError?) {
        
        let services = peripheral.services!
        
            for service in services {

            if service.uuid == led0ServiceUUID{
                //Discover Characteristics if IR Temperature Service
                peripheral.discoverCharacteristics([impedanceCharacteristicUUID, radianceCharacteristicUUID], for: service)
            }

            if service.uuid == buttonServiceUUID{
                peripheral.discoverCharacteristics([uvaCharacteristicUUID, uvbCharacteristicUUID], for: service)
            }
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        let services = peripheral.services!
        var enableValue = 0
        var enableBytes: Data!
        for service in services {
            if service.uuid == led0ServiceUUID {
                enableValue = 1
                enableBytes = Data(bytes: &enableValue, count: MemoryLayout.size(ofValue: (UInt8).self))
            } else if service.uuid == buttonServiceUUID {
                enableValue = 2
                enableBytes = Data(bytes: &enableValue, count: MemoryLayout.size(ofValue: (UInt8).self))
            }
        }
        statusLabel = "Enabling sensors"

        for characteristics in service.characteristics! {
            let thisCharacteristic = characteristics as CBCharacteristic
            if thisCharacteristic.uuid == impedanceCharacteristicUUID {
                self.peripheral.setNotifyValue(true, for: thisCharacteristic)
                self.peripheral.writeValue(enableBytes, for: thisCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
            if thisCharacteristic.uuid == radianceCharacteristicUUID {
                self.peripheral.setNotifyValue(true, for: thisCharacteristic)
                self.peripheral.writeValue(enableBytes, for: thisCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
            if thisCharacteristic.uuid == uvaCharacteristicUUID {
                self.peripheral.setNotifyValue(true, for: thisCharacteristic)
                self.peripheral.writeValue(enableBytes, for: thisCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
            if thisCharacteristic.uuid == uvbCharacteristicUUID {
                self.peripheral.setNotifyValue(true, for: thisCharacteristic)
                self.peripheral.writeValue(enableBytes, for: thisCharacteristic, type: CBCharacteristicWriteType.withResponse)
            }
        }
    }
    
    func peripheral(peripheral: CBPeripheral!, didUpdateValueForCharacteristic characteristic: CBCharacteristic!, error: NSError!) {
     
        statusLabel = "Connected"
     
        if characteristic.uuid == impedanceCharacteristicUUID {
            // Convert NSData to array of signed 16 bit values
            let dataBytes = characteristic.value
            let dataLength = dataBytes!.count
            var dataArray = [UInt8](repeating: 0, count: dataLength)
            dataBytes!.copyBytes(to: &dataArray, count: dataLength)
     
            // Element 1 of the array will be ambient temperature raw value
            let rawImpedance = Double(dataArray[1])/128
     
            // Display on the temp label
            impedanceLabel = NSString(format: "%.2f", rawImpedance) as String
        }
        if characteristic.uuid == radianceCharacteristicUUID {
               // Convert NSData to array of signed 16 bit values
               let dataBytes = characteristic.value
               let dataLength = dataBytes!.count
               var dataArray = [UInt8](repeating: 0, count: dataLength)
               dataBytes!.copyBytes(to: &dataArray, count: dataLength)
        
               // Element 1 of the array will be ambient temperature raw value
               let rawRadiance = Double(dataArray[1])/128
        
               // Display on the temp label
               radianceLabel = NSString(format: "%.2f", rawRadiance) as String
           }
        if characteristic.uuid == uvbCharacteristicUUID {
               // Convert NSData to array of signed 16 bit values
               let dataBytes = characteristic.value
               let dataLength = dataBytes!.count
               var dataArray = [UInt8](repeating: 0, count: dataLength)
               dataBytes!.copyBytes(to: &dataArray, count: dataLength)
        
               // Element 1 of the array will be ambient temperature raw value
               let rawUVB = Double(dataArray[1])/128
        
               // Display on the temp label
               uvbLabel = NSString(format: "%.2f", rawUVB) as String
           }
        if characteristic.uuid == uvaCharacteristicUUID {
               // Convert NSData to array of signed 16 bit values
               let dataBytes = characteristic.value
               let dataLength = dataBytes!.count
               var dataArray = [UInt8](repeating: 0, count: dataLength)
               dataBytes!.copyBytes(to: &dataArray, count: dataLength)
        
               // Element 1 of the array will be ambient temperature raw value
               let rawUVA = Double(dataArray[1])/128
        
               // Display on the temp label
               uvaLabel = NSString(format: "%.2f", rawUVA) as String
           }
    }
}
        
        
    
    
    
    

struct ContentView: View {
   // @State var bodyPart = ""
    //@ObservedObject var name: User
   @ObservedObject var controller = BluetoothController()

    var moisture = "0"
    var glow = "0"
    var pH = "0"
    var uV = "0"
    
    private func startController() {
        controller.startCentralManager()
    }
    
    var body: some View {
        ZStack {
            Color.purple.edgesIgnoringSafeArea(.top)
            Color.white
        VStack {
            ZStack {
                    Rectangle()
                    .fill(Color.purple)
                VStack {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("Menu Bar")
                            }.padding()
                        .foregroundColor(Color.white)
                        Spacer()
                        Text("Data Summary")
                        .font(.headline)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Question")
                            }.padding()
                            .foregroundColor(Color.white)
                    }
                    Divider()
                    Text("name")
                        .font(.headline)
                    Divider()
                    Text("Congratulations! You have achieved 3 of your goals.")
                        .font(.subheadline)
                    Spacer()
                }
                        
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 200)

            Spacer()
            ZStack {
                HStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 150,height: 150)
                        .padding()
                        .shadow(radius: 10)
                        .foregroundColor(Color.blue)
            
                    RoundedRectangle(cornerRadius: 40)
                        .frame(width: 150,height: 150)
                        .padding()
                        .shadow(radius: 10)
                        .foregroundColor(Color.yellow)
                }
                HStack{
                    VStack {
                        GeometryReader { geo in
                        Image("Image-3")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width, height: 40)
                        }.offset(y: -30)
                        
                        Text(controller.impedanceLabel).offset(y: -60).font(.title)
                        //}
                        
                        
                        
                        }.frame(width: 150, height:150)
                        .padding()
                    
                    VStack {
                        GeometryReader { geo in
                         Image("Image-1")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                             .frame(width: geo.size.width, height: 40)
                         }.offset(y: -30)
                        Text(controller.radianceLabel).offset(y: -60).font(.title)
                    }.frame(width: 150, height:150).padding()
                }
            }
                ZStack {
                HStack {
                   RoundedRectangle(cornerRadius: 40)
                       .frame(width: 150,height: 150)
                       .padding()
                       .shadow(radius: 10)
                       .foregroundColor(Color.green)
                   RoundedRectangle(cornerRadius: 40)
                       .frame(width: 150,height: 150)
                       .padding()
                       .shadow(radius: 10)
                       .foregroundColor(Color.red)
                }
                HStack{
                    VStack {
                        GeometryReader { geo in
                        Image("Image")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width, height: 40)
                        }.offset(y: -30)
                        Text(controller.uvbLabel).offset(y: -60).font(.title)
                        
                        
                        }.frame(width: 150, height:150)
                        .padding()
                    
                    VStack {
                        GeometryReader { geo in
                         Image("Image-2")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                             .frame(width: geo.size.width, height: 40)
                         }.offset(y: -30)
                        Text(controller.uvaLabel).offset(y: -60).font(.title)
                    }.frame(width: 150, height:150).padding()
                    }
                }
                VStack {
                    HStack {
                        Button(action: {
                            
                        }) {
                            Text("Face")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(Color.white)
                                .font(.body)
                                .border(Color.black, width: 2)
                                .frame(width: 80, height: 80)
                                .shadow(radius:10)
                        }
                        Button(action: {
                            
                        }) {
                            Text("Arm")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(Color.white)
                                .font(.body)
                                .border(Color.black, width: 2)
                                .frame(width: 80, height: 80)
                                .shadow(radius:10)
                        }
                        Button(action: {
                            
                        }) {
                            Text("Body")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(Color.white)
                                .font(.body)
                                .border(Color.black, width: 2)
                                .frame(width: 80, height: 80)
                                .shadow(radius:10)
                        }
                        Button(action: {
                            
                        }) {
                            Text("Hair")
                                .padding()
                                .background(Color.purple)
                                .foregroundColor(Color.white)
                                .font(.body)
                                .border(Color.black, width: 2)
                                .frame(width: 80, height: 80)
                                .shadow(radius:10)
                        }
                      
                    }
                    HStack {
                        Button(action: {
                        
                        }) {
                            Text("Back")
                            .foregroundColor(Color.black)
                                .font(.body)
                        }.padding()
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Add Notes")
                                .font(.body)
                                .foregroundColor(Color.black)
                        }.padding()
                    }
                    
                }
        }
        }.onAppear { self.startController() }
       
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()    }
}
