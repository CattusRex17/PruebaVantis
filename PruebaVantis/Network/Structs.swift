//
//  Structs.swift
//  PruebaVantis
//
//  Created by Mauricio Rodriguez on 8/22/19.
//  Copyright © 2019 Mauricio Rodriguez. All rights reserved.
//

import Foundation

// MARK: - Information
struct Information: Codable {
    let message, token: String
    let dtoUser: DtoUser
    let modules: [Module]
    let color, colorHexadecimal, logoCompania: String
}

// MARK: - DtoUser
struct DtoUser: Codable {
    let idUsuario: Int
    let nombre, correo, usuario: String
    let idRol: Int
    let idUsuarioIngresa, idUsuarioModifica: Int
    let idCompania: Int
    let fechaIngreso, fechaModificacion: String
    let idEstatus: Int
}

// MARK: - Module
struct Module: Codable {
    let idModulo: Int
    let descripcion: String
    let esPadre, padre: Int
    let clase: String
}
