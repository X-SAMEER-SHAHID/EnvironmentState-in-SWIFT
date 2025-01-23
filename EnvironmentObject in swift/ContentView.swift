//
//  ContentView.swift
//  EnvironmentObject in swift
//
//  Created by Sameer,s Macbook on 1/23/25.
//
 // if  we have some parent view like the screenshot and 3rd level want some info from the first one

// import SwiftUI
// struct lightbuldview : View {
//     @Binding var isOn : Bool
    
//     var body: some View {
//         VStack{
//             Image(systemName: "lightbulb")
//                 .font(.largeTitle)
//                 .foregroundColor(isOn ? .yellow : .black)
//             Button("Toggle"){
//                 isOn.toggle()
//             }
//             .foregroundColor(.black)
//         }
//     }
// }



// struct lightRoomView : View {
//     @Binding var isOn : Bool
//     var body: some View {
//         lightbuldview(isOn : $isOn)
//     }
// }

 



// struct ContentView: View {
//     @State private var islighton: Bool = false
    
//     var body: some View {
//         VStack{
    
//             lightRoomView(isOn: $islighton)
//         }
//         .frame(maxWidth: .infinity, maxHeight: .infinity)

//         .background(islighton ? .blue : .red)
       
//     }
// }

// #Preview {
//     ContentView()
// }


// now we use global varible for bypassing that





// import SwiftUI

// class Appstate : ObservableObject{
//     @Published var isOn : Bool = false
// }


// struct lightbuldview : View {
//     @EnvironmentObject private var appstate: Appstate
    
//     var body: some View {
//         VStack{
//             Image(systemName: "lightbulb")
//                 .font(.largeTitle)
//                 .foregroundColor(appstate.isOn ? .yellow : .black)
//             Button("Toggle"){
//                 appstate.isOn.toggle()
//             }
//             .foregroundColor(.black)
//         }
//     }
// }



// struct lightRoomView : View {
//     var body: some View {
//         lightbuldview()
//     }
// }

 



// struct ContentView: View {
//     @EnvironmentObject private var appstate: Appstate
    
//     var body: some View {
//         VStack{
    
//             lightRoomView()
//         }
//         .frame(maxWidth: .infinity, maxHeight: .infinity)

//         .background(appstate.isOn ? .blue : .red)
       
//     }
// }

// #Preview {
//     // we injected the enviromentobject tp parent and all of its child have the acesss 
//     ContentView()
//         .environmentObject(Appstate())
// }


// post ios 17 version that is more use today


import SwiftUI
import Observation


@Observable
class Appstate  {
         var isOn : Bool = false
}


struct lightbuldview : View {
    @Environment(Appstate.self) private var appstate: Appstate
    
    var body: some View {
        // for toggle
        @Bindable var  appstate = appstate
        
        VStack{
            Image(systemName: "lightbulb")
                .font(.largeTitle)
                .foregroundColor(appstate.isOn ? .yellow : .black)

            // that will work in the pre ios version
           // Toggle("IsOn", isOn: $appstate.isOn)
            
            Toggle("IsOn", isOn: $appstate.isOn)
            
            // you have to use bindable
            .foregroundColor(.black)
        }
    }
}



struct lightRoomView : View {
    var body: some View {
        lightbuldview()
    }
}

 



struct ContentView: View {
    
    @Environment(Appstate.self) private var appstate: Appstate
    
    var body: some View {
        VStack{
    
            lightRoomView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)

        .background(appstate.isOn ? .blue : .red)
       
    }
}

#Preview {
    // we injected the enviromentobject tp parent and all of its child have the acesss 
    ContentView()
        .environment(Appstate())
}



