//
//  SubPhaseData.swift
//  PA TOOLS
//
//  Created by Olivier Jobin on 18/09/2023.
//

import SwiftUI

let subPhaseData: [String: [String: [String: String]]] = [
  
    "SB28": [
        "60": ["K1": "-", "K2": "-", "K3": "-","KARA II": "-"],
        "60C": ["K1": "-", "K2": "-", "K3": "-","KARA II": "-"],
        "60Cx": ["K1": "-", "K2": "-", "K3": "-","KARA II": "+"],
        "100": ["KARA II": "+"],
        "100C": ["KARA II": "+"],
        "100Cx": ["KARA II": "-"],
    ],
    
    "KS28": [
        "60": ["K1": "-", "K2": "-", "K3": "-","KARA II": "-", "L2": "+"],
        "60C": ["K1": "-", "K2": "-", "K3": "-","KARA II": "-", "L2": "+"],
        "60Cx": ["K1": "-", "K2": "-", "K3": "-","KARA II": "+", "L2": "+"],
        "100": ["KARA II": "+"],
        "100C": ["KARA II": "+"],
        "100Cx": ["KARA II": "-"],
    ],
    

    
    "SB18": [
        "60": ["KARA II": "+"],
        "60C": ["KARA II": "+"],
        "60Cx": ["KARA II": "-"],
        "100": ["KARA II": "+", "X15": "-", "X12": "+"],
        "100C": ["KARA II": "+", "X15": "-", "X12": "+"],
        "100Cx": ["KARA II": "-", "X15": "+", "X12": "-"],
    ],
    "KS21": [
        "60": ["K3": "-","KARA II": "+", "A15": "+"],
        "60C": ["K3": "-","KARA II": "+", "A15": "-"],
        "60Cx": ["K3": "+","KARA II": "-", "A15": "+"],
        "100": ["KARA II": "+", "A10": "+", "X15": "+", "X12": "+"],
        "100C": ["KARA II": "+", "A10": "+", "X15": "+", "X12": "+"],
        "100Cx": ["KARA II": "-", "A10": "+", "X15": "-", "X12": "-"],
    ],
    "SB15M": [
        "100": ["KIVA II": "+", "X12": "-"],
        "100C": ["KIVA II": "+", "X12": "-"],
        "100Cx": ["KIVA II": "-", "X12": "-"],
        
    ]
]