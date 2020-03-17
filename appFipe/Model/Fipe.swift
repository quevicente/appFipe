//
//  Fipe.swift
//  appFipe
//
//  Created by Vicente Patricio on 19/02/20.
//  Copyright © 2020 Vicente Patricio. All rights reserved.
//

import Foundation
import Alamofire

class Fipe {
    
    func getAllMarcas(completion: @escaping([ResponseMarcas]) -> ()){
        let urlAllMarcas: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas"
        
        AF.request(urlAllMarcas, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseJSON{(response) in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else { return }
                    let dataDecode = try JSONDecoder().decode(Array<ResponseMarcas>.self, from: data)
                    completion(dataDecode)
                }catch {
                    print("getAllMarcas: \(error)")
                }
            case .failure:
                print("Erro na requisição de getAllMarcas")
            }
        }
    }
    
    func getAnos(id: String, codigo: Int, completion: @escaping([Anos]) -> ()){
        let urlAnos: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos/\(codigo)/anos"
        
        AF.request(urlAnos, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else { return }
                    let dataDecode = try JSONDecoder().decode(Array<Anos>.self, from: data)
                    completion(dataDecode)
                } catch {
                    print("getAnos: \(error)")
                }
            case .failure:
                print("Erro na requisição de getAno")
            }
        }
    }
    
    func getCarrosByMarca(id: String, completion: @escaping([Modelos]) -> ()) {
        let urlModelos: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(id)/modelos"
        
        AF.request(urlModelos, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else { return }
                    let dataDecode = try JSONDecoder().decode(ResponseModelos.self, from: data)
                    guard let modelos = dataDecode.modelos else { return }
                    completion(modelos)
                }catch{
                    print("getCarrosByMarca: \(error)")
                }
            case .failure:
                print("Erro na requisição de getCarrosByMarca")
                
            }
        }
    }
}
