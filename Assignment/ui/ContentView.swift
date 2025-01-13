//
//  ContentView.swift
//  Assignment
//
//  Created by Kunal on 03/01/25.
//

import SwiftUI

struct ContentView: View{
    @StateObject var vm = ContentViewModel()
    var body: some View{
        NavigationView{
        VStack{
            SearchBar(searchText: $vm.searchText)
                if let devices = vm.data {
                    if !vm.filteredDevices.isEmpty{
                        List(vm.filteredDevices){d in
                            NavigationLink(destination: DetailView(device: d)){
                                Text(d.name)
                            }
                        }
                    }else{
                        Text("No devices")
                    }
                }else{
                    ProgressView("Loading")                }

            }
            .navigationTitle("Devices")
            .navigationBarTitleDisplayMode(.large)
            .onAppear{
                Task{
                    print("Hello")
                    await vm.getDevices()
                }
            }
        }
    }
}

struct SearchBar: View{
    @Binding var searchText: String
    var body:some View{
        TextField("Search", text: $searchText).padding(7)
    }
}
