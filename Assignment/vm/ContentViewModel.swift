//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


class ContentViewModel : ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    @Published var searchText: String = ""
    
    //search functionality
    var filteredDevices: [DeviceData]{
        guard let data = data else{return []}
        if searchText.isEmpty{
            return data
        }else{
            return data.filter{$0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    //fetch device from apiService
    func getDevices()async{
        print("Called")
        do{
            data = try await apiService.getDevices()
        }catch{
            print("Error in ViewModel")
        }
    }
    
}
