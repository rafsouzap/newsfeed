//
//  RequestError.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

enum RequestError {
    case noAuthorized
    case notFound
    case timeOut
    case invalidUrl
    case invalidResponse
    case notMapped
    
    var code: Int {
        switch self {
        case .noAuthorized: return 403
        case .notFound: return 404
        case .timeOut: return 504
        default: return 0
        }
    }
    
    var description: String {
        switch self {
        case .noAuthorized: return "Solicitação não autorizada"
        case .notFound: return "Recurso solicitado não encontrado"
        case .timeOut: return "Tempo de comunicação com o servidor excedido"
        case .invalidUrl: return "URL inválida"
        case .invalidResponse: return "Resposta inválida"
        default: return "Falha na comunicação com o servidor"
        }
    }
    
    init(code: Int) {
        switch code {
        case 403: self = .noAuthorized
        case 404: self = .notFound
        case 504: self = .timeOut
        default: self = .notMapped
        }
    }
}
