//
//  FindMyIP.swift
//  FindMyIPLibaray
//
//  Created by APPLE on 18/01/24.
//

import Foundation

import Combine
import Alamofire

public class FindMyIP {
    @available(macOS 10.15, *)
    static func fetchIP() -> AnyPublisher<IPInfo, Error> {
          let url = "https://ipapi.co/json/"

          return AF.request(url)
              .publishDecodable(type: IPInfo.self)
              .value()
              .mapError { $0 as Error }
              .eraseToAnyPublisher()
      }
}
