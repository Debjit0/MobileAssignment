//
//  ApiService.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//
import Foundation

class ApiService : NSObject {
    private let baseUrl = ""
    private let sourcesURL = URL(string: "https://api.restful-api.dev/objects")!
    
    func getDevices()async throws -> [DeviceData]{
        var deviceList: [DeviceData] = []
        let (data,_) = try await URLSession.shared.data(from: sourcesURL)
        deviceList = try JSONDecoder().decode([DeviceData].self, from: data)
        print(deviceList[0].name)
        return deviceList
    }
}
