//
//  ContentView.swift
//  instaISIL
//
//  Created by user180150 on 10/07/20.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: .init(colors:[Color(.white),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary"),
                                                   Color("primary")
            ]
            ),
            startPoint: .top,
            endPoint: .bottom).edgesIgnoringSafeArea(.all)
            
            Home()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HomeController: UIViewControllerRepresentable{
    
        
    func makeUIViewController(context: UIViewControllerRepresentableContext<HomeController>) -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Home", bundle: Bundle.main)
        let controller = storyboard.instantiateViewController(identifier: "Home")
        
        print("makeUI")
        
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<HomeController>) {
        
        print("updateUI")
    }
    
}


struct Home: View{
    
    @State var index = 0
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View{
        
        VStack{
            
            Image("logo_ISIL2")
                .resizable()
                .frame(width: 200, height: 150)
            
            
            HStack{
                
                Button(action: {
                    withAnimation(.spring(response: 0.8,
                                          dampingFraction: 0.5,
                                          blendDuration: 0.5)){self.index = 0}
                }){
                    
                    Text("Ingresar")
                        .foregroundColor(self.index == 0 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width-50)/2)
                }
                .background(self.index == 0 ? Color.white: Color.clear)
                .clipShape(Capsule())
                
                Button(action: {
                        withAnimation(.spring(response: 0.8,
                                              dampingFraction: 0.5,
                                              blendDuration: 0.5)){self.index = 1}}){
                    
                    Text("Regístrate")
                        .foregroundColor(self.index == 1 ? .black : .white)
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .frame(width: (UIScreen.main.bounds.width - 50)/2)
                }
                .background(self.index == 1 ? Color.white: Color.clear)
                .clipShape(Capsule())
                	
            }
            .background(Color.black.opacity(0.1))
            .clipShape(Capsule()).padding(.top, 25)
            
            
            if self.index == 0{
                
                Login()
            }
            else{
                SignUp()
            }
                        
            
            Button(action: {} ){
                Text("Olvidaste tu contraseña?")
                    .foregroundColor(.white)
            }
            .padding(.top, 20)
            
            
            HStack(spacing: 15){
                
                Color.white.opacity(0.7)
                    .frame(width: 20, height: 1)
                
                Text("Visita nuestra WEB")
                    .foregroundColor(.white)
                
                Color.white.opacity(0.7)
                    .frame(width: 20, height: 1)
            }
            .padding(.top, 10)
            
            
            HStack{
                
                Button(action: {
                    if let url = URL(string:"https://isil.pe"){
                        UIApplication.shared.open(url)
                    }
                }){
                    Image("logo_ISIL1")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: 50, height: 30).padding()
                }
                .background(Color.white)
                .clipShape(Circle())
                .padding(.leading, 25)
            }
            .padding()
            
        }
        .padding()
    }
}

struct Login: View {
    
    @State var mail = ""
    @State var pass = ""
    @State var visible = false
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        
                        TextField("Ingresar usuario", text: self.$mail)
                    }
                    .padding(.vertical, 20)
                    
                    Divider()
                    
                    
                    HStack(spacing: 15) {
                        
                        Image(systemName: "lock")
                            .resizable()
                            .frame(width: 15, height: 18)
                            .foregroundColor(.black)
                        
                        if self.visible{
                            TextField("Ingresar contraseña", text: self.$pass)
                        }
                        else{
                            SecureField("Ingresar contraseña", text: self.$pass)
                        }
                        
                        Button(action:{
                            self.visible.toggle()
                        }){
                            Image(systemName: "eye")
                                .foregroundColor(.black)
                        }
                        
                    }
                    .padding(.vertical, 20)
                    
                }
                .padding(.vertical)
                .padding(.horizontal, 20)
                .padding(.bottom, 40)
                .background(Color.white)
                .cornerRadius(10)
                .padding(.top, 25)
                
                Button(action: {
                    self.verify()
                }){
                    
                    Text("LOGIN")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 100)
                    
                }
                .background(LinearGradient(gradient: .init(colors:[Color(.white),
                                                                   Color("primary"),
                                                                   Color("primary"),
                                                                   Color("primary")
                                                                    ]),
                                        startPoint: .leading,
                                        endPoint: .trailing)
                )
                .cornerRadius(8)
                .offset(y: -40)
                .padding(.bottom, -40)
                .shadow(radius: 15)
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
        .padding(.vertical, 25)
    }
    
    func verify(){
        
        if self.mail == "" && self.pass == ""
        {
            self.error = "Por favor llene las credenciales solicitadas."
            self.alert.toggle()
        }
        else if self.mail == ""
        {
            self.error = "Debe ingresar credencial de usuario."
            self.alert.toggle()
        }
        else if self.pass == ""
        {
            self.error = "Debe ingresar credencial para contraseña."
            self.alert.toggle()
        }
        else
        {
            /*
            Auth.auth().signIn(withEmail: self.mail, password: self.pass){
                (res, err) in
                
                if err != nil {
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
            */
            
            print("entrar al Home")
            
            //HomeController()
        }
    }
}

struct SignUp: View {
    
    @State var mail = ""
    @State var pass = ""
    @State var repass = ""
    @State var visiblePass = false
    @State var visibleRePass = false
    @State var alert = false
    @State var error = ""
    
    var body: some View{
        
        ZStack{
            
        VStack{
            
            VStack{
                
                HStack(spacing: 15){
                    
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    
                    TextField("Ingresar usuario", text: self.$mail)
                }
                .padding(.vertical, 20)
                
                
                Divider()
                
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    if self.visiblePass{
                        TextField("Ingresar contraseña", text: self.$pass)
                    }
                    else{
                        SecureField("Ingresar contraseña", text: self.$pass)
                    }
                    
                    Button(action:{
                            self.visiblePass.toggle()
                    }){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    
                }.padding(.vertical, 20)
                
                
                Divider()
                
                
                HStack(spacing: 15) {
                    
                    Image(systemName: "lock")
                        .resizable()
                        .frame(width: 15, height: 18)
                        .foregroundColor(.black)
                    
                    
                    if self.visibleRePass{
                        TextField("Confirmar contraseña", text: self.$repass)
                    }
                    else{
                        SecureField("Confirmar contraseña", text: self.$repass)
                    }
                    
                    Button(action:{
                            self.visibleRePass.toggle()
                    }){
                        Image(systemName: "eye")
                            .foregroundColor(.black)
                    }
                    
                }
                .padding(.vertical, 20)
            }
            .padding(.vertical)
            .padding(.horizontal, 20)
            .padding(.bottom, 40)
            .background(Color .white)
            .cornerRadius(10)
            .padding(.top, 25)
            
            Button(action: {
                    self.verify()
            }){
                
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 100)
                
            }
            .background(LinearGradient(gradient: .init(colors:[Color("primary"),
                                                               Color("primary"),
                                                               Color(.white)]
            ),
            startPoint: .leading,
            endPoint: .trailing))
            .cornerRadius(8)
            .offset(y: -40)
            .padding(.bottom, -40)
            .shadow(radius: 15)
        }
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
            }
        }
    }
    
    func verify(){
        
        if self.mail == "" && self.pass == "" && self.repass == ""
        {
            self.error = "Por favor llene las credenciales solicitadas."
            self.alert.toggle()
        }
        else if self.mail == ""
        {
            self.error = "Debe ingresar credencial de usuario."
            self.alert.toggle()
        }
        else if self.pass == ""
        {
            self.error = "Debe ingresar credencial para contraseña."
            self.alert.toggle()
        }
        else if self.repass == ""
        {
            self.error = "Por favor confirme su contraseña."
            self.alert.toggle()
        }
        else
        {
            Auth.auth().createUser(withEmail: self.mail, password: pass){
                (res, err) in
                
                if err != nil{
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("success")
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
            
        }
    }

}

struct ErrorView: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                
                HStack{
                    
                    Text("Error")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action:{
                    self.alert.toggle()
                }){
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width-120)
                }
                .background(Color("primary"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width-32)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.25).edgesIgnoringSafeArea(.all))
        .cornerRadius(15)
    }
}



