//
//  Env.swift
//  CodoughUIKitSample
//
//  Created by Eimer on 2020/11/16.
//

import Foundation

var environmentName: String {
    #if DEBUG
    return "DEV"
    #elseif STAGING
    return "STG"
    #elseif PRODUCTION
    return "PROD"
    #else
    return "UNKNOWN"
    #endif
}
