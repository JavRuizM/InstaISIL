//
//  ContentView.swift
//  instaISIL
//
//  Created by user180150 on 10/07/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: .init(colors:[Color(.white), Color("primary"), Color("primary"), Color("primary"), Color("primary"), Color("primary"), Color ("primary"), Color(.black)]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    
    @State var index = 0
    var body: some View{
        
        VStack{
            
            Image("logo_ISIL2").resizable().frame(width: 200, height: 150)
            
            
            HStack{
                
                Button(action: {withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){self.index = 0}}){
                    
                    Text("Ingresar").foregroundColor(self.index == 0 ? .black : .white).fontWeight(.bold).padding(.vertical, 10).frame(width: (UIScreen.main.bounds.width-50)/2)
                }.background(self.index == 0 ? Color.white: Color.clear).clipShape(Capsule())
                
                Button(action: {withAnimation(.spring(response: 0.8, dampingFraction: 0.5, blendDuration: 0.5)){self.index = 1}}){
                    
                    Text("Regístrate").foregroundColor(self.index == 1 ? .black : .white).fontWeight(.bold).padding(.vertical, 10).frame(width: (UIScreen.main.bounds.width - 50)/2)
                }.background(self.index == 1 ? Color.white: Color.clear).clipShape(Capsule())
                	
            }.background(Color.black.opacity(0.1)).clipShape(Capsule()).padding(.top, 25)
            
            
            if self.index == 0{
                
                Login()
            }
            else{
                SignUp()
            }
                        
            
            Button(action: {} ){
                Text("Olvidaste tu contraseña?").foregroundColor(.white)
            }.padding(.top, 20)
            
            
            HStack(spacing: 15){
                
                Color.white.opacity(0.7).frame(width: 20, height: 1)
                
                Text("Visita nuestra WEB").foregroundColor(.white)
                
                Color.white.opacity(0.7).frame(width: 20, height: 1)
            }.padding(.top, 10)
            
            
            HStack{
                
                Button(action: {
                    if let url = URL(string:"https://isil.pe"){
                        UIApplication.shared.open(url)
                    }
                }){
                    Image("logo_ISIL1").renderingMode(.original).resizable().frame(width: 50, height: 30).padding()
                }.background(Color.white).clipShape(Circle()).padding(.leading, 25)
            }.padding()
            
        }.padding()
    }
}

struct Login: View {
    
    @State var mail = ""
    @State var pass = ""
    
    var body: some View{
        
        VStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope").foregroundColor(.black)
                    
                    TextField("Ingresar codigo", text: self.$mail)
                }.padding(.vertical, 20)
                
                Divider()
                
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "lock").resizable().frame(width: 15, height: 18).foregroundColor(.black)
                    
                    SecureField("Ingresar contraseña", text: self.$pass)
                    
                    Button(action:{
                        
                    }){
                        Image(systemName: "eye").foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
                
            }.padding(.vertical).padding(.horizontal, 20).padding(.bottom, 40).background(Color .white).cornerRadius(10).padding(.top, 25)
            
            Button(action: {}){
                
                Text("LOGIN").foregroundColor(.white).fontWeight(.bold).padding(.vertical).frame(width: UIScreen.main.bounds.width - 100)
                
            }.background(LinearGradient(gradient: .init(colors:[Color("primary"), Color("primary"), Color(.white)]), startPoint: .leading, endPoint: .trailing)).cornerRadius(8).offset(y: -40).padding(.bottom, -40).shadow(radius: 15)
        }
    }
}

struct SignUp: View {
    
    @State var mail = ""
    @State var pass = ""
    @State var repass = ""
    
    var body: some View{
        
        VStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope").foregroundColor(.black)
                    
                    TextField("Ingresar código", text: self.$mail)
                }.padding(.vertical, 20)
                
                Divider()
                
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "lock").resizable().frame(width: 15, height: 18).foregroundColor(.black)
                    
                    SecureField("Ingresar contraseña", text: self.$pass)
                    
                    Button(action:{
                        
                    }){
                        Image(systemName: "eye").foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
                
                Divider()
                
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "lock").resizable().frame(width: 15, height: 18).foregroundColor(.black)
                    
                    SecureField("Confirmar contraseña", text: self.$repass)
                    
                    Button(action:{
                        
                    }){
                        Image(systemName: "eye").foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
            }.padding(.vertical).padding(.horizontal, 20).padding(.bottom, 40).background(Color .white).cornerRadius(10).padding(.top, 25)
            
            Button(action: {}){
                
                Text("SIGNUP").foregroundColor(.white).fontWeight(.bold).padding(.vertical).frame(width: UIScreen.main.bounds.width - 100)
                
            }.background(LinearGradient(gradient: .init(colors:[Color("primary"), Color("primary"), Color(.white)]), startPoint: .leading, endPoint: .trailing)).cornerRadius(8).offset(y: -40).padding(.bottom, -40).shadow(radius: 15)
        }
    }
}
