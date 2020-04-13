//
//  WarningandMeasurement.swift
//  DermaVigil SwiftUI
//
//  Created by Arhub Dulal on 1/27/20.
//  Copyright © 2020 BelleT. All rights reserved.
//

import UIKit
import SwiftUI

struct WarningandMeasurement_Previews: PreviewProvider {
    static var previews: some View {
        MeasurementSettings()
    }
}

struct areasOfConcern: View {
        let col1 = UIColor(hue: 0.4917, saturation: 1, brightness: 1, alpha: 1.0)
        let col2 = UIColor(hue: 0.1194, saturation: 0, brightness: 0.85, alpha: 1.0)
        @State var wrinkles = false
        @State var spots = false
        @State var radiance = false
        @State var firming = false
        @State var pores = false
        @State var redness = false
        @State var dryness = false
        @State var acne = false
        @State var sunprotection = false
        
    var body: some View {
        ZStack {
         Color(col2).edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    ZStack {
                        Rectangle().fill(Color(col1)).edgesIgnoringSafeArea(.top)
                    VStack {
                        HStack (alignment: .top){
                            Button(action: {
                         
                            }) {
                            Text("Menu Bar")
                            }.padding()
                            .foregroundColor(Color.black)
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Text("Question")
                            }.padding()
                         .foregroundColor(Color.black)
                        }.offset(y: -30)
                        HStack {
                        Spacer()
                        Button(action: {
                         
                        }) {
                            Text("Skip")
                         .frame(minWidth: 0, maxWidth: .infinity)
                         .frame(width: 100, height: 50)
                         .foregroundColor(Color(.white))
                         .font(.system(size: 14, weight: .bold))
                         .background(Color.gray)
                         .cornerRadius(10)
                        }
                         Spacer()
                         Text("Areas of Concern").font(.headline).bold()
                         Spacer()
                         
                         Button(action: {
                             
                        }) {
                        Text("Save")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(width: 100, height: 50)
                            .foregroundColor(Color(.white))
                            .font(.system(size: 14, weight: .bold))
                            .background(Color.blue)
                            .cornerRadius(10)
                         }
                         Spacer()
                     
                        }.offset(y:-20)
                    }
                        
             }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
         }
                
         Spacer()
        
        Group {
    Text("Wrinkles/lines").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(wrinkles ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.wrinkles.toggle()
        }
                
        Spacer()
            
        Text("Dark Spots").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(spots ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.spots.toggle()
        }
        
        Spacer()
    Text("Radiance").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(radiance ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.radiance.toggle()
        }
        
        Spacer()
    Text("Firming").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(firming ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.firming.toggle()
        }
        
        Spacer()
            
        Text("Pore Minimization").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(pores ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.pores.toggle()
        }
        
        Spacer()
        
                
        }
        
        Group {
            
        Text("Redness and Discoloration").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(redness ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.redness.toggle()
        }
        
        Spacer()
        
        Text("Dryness and Dehydration").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(dryness ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.dryness.toggle()
        }
        
        Spacer()
        
    Text("Acne").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(acne ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.acne.toggle()
        }
        
        Spacer()
        }
        
        Group {
        
        Text("Sun Protection").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(sunprotection ? Color.green : Color.white))
        .font(.system(size: 15, weight: .bold))
        .onTapGesture {
            self.sunprotection.toggle()
        }
        
        Spacer()
        
        }
        }
        }
    }
    
           
    func saveAreasOfConcern() {
        
    }
    func skipAreasOfConcern() {
        
    }
    
}

struct WarningSettings: View {
    
    @State var uVexposure = true
    @State var uVexposureValue = "Mod"
    @State var skinMoisture = true
    @State var skinMoistureValue = "-10%"
    @State var skinRadianceValue = ""
    @State var skinRadiance = true
    @State var skinPH = true
    @State var skinPHValue = "+0.5"
    @State var low = false
    @State var high = false
    @State var mod = true
    @State var nfifteen = false
    @State var nten = true
    @State var nfive = false
    @State var bL = false
    @State var nthirty = false
    @State var ntwenty = true
    @State var nnten = false
    @State var bLL = false
    @State var npointone = false
    @State var bLLL = false
    @State var pointone = false
    @State var pointthree = false
    @State var pointfive = true
    
    let col1 = UIColor(hue: 0.5556, saturation: 0.9, brightness: 1, alpha: 1.0)
    let col2 = UIColor(hue: 0.1194, saturation: 0, brightness: 0.85, alpha: 1.0)
    
    
    var body: some View {
        ZStack {
        Color(col2).edgesIgnoringSafeArea(.all)
           VStack {
               Group {
                   ZStack {
                       Rectangle().fill(Color(col1)).edgesIgnoringSafeArea(.top)
                   VStack {
                       HStack (alignment: .top){
                           Button(action: {
                        
                           }) {
                           Text("Menu Bar")
                           }.padding()
                           .foregroundColor(Color.black)
                       Spacer()
                       Button(action: {
                           
                       }) {
                           Text("Question")
                           }.padding()
                        .foregroundColor(Color.black)
                       }.offset(y: -30)
                       HStack {
                       Spacer()
                       Button(action: {
                        
                       }) {
                           Text("Skip")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(width: 100, height: 50)
                        .foregroundColor(Color(.white))
                        .font(.system(size: 14, weight: .bold))
                        .background(Color.gray)
                        .cornerRadius(10)
                       }
                        Spacer()
                        Text("Warning Settings").font(.headline).bold()
                        Spacer()
                        
                        Button(action: {
                            
                       }) {
                       Text("Save")
                           .frame(minWidth: 0, maxWidth: .infinity)
                           .frame(width: 100, height: 50)
                           .foregroundColor(Color(.white))
                           .font(.system(size: 14, weight: .bold))
                           .background(Color.blue)
                           .cornerRadius(10)
                        }
                        Spacer()
                    
                       }.offset(y:-20)
                   }
                       
            }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
        }
               
        Spacer()
            
            HStack {
                Spacer()
                Text("UV Exposure")
                    .font(.system(size: 15, weight: .bold))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                        .frame(width: 30, height:10)
                    Circle().frame(width: 20, height: 20).foregroundColor(uVexposure ? Color.init(col1) : Color.gray)
                        .offset(x: uVexposure ? 5 : -5)
                        .animation(.spring())
                        .onTapGesture {
                            withAnimation {
                                self.uVexposure.toggle()
                            }
                    }
                    
                }
                Spacer()
                ZStack {
                    if self.uVexposure {
                    RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.3167, saturation: 0, brightness: 0.9, alpha: 1.0)))
                        .frame(width:200, height:50)
                    if self.low {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:67, height: 70).offset(x: -67)
                            .animation(.spring())
                    }
                    if self.high {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:67, height: 70).offset(x: 66)
                            .animation(.spring())
                    }
                    if self.mod {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:67, height: 70)
                            .animation(.spring())
                    }
                    
                    Text("Low").font(.system(size: 15, weight: .bold)).offset(x: -67)
                        
                        .onTapGesture {
                            withAnimation {
                            self.low = true
                            self.high = false
                            self.mod = false
                            self.uVexposureValue = "Low"
                            }
                    }
                        
                    Text("Mod").font(.system(size: 15, weight: .bold))
                        .onTapGesture {
                            withAnimation {
                                self.mod = true
                                self.high = false
                                self.low = false
                                self.uVexposureValue = "Mod"
                            }
                        }
                        
                    Text("High").font(.system(size: 15, weight: .bold)).offset(x: 66)
                        .onTapGesture {
                            withAnimation {
                                self.high = true
                                self.low = false
                                self.mod = false
                                self.uVexposureValue = "High"
                            }
                    }
                    }
                    else {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray)
                        .frame(width:200, height:50)
                        .blur(radius: 10)
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray).frame(width:67, height: 70)
                            .blur(radius: 10)
                        
                    }
                    
                }
                Spacer()
                
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Skin Moisture")
                    .font(.system(size: 15, weight: .bold))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                        .frame(width: 30, height:10)
                    Circle().frame(width: 20, height: 20).foregroundColor(skinMoisture ? Color.init(col1) : Color.gray)
                        .offset(x: skinMoisture ? 5 : -5)
                        .onTapGesture {
                            self.skinMoisture.toggle()
                    }
                }
                Spacer()
                ZStack {
                    if self.skinMoisture {
                    RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.3167, saturation: 0, brightness: 0.9, alpha: 1.0)))
                        .frame(width:200, height:50)
                    if self.nfifteen {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: -75)
                        .animation(.spring())
                    }
                    if self.nten {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: -25)
                        .animation(.spring())
                    }
                    if self.nfive {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: 25)
                        .animation(.spring())
                    }
                    if self.bL {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: 75)
                        .animation(.spring())
                    }
                    Text("-15%").font(.system(size: 14, weight: .bold)).offset(x: -75).onTapGesture {
                        self.nfifteen = true
                        self.skinMoistureValue = "-15%"
                        self.nten = false
                        self.nfive = false
                        self.bL = false
                    }
                    Text("-10%").font(.system(size: 14, weight: .bold)).offset(x: -25).onTapGesture {
                        self.nten = true
                        self.skinMoistureValue = "-10%"
                        self.nfifteen = false
                        self.nfive = false
                        self.bL = false
                    }
                    Text("-5%").font(.system(size: 14, weight: .bold)).offset(x: 25).onTapGesture {
                        self.nfive = true
                        self.skinMoistureValue = "5%"
                        self.nten = false
                        self.nfifteen = false
                        self.bL = false
                    }
                    Text("BL").font(.system(size: 14, weight: .bold)).offset(x: 75).onTapGesture {
                        self.bL = true
                        self.skinMoistureValue = "bL"
                        self.nten = false
                        self.nfive = false
                        self.nfifteen = false
                    }
                    }
                    else {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray)
                        .frame(width:200, height:50)
                            .blur(radius:10)
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray).frame(width:50, height: 70).offset(x: -25)
                            .blur(radius:10)
                        
                    }
                }
                Spacer()
                
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Skin Radiance")
                    .font(.system(size: 17, weight: .bold))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                        .frame(width: 30, height:10)
                    Circle().frame(width: 20, height: 20).foregroundColor(skinRadiance ? Color.init(col1) : Color.gray)
                    .offset(x: skinRadiance ? 5 : -5)
                    .onTapGesture {
                        self.skinRadiance.toggle()
                }
                }
                Spacer()
                ZStack {
                    if self.skinRadiance {
                    RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.3167, saturation: 0, brightness: 0.9, alpha: 1.0)))
                        .frame(width:200, height:50)
                    if self.nthirty {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: -75)
                        .animation(.spring())
                    }
                    if self.ntwenty {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: -25)
                        .animation(.spring())
                    }
                    if self.nnten {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: 25)
                        .animation(.spring())
                    }
                    if self.bLL {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:50, height: 70).offset(x: 75)
                        .animation(.spring())
                    }
                    Text("-30%").font(.system(size: 14, weight: .bold)).offset(x: -75).onTapGesture {
                        self.nthirty = true
                        self.skinMoistureValue = "-30%"
                        self.ntwenty = false
                        self.nnten = false
                        self.bLL = false
                    }
                    Text("-20%").font(.system(size: 14, weight: .bold)).offset(x: -25).onTapGesture {
                        self.ntwenty = true
                        self.skinMoistureValue = "-20%"
                        self.nthirty = false
                        self.nnten = false
                        self.bLL = false
                    }
                    Text("-10%").font(.system(size: 14, weight: .bold)).offset(x: 25).onTapGesture {
                        self.nnten = true
                        self.skinMoistureValue = "-10%"
                        self.ntwenty = false
                        self.nthirty = false
                        self.bLL = false
                    }
                    Text("BL").font(.system(size: 14, weight: .bold)).offset(x: 75).onTapGesture {
                        self.bLL = true
                        self.skinMoistureValue = "BL"
                        self.ntwenty = false
                        self.nnten = false
                        self.nthirty = false
                    }
                    }
                    else {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray)
                        .frame(width:200, height:50)
                            .blur(radius:10)
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray).frame(width:50, height: 70).offset(x: -25)
                            .blur(radius:10)
                        
                    }
                }
                Spacer()
                
            }
            
            Spacer()
            
            HStack {
                Spacer()
                Text("Skin PH")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
                ZStack {
                    RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                        .frame(width: 30, height:10)
                    Circle().frame(width: 20, height: 20).foregroundColor(skinPH ? Color.init(col1) : Color.gray)
                    .offset(x: skinPH ? 5 : -5)
                    .onTapGesture {
                        self.skinPH.toggle()
                }
                }
                Spacer()
                ZStack {
                    if self.skinPH {
                    RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.3167, saturation: 0, brightness: 0.9, alpha: 1.0)))
                        .frame(width:200, height:50)
                        
                    Group {
                    
                    if self.npointone {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:40, height: 70).offset(x: -80)
                        .animation(.spring())
                    }
                    if self.bLLL {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:40, height: 70).offset(x: -40)
                        .animation(.spring())
                    }
                    if self.pointone {
                      RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:40, height: 70).offset(x: 0)
                        .animation(.spring())
                    }
                        
                    }
                    if self.pointthree {
                      RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:40, height: 70).offset(x: 40)
                        .animation(.spring())
                    }
                    if self.pointfive {
                      RoundedRectangle(cornerRadius: 15).foregroundColor(Color.init(UIColor(hue: 0.1639, saturation: 0.36, brightness: 1, alpha: 1.0))).frame(width:40, height: 70).offset(x: 80)
                        .animation(.spring())
                    }
                    Text("-0.1").font(.system(size: 13, weight: .bold)).offset(x: -80).onTapGesture {
                        self.npointone = true
                        self.skinPHValue = "-0.1"
                        self.bLLL = false
                        self.pointone = false
                        self.pointthree = false
                        self.pointfive = false
                        
                    }
                    Text("BL").font(.system(size: 13, weight: .bold)).offset(x: -40).onTapGesture {
                        self.bLLL = true
                        self.skinPHValue = "BL"
                        self.npointone = false
                        self.pointone = false
                        self.pointthree = false
                        self.pointfive = false
                    }
                    Text("+0.1").font(.system(size: 13, weight: .bold)).offset(x: 0).onTapGesture {
                        self.pointone = true
                        self.skinPHValue = "+0.1"
                        self.bLLL = false
                        self.npointone = false
                        self.pointthree = false
                        self.pointfive = false
                    }
                    Text("+0.3").font(.system(size: 13, weight: .bold)).offset(x: 40).onTapGesture {
                        self.pointthree = true
                        self.skinPHValue = "+0.3"
                        self.bLLL = false
                        self.pointone = false
                        self.npointone = false
                        self.pointfive = false
                    }
                    Text("+0.5").font(.system(size: 13, weight: .bold)).offset(x: 80).onTapGesture {
                        self.pointfive = true
                        self.skinPHValue = "+0.5"
                        self.bLLL = false
                        self.pointone = false
                        self.pointthree = false
                        self.npointone = false
                    }
                    }
                    else {
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray)
                        .frame(width:200, height:50)
                            .blur(radius:10)
                        RoundedRectangle(cornerRadius: 15).foregroundColor(Color.gray).frame(width:40, height: 70).offset(x: 80)
                            .blur(radius: 10)
                        
                    }
                }
                Spacer()
                
            }
            
            Spacer()
            
        }
    }

}
}

struct MeasurementSettings: View {
    
    let col1 = UIColor(hue: 0.5111, saturation: 1, brightness: 0.97, alpha: 1.0)
    let col2 = UIColor(hue: 0.1194, saturation: 0, brightness: 0.85, alpha: 1.0)
    
    @State var uVexposure = true
    
    
    var body: some View {
            ZStack {
            Color(col2).edgesIgnoringSafeArea(.all)
               VStack {
                   Group {
                       ZStack {
                           Rectangle().fill(Color(col1)).edgesIgnoringSafeArea(.top)
                       VStack {
                           HStack (alignment: .top){
                               Button(action: {
                            
                               }) {
                               Text("Menu Bar")
                               }.padding()
                               .foregroundColor(Color.black)
                           Spacer()
                           Button(action: {
                               
                           }) {
                               Text("Question")
                               }.padding()
                            .foregroundColor(Color.black)
                           }.offset(y: -30)
                           HStack {
                           Spacer()
                           Button(action: {
                            
                           }) {
                               Text("Skip")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(width: 100, height: 50)
                            .foregroundColor(Color(.white))
                            .font(.system(size: 14, weight: .bold))
                            .background(Color.gray)
                            .cornerRadius(10)
                           }
                            Spacer()
                            Text("Measurement Settings").font(.headline).bold().multilineTextAlignment(.center)
                            Spacer()
                            
                            Button(action: {
                                
                           }) {
                           Text("Save")
                               .frame(minWidth: 0, maxWidth: .infinity)
                               .frame(width: 100, height: 50)
                               .foregroundColor(Color(.white))
                               .font(.system(size: 14, weight: .bold))
                               .background(Color.blue)
                               .cornerRadius(10)
                            }
                            Spacer()
                        
                           }.offset(y:-20)
                       }
                           
                }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 100)
            }
            
                Text("Reminder notifications will be sent when it's time to do each measurement you set up").multilineTextAlignment(.center).font(.system(size: 15))
            Spacer()
            HStack {
            VStack {
                Group {
                    Spacer()
            HStack {
                   
                   Text("UV Exposure")
                       .font(.system(size: 15, weight: .bold))
                   
                   ZStack {
                       RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                           .frame(width: 30, height:10)
                       Circle().frame(width: 20, height: 20).foregroundColor(uVexposure ? Color.init(col1) : Color.gray)
                           .offset(x: uVexposure ? 5 : -5)
                           .animation(.spring())
                           .onTapGesture {
                               withAnimation {
                                   self.uVexposure.toggle()
                               }
                       }
                       
                   }
            }
            Spacer()
            HStack {
               
               Text("Skin Moisture")
                   .font(.system(size: 15, weight: .bold))
               
               ZStack {
                   RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                       .frame(width: 30, height:10)
                   Circle().frame(width: 20, height: 20).foregroundColor(uVexposure ? Color.init(col1) : Color.gray)
                       .offset(x: uVexposure ? 5 : -5)
                       .animation(.spring())
                       .onTapGesture {
                           withAnimation {
                               self.uVexposure.toggle()
                           }
                   }
                   
               }
               
                
            
            }
            Spacer()

            }
            HStack {
               
               Text("Skin Radiance")
                   .font(.system(size: 15, weight: .bold))
               
               ZStack {
                   RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                       .frame(width: 30, height:10)
                   Circle().frame(width: 20, height: 20).foregroundColor(uVexposure ? Color.init(col1) : Color.gray)
                       .offset(x: uVexposure ? 5 : -5)
                       .animation(.spring())
                       .onTapGesture {
                           withAnimation {
                               self.uVexposure.toggle()
                           }
                   }
                   
               }
            }
            Spacer()

            HStack {
               
               Text("Skin pH")
                   .font(.system(size: 15, weight: .bold))
               
               ZStack {
                   RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray)
                       .frame(width: 30, height:10)
                   Circle().frame(width: 20, height: 20).foregroundColor(uVexposure ? Color.init(col1) : Color.gray)
                       .offset(x: uVexposure ? 5 : -5)
                       .animation(.spring())
                       .onTapGesture {
                           withAnimation {
                               self.uVexposure.toggle()
                           }
                   }
                   
               }
               
                
            }
            Spacer()

            }
            Spacer()
            }
                
                
                
            }
            }
    }
}
