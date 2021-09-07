//
//  ResponseData.swift
//  vlBitcoin
//
//  Created by Brian Aboytes Morales on 07/09/21.
//

import Foundation

struct ResponseData: Codable {
    var symbol: String
    var price_24h: Double
    var volume_24h: Double
    var last_trade_price: Double
}
