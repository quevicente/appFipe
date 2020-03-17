//
//  ValorFinal.swift
//  appFipe
//
//  Created by Vicente Patricio on 12/03/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import Foundation

struct ResponseValor: Codable {
    let Valor: String?
    let Marca: String?
    let Modelo: String?
    let AnoModelo: Int?
    let Combustivel: String?
    let CodigoFipe: String?
    let MesReferencia: String?
    let TipoVeiculo: Int?
    let SiglaCombustivel: String?
}
