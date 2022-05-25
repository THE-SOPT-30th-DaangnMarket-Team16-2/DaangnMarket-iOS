//
//  HeaderType.swift
//  DaangnMarket-iOS
//
//  Created by Junho Lee on 2022/05/21.
//

import Foundation

enum HeaderType {
    case `default`
    case withToken
    case multiPart
    case multiPartWithToken
}

enum HTTPHeaderField: String {
    case contentType = "Content-Type"
    case accesstoken = "accesstoken"
}

enum HeaderContent: String {
    case json = "Application/json"
    case multiPart = "multipart/form-data"
    case tokenSerial = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzcsImVtYWlsIjoicnhzd2lmdEBnbWFpbC5jb20iLCJuaWNrbmFtZSI6IuyVjO2MjOqzoCIsImZpcmViYXNlSWQiOiJ0TkduU2NUQk1FZ09keUExbjBVREFTNDVEazIyIiwiaWF0IjoxNjUxNzI1MjI3LCJleHAiOjE2NjAzNjUyMjcsImlzcyI6InZlZ2luIn0.AMMoc813wUVe8wa65-39EqQmUZ5dWP9CtI2hTgenXP0"
}
