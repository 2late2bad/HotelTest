//
//  NetworkError.swift
//  HotelTest
//
//  Created by Alexander V. on 07.09.2023.
//

import Foundation

enum NetworkingError: LocalizedError {
    case incorrectURL(url: String)
    case badURLResponse(url: URL)
    case invalidResponse(code: Int)
    case unknown
    
    var errorDescription: String? {
        switch self {
        case .incorrectURL(url: let url): return "Некорректный URL: \(url)"
        case .badURLResponse(url: let url): return "Неудачный запрос по URL: \(url)"
        case .invalidResponse(code: let code): return "Недопустимый ответ от сервера, код: \(code)"
        case .unknown: return "Неизвестная ошибка"
        }
    }
}
