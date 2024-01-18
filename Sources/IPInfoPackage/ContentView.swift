//
//  ContentView.swift
//  FindMyIPLibaray
//
//  Created by APPLE on 18/01/24.
//

import SwiftUI


public struct ContentView: View {
    
    @ObservedObject private var viewModel = IPViewModel()
    @available(macOS 10.15.0, *)
    public var body: some View {
           VStack {
               if viewModel.isLoading {
                   if #available(iOS 14.0, *) {
                       if #available(macOS 11.0, *) {
                           if #available(iOS 14.0, *) {
                               ProgressView("Fetching the Data......")
                           } else {
                               // Fallback on earlier versions
                           }
                       } else {
                           // Fallback on earlier versions
                       }
                   } else {
                       // Fallback on earlier versions
                   }
               } else if let ipInfo = viewModel.ipInfo {
                   if let ip = ipInfo.ip {
                   Text(ip)
                   }
                   // Add more UI components for other information from the response
               } else if let error = viewModel.error {
                   Text("Error: \(error.localizedDescription)")
               }
           }
           .onAppear {
               viewModel.fetchIP()
           }
       }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
