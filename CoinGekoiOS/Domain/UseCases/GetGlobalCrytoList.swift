//
//  GetGlobalCrytoList.swift
//  CoinGekoiOS
//
//  Created by Arlen Peña on 19/04/24.
//

import Foundation

enum CryptoCurrencyDomainError: Error {
    case generic
}

protocol GlobalCrytoListRepositoryType {
    func getGlobalCryptoList() async -> Result<[CryptoCurrency], CryptoCurrencyDomainError>
}

class GetGlobalCrytoList{
    private let repository: GlobalCrytoListRepositoryType
    
    init(repository: GlobalCrytoListRepositoryType) {
        self.repository = repository
    }
    
    func execute() async -> Result<[CryptoCurrency],CryptoCurrencyDomainError> {
        let result = await repository.getGlobalCryptoList()
        
        guard let cryptoList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            return .failure(error)
        }
        
        return .success(cryptoList.sorted { $0.marketCap > $1.marketCap})
    }
}
