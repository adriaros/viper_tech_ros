//
//  WeatherResponse.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation

struct WeatherResponse: Codable {
    let descripcion: String?
    let estado: Int?
    let datos, metadatos: String?
}

struct WeatherDetailResponse: Codable {
    let origen: Origen?
    let elaborado, nombre, provincia: String?
    let prediccion: Prediccion?
    let id, version: String?
}

struct Origen: Codable {
    let productor: String?
    let web, enlace: String?
    let language, copyright: String?
    let notaLegal: String?
}

struct Prediccion: Codable {
    let dia: [Dia]?
}

struct Dia: Codable {
    let estadoCielo: [EstadoCielo]?
    let precipitacion, probPrecipitacion, probTormenta, nieve: [SharedInfo]?
    let probNieve, temperatura, sensTermica, humedadRelativa: [SharedInfo]?
    let vientoAndRachaMax: [VientoAndRachaMax]?
    let fecha, orto, ocaso: String?
}

struct EstadoCielo: Codable {
    let value, periodo, descripcion: String?
}

struct SharedInfo: Codable {
    let value, periodo: String?
}

struct VientoAndRachaMax: Codable {
    let direccion, velocidad: [String]?
    let periodo, value: String?
}
