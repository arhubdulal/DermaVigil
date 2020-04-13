//
//  SwiftUIView.swift
//  DermaVigil SwiftUI
//
//  Created by Arhub Dulal on 1/8/20.
//  Copyright © 2020 BelleT. All rights reserved.
//

import SwiftUI

var showsetup = false

struct Login: View {
    var body: some View {
        NavigationView {
            SkinInfoProfile()
        }
    }
}

struct SignInView: View {
    @State var email: String = ""
    @State var password : String = ""
    @State var error: String = ""
    @EnvironmentObject var session: SessionStore
    
    func signIn() {
        session.signIn(email: email, password: password) { (result, error) in
            if let error = error {
                self.error = error.localizedDescription
            } else {
                self.email = ""
                self.password = ""
            
        }
    }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
            RoundedRectangle(cornerRadius: 40).frame(width: 300, height: 300).foregroundColor(Color(.lightGray))
            RoundedRectangle(cornerRadius: 40).frame(width: 300, height: 225).foregroundColor(Color(.white)).offset(y:37)
            RoundedRectangle(cornerRadius: 40).frame(width: 150, height: 300).foregroundColor(Color(.white)).offset(x: -75)
            VStack {
                TextField("Email address", text: $email)
                    .font(.system(size: 15))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(.gray), lineWidth: 1))
                SecureField("Password", text: $password)
                    .font(.system(size: 15))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(.gray), lineWidth: 1))
                
                Button(action: signIn) {
                    Text("Sign In")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(width: 150, height: 50)
                        .foregroundColor(Color(.white))
                        .font(.system(size: 14, weight: .bold))
                        .background(RadialGradient(gradient: Gradient(colors: [.purple, .black]), center: .center, startRadius: 2, endRadius: 650))
                        .cornerRadius(10)
                }.offset(y: 20)
                
                if (error != "") {
                    Text(error)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding()
                }
                
            }.frame(width:250).offset(y:20)
            
            HStack {
                Spacer()
                Text("Log In ")
                    .font(.system(size: 20, weight: .semibold)).offset(x: -10)
                Spacer()
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .font(.system(size: 20, weight: .semibold)).offset(x: 10)
                        .foregroundColor(Color(.gray))
                }
                Spacer()
            }.frame(width: 300, height: 300).offset(y: -110)
            
            VStack(alignment: .trailing) {
                Image("BelleT")
                    .resizable()
                    .frame(width: 90, height: 60)
                    .offset(x: 60, y: -250)
                Image("Company").offset(x: 90, y: -250)
            }

        }.edgesIgnoringSafeArea(.all)
        }
}

struct SignUpView: View {
    @State private var showingAlert = false
    @State var email: String = ""
    @State var password : String = ""
    @State var error: String = ""
    @State var confirm : String = ""
    @EnvironmentObject var session: SessionStore
    
    func signUp() {
            session.signUp(email: email, password: password ) { (result,error) in
                if let error = error {
                    self.error = error.localizedDescription
                } else {
                    self.email = ""
                    self.password = ""
                
            }
        }
    }

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                Text("Sign Up")
                    .font(.system(size: 30, weight: .semibold))
                    .offset(y: -200)
                TextField("Email address", text: $email)
                    .font(.system(size: 15))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -100)
                    .frame(width: 300)
                SecureField("Password", text: $password)
                    .font(.system(size: 15))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -75)
                    .frame(width: 300)
                SecureField("Confirm Password", text: $confirm)
                    .font(.system(size: 15))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 10).strokeBorder(Color(.gray), lineWidth: 1))
                        .offset(y: -50)
                    .frame(width: 300)
                Button(action: registerButtonTapped) {
                    Text("Create Account")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .frame(width: 250, height: 50)
                    .foregroundColor(Color(.white))
                    .font(.system(size: 14, weight: .bold))
                    .background(RadialGradient(gradient: Gradient(colors: [.blue, .black]), center: .center, startRadius: 2, endRadius: 650))
                    .cornerRadius(10)
                        .offset(y: 40)
                    if showsetup {
                        SkinInfoProfile().animation(.easeIn)
                    }
                }
                if (error != "") {
                    Text(error)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.gray)
                        .padding()
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func registerButtonTapped() {

          var a = false
          var b = false

          if password == confirm {

              a = true

          } else {
            Text("Passwords are not identical")
          }

          if(password == "" || confirm == "") {
            Text("Password Field cannot be empty")
          } else {
              b = true
          }
          if a == true && b == true {
            signUp()
            showsetup = true
        }
    }
}

struct SkinCareProfile : View {
    let col1 = UIColor(hue: 0.4917, saturation: 1, brightness: 1, alpha: 1.0)
    let col2 = UIColor(hue: 0.1194, saturation: 0, brightness: 0.85, alpha: 1.0)
    @State var skinCleanser = ""
    @State var toner = ""
    @State var eyeCare = ""
    @State var repairSerum = ""
    @State var moisturizer = ""
    @State var masks = ""

    
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
                                self.skipSkinCareProfile()
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
                            Text("Skin Care Profile").font(.headline).bold()
                            Spacer()
                            
                            Button(action: {
                                self.saveSkinCareProfile()
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
                    .offset(y: CGFloat(-75))
                }
                
                Spacer()
                
                Group {
                HStack (alignment: .top) {
                    Spacer()
                    Text("Cleanser").bold()
                    Spacer()
                    TextField("Skin Cleanser", text: $skinCleanser)
                    .padding(12)
                .background(RoundedRectangle(cornerRadius:10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -10)
                    
                    Spacer()
                    }
                Spacer()
                HStack (alignment: .top) {
                     Spacer()
                     Text("Toner").bold()
                     Spacer()
                     TextField("Toner", text: $toner)
                     .padding(12)
                 .background(RoundedRectangle(cornerRadius:10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -10)
                     Spacer()
                }
                Spacer()
                HStack (alignment: .top) {
                     Spacer()
                     Text("Eye Care").bold()
                     Spacer()
                     TextField("Eye Care", text: $eyeCare)
                     .padding(12)
                 .background(RoundedRectangle(cornerRadius:10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -10)
                     Spacer()
                }
                Spacer()
                HStack (alignment: .top) {
                     Spacer()
                     Text("Repair Serum").bold()
                     Spacer()
                     TextField("Repair Serum", text: $repairSerum)
                     .padding(12)
                 .background(RoundedRectangle(cornerRadius:10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -10)
                     Spacer()
                }
                Spacer()
                }.offset(y: -30)
                Group {
                HStack (alignment: .top) {
                     Spacer()
                     Text("Moisturizer").bold()
                     Spacer()
                     TextField("Moisturizer", text: $moisturizer)
                     .padding(12)
                 .background(RoundedRectangle(cornerRadius:10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: -10)
                     Spacer()
                }
                    Spacer()
                HStack (alignment: .top) {
                     Spacer()
                     Text("Masks").bold()
                     Spacer()
                     TextField("Masks", text: $masks)
                     .padding(12)
                .background(RoundedRectangle(cornerRadius:10).strokeBorder(Color(.gray), lineWidth: 1))
                    .offset(y: CGFloat(-10))
                     Spacer()
                }
                    Spacer()
                }.offset(y: -30)
                
            }
        }
    }
    func skipSkinCareProfile() {
        skinCleanser = ""
        toner = ""
        eyeCare = ""
        repairSerum = ""
        moisturizer = ""
        masks = ""
        SkinInfoProfile()
    }
    func saveSkinCareProfile() {
        SkinInfoProfile()
    }
}

struct SkinInfoProfile : View {
    
    let col1 = UIColor(hue: 0.4917, saturation: 1, brightness: 1, alpha: 1.0)
    let col2 = UIColor(hue: 0.1194, saturation: 0, brightness: 0.85, alpha: 1.0)
    @State var skinType = "Choose"
    @State var gender = "Choose"
    @State var age = "Choose"
    @State var skinTone = "Choose"
    @State var expandSkinType = false
    @State var expandGender = false
    @State var expandAge = false
    @State var expandSkinTone = false
    @State var expandAreasOfConcern = false
    @State var buttonPressed = false
    @State var skinTypeButtonPressed = false
    @State var ageButtonPressed = false
    @State var skinToneButtonPressed = false
    @State var genderButtonPressed = false
    
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
                                    self.skipSkinInfoProfile()
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
                                Text("Skin Info Profile").font(.headline).bold()
                                Spacer()
                                
                                Button(action: {
                                    self.saveSkinInfoProfile()
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
                        .offset(y: CGFloat(-75))
                    }
                    
                    Spacer()
                    
                    Group {
                        HStack {
                        VStack (alignment: .leading) {
                            Group {
                                Spacer()
                                Text("Skin Type").bold()
                                Spacer()
                                Text("Gender").bold()
                                Spacer()
                                Text("Age").bold()
                            }
                            Group {
                                Spacer()
                                Text("Skin Tone").bold()
                                Spacer()
                            }
                        }.offset(x: 50, y:-60)
                        ZStack {
                            GeometryReader { geo in
                                
                            VStack (alignment: .leading, spacing: 10) {
                            HStack {
                                Text(self.skinType).fontWeight(.heavy).foregroundColor(.black)
                                Image(systemName: self.expandSkinType ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6).foregroundColor(.black)
                                    
                                }.onTapGesture {
                                    if !self.buttonPressed {
                                        self.expandSkinType.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinTypeButtonPressed.toggle()
                                    }
                                }
                                
                                if self.expandSkinType {
                                    Button(action: {
                                        self.expandSkinType.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinTypeButtonPressed.toggle()
                                        self.skinType = "Normal"
                                    }) {
                                        Text("Normal").font(.subheadline)
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandSkinType.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinTypeButtonPressed.toggle()
                                        self.skinType = "Dry"


                                    }) {
                                        Text("Dry").font(.subheadline)
                                        }.foregroundColor(.black)
                                   Button(action: {
                                       self.expandSkinType.toggle()
                                        self.buttonPressed.toggle()
                                    self.skinTypeButtonPressed.toggle()
                                    self.skinType = "Oily"


                                   }) {
                                       Text("Oily").font(.subheadline)
                                       }.foregroundColor(.black)
                                    Button(action: {
                                        self.expandSkinType.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinTypeButtonPressed.toggle()
                                        self.skinType = "Combination"


                                    }) {
                                        Text("Combination").font(.subheadline)
                                    }.foregroundColor(.black)
                                    Button(action: {
                                        self.expandSkinType.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinTypeButtonPressed.toggle()
                                        self.skinType = "Sensitive"
                                    }) {
                                        Text("Sensitive").font(.subheadline)
                                        }.foregroundColor(.black)
                                }
                                }.padding()
                                .background(RoundedRectangle(cornerRadius:10).fill(Color.white)) .animation(.spring()).frame(width: 120).offset(x: geo.size.width/2.5, y:geo.size.height/30)

                            if !self.skinTypeButtonPressed {
                            VStack (alignment: .leading, spacing: 10) {
                                     HStack {
                                        Text(self.gender).fontWeight(.heavy).foregroundColor(.black)
                                        Image(systemName: self.expandGender ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6).foregroundColor(.black)
                                         
                                     }.onTapGesture {
                                         if !self.buttonPressed {
                                             self.expandGender.toggle()
                                             self.buttonPressed.toggle()
                                            self.genderButtonPressed.toggle()
                                         }
                                }
                                if self.expandGender {
                                         Button(action: {
                                             self.expandGender.toggle()
                                            self.buttonPressed.toggle()
                                            self.genderButtonPressed.toggle()
                                            self.gender = "Male"

                                         }) {
                                             Text("Male")
                                         }.foregroundColor(.black)
                                         
                                         Button(action: {
                                             self.expandGender.toggle()
                                            self.buttonPressed.toggle()
                                            self.genderButtonPressed.toggle()
                                            self.gender = "Female"

                                         }) {
                                             Text("Female")
                                             }.foregroundColor(.black)

                                     }
                            }.padding().background(RoundedRectangle(cornerRadius:10).fill(Color.white)).animation(.spring()).offset(x:geo.size.width/2.5, y:geo.size.height/4)
                            }
                                if !self.genderButtonPressed {
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    Text(self.age).fontWeight(.heavy).foregroundColor(.black)
                                    Image(systemName: self.expandAge ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6).foregroundColor(.black)
                                    
                                }.onTapGesture {
                                    if !self.buttonPressed {
                                        self.expandAge.toggle()
                                        self.buttonPressed.toggle()
                                        self.ageButtonPressed.toggle()
                                    }
                                }
                                if self.expandAge {
                                    Button(action: {
                                        self.expandAge.toggle()
                                        self.buttonPressed.toggle()
                                        self.ageButtonPressed.toggle()
                                        self.age = "Under 13"

                                    }) {
                                        Text("Under 13")
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandAge.toggle()
                                        self.buttonPressed.toggle()
                                        self.ageButtonPressed.toggle()
                                        self.age = "13 - 25"


                                    }) {
                                        Text("13 - 25")
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandAge.toggle()
                                        self.buttonPressed.toggle()
                                        self.ageButtonPressed.toggle()
                                        self.age = "26 - 35"

                                    }) {
                                        Text("26 - 35")
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandAge.toggle()
                                        self.buttonPressed.toggle()
                                        self.ageButtonPressed.toggle()
                                        self.age = "36 - 45"


                                    }) {
                                        Text("36 - 45")
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandAge.toggle()
                                        self.buttonPressed.toggle()
                                        self.ageButtonPressed.toggle()
                                        self.age = "46 - 55"


                                    }) {
                                        Text("46 - 55")
                                        }.foregroundColor(.black)

                                   Button(action: {
                                       self.expandAge.toggle()
                                    self.buttonPressed.toggle()
                                    self.ageButtonPressed.toggle()
                                    self.age = "56 - 65"


                                   }) {
                                       Text("56 - 65")
                                       }.foregroundColor(.black)
                                   Button(action: {
                                       self.expandAge.toggle()
                                    self.buttonPressed.toggle()
                                    self.ageButtonPressed.toggle()
                                    self.age = "66 - 75"


                                   }) {
                                       Text("66 - 75")
                                       }.foregroundColor(.black)
                                   Button(action: {
                                       self.expandAge.toggle()
                                    self.buttonPressed.toggle()
                                    self.ageButtonPressed.toggle()
                                    self.age = "75+"
                                   }) {
                                       Text("75+")
                                   }.foregroundColor(.black)
                                }
                            }.padding().background(RoundedRectangle(cornerRadius:10).fill(Color.white)).animation(.spring()).offset(x: geo.size.width/2.5, y: geo.size.height/2.3)
                            }

                            if !self.ageButtonPressed {
                            VStack (alignment: .leading, spacing: 5) {
                                HStack {
                                    Text(self.skinTone).fontWeight(.heavy).foregroundColor(.black)
                                    Image(systemName: self.expandSkinTone ? "chevron.up" : "chevron.down").resizable().frame(width: 13, height: 6).foregroundColor(.black)
                                    
                                }.onTapGesture {
                                    if !self.buttonPressed {
                                        self.expandSkinTone.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinToneButtonPressed.toggle()
                                    }
                                }
                                if self.expandSkinTone {
                                    Button(action: {
                                        self.expandSkinTone.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinToneButtonPressed.toggle()
                                        self.skinTone = "Light"
                                    }) {
                                        Text("Light").font(.subheadline)
                                    }.foregroundColor(.black)
                                    
                                    Button(action: {
                                        self.expandSkinTone.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinToneButtonPressed.toggle()
                                        self.skinTone = "Beige"


                                    }) {
                                        Text("Beige").font(.subheadline)
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandSkinTone.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinToneButtonPressed.toggle()
                                        self.skinTone = "Light Brown"


                                    }) {
                                        Text("Light Brown").font(.subheadline)
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandSkinTone.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinToneButtonPressed.toggle()
                                        self.skinTone = "Medium Brown"


                                    }) {
                                        Text("Medium Brown").font(.subheadline)
                                        }.foregroundColor(.black)

                                    Button(action: {
                                        self.expandSkinTone.toggle()
                                        self.buttonPressed.toggle()
                                        self.skinToneButtonPressed.toggle()
                                        self.skinTone = "Dark Brown"


                                    }) {
                                        Text("Dark Brown").font(.subheadline)
                                        }.foregroundColor(.black)
                                   Button(action: {
                                       self.expandSkinTone.toggle()
                                    self.buttonPressed.toggle()
                                    self.skinToneButtonPressed.toggle()
                                    self.skinTone = "Black"


                                   }) {
                                       Text("Black").font(.subheadline)
                                       }.foregroundColor(.black)
                                }
                            }.padding().background(RoundedRectangle(cornerRadius:10).fill(Color.white)).animation(.spring()).offset(x: geo.size.width/2.5, y:geo.size.height/1.5 - 10)
                            }
                            }
                            }
                        }
                        }
                    
                }
            }
        }
    func skipSkinInfoProfile() {
        
    }
    func saveSkinInfoProfile() {
        
    }
    }
/*Text("Wrinkles/lines").padding().background(RoundedRectangle(cornerRadius:CGFloat(10)).fill(Color.green)).font(.system(size: 25, weight: .bold))
.onTapGesture {
    self.wrinkles.toggle()  } */
struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login().environmentObject(SessionStore())
    }
}
