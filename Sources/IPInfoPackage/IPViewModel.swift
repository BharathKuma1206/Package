//
//  File.swift
//  
//
//  Created by APPLE on 18/01/24.
//



import Foundation
import Combine

@available(iOS 13.0, *)
@available(macOS 10.15, *)
class IPViewModel: ObservableObject {
    @Published var ipInfo: IPInfo?
    @Published var error: Error?
    @Published var isLoading = false

    private var cancellables: Set<AnyCancellable> = []

    func fetchIP() {
        isLoading = true
        FindMyIP.fetchIP()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                self.isLoading = false
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                }
            }, receiveValue: { ipInfo in
                self.ipInfo = ipInfo
            })
            .store(in: &cancellables)
    }
}
