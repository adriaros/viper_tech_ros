//
//  ConfigParams.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

struct ConfigParams {
    
    struct Sizes {
        struct Selector {
            static let cellHeight = CGFloat(120)
        }
        struct Weather {
            static let cellHeight = CGFloat(120)
        }
    }
    
    struct Colors {
        
    }
    
}

enum SkyImage: String {
 
    case despejado = "Despejado"
    case poco_nuboso = "Poco nuboso"
    case intervalos_nubosos = "Intervalos nubosos"
    case nuboso = "Nuboso"
    case muy_nuboso = "Muy nuboso"
    case cubierto = "Cubierto"
    case nubes_altas = "Nubes altas"
    case intervalos_nubosos_con_lluvia = "Intervalos nubosos con lluvia"
    case nuboso_con_lluvia = "Nuboso con lluvia"
    case muy_nuboso_con_lluvia = "Muy nuboso con lluvia"
    case cubierto_con_lluvia = "Cubierto con lluvia"
    case cubierto_con_lluvia_escasa = "Cubierto con lluvia escasa"
    case intervalos_nubosos_con_nieve = "Intervalos nubosos con nieve"
    case nuboso_con_nieve = "Nuboso con nieve"
    case muy_nuboso_con_nieve = "Muy nuboso con nieve"
    case cubierto_con_nieve = "Cubierto con nieve"
    case chubascos = "Chubascos"
    case tormenta = "Tormenta"
    case granizo = "Granizo"
    case bruma = "Bruma"
    case niebla = "Niebla"
    case calima = "Calima"
    
    var image: UIImage {
        switch self {
        case .despejado: return UIImage(assetId: .sun)!
        case .poco_nuboso: return UIImage(assetId: .partially_cloudy)!
        case .intervalos_nubosos: return UIImage(assetId: .partially_cloudy)!
        case .nuboso: return UIImage(assetId: .cloudy)!
        case .muy_nuboso: return UIImage(assetId: .cloudy)!
        case .cubierto: return UIImage(assetId: .cloudy)!
        case .nubes_altas: return UIImage(assetId: .partially_cloudy)!
        case .intervalos_nubosos_con_lluvia: return UIImage(assetId: .rain)!
        case .nuboso_con_lluvia: return UIImage(assetId: .rain)!
        case .muy_nuboso_con_lluvia: return UIImage(assetId: .rain)!
        case .cubierto_con_lluvia: return UIImage(assetId: .rain)!
        case .cubierto_con_lluvia_escasa: return UIImage(assetId: .rain)!
        case .intervalos_nubosos_con_nieve: return UIImage(assetId: .snow)!
        case .nuboso_con_nieve: return UIImage(assetId: .snow)!
        case .muy_nuboso_con_nieve: return UIImage(assetId: .snow)!
        case .cubierto_con_nieve: return UIImage(assetId: .sun)!
        case .chubascos: return UIImage(assetId: .rain)!
        case .tormenta: return UIImage(assetId: .electric)!
        case .granizo: return UIImage(assetId: .hail)!
        case .bruma: return UIImage(assetId: .fog)!
        case .niebla: return UIImage(assetId: .fog)!
        case .calima: return UIImage(assetId: .fog)!
        }
    }
}
