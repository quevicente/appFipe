import UIKit
import Alamofire

class PrecosViewController: UIViewController {
    
    //O que eu preciso pra puxar os dados de valor?
    //Preciso do ID fixo da marca - ok
    //Preciso do ID fixo do modelo - ok
    //Preciso do ID fixo do ano - ok
    
    var marcaSelecionadaFixa: String?
    var modeloSelecionadoFixo: Int?
    var anoSelecionadoFixo: String?
    
    var nomeModelo: String?
    var nomeMarca: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let marca = marcaSelecionadaFixa else { return }
        guard let modelo = modeloSelecionadoFixo else { return }
        guard let modeloNome = nomeModelo else { return }
        guard let marcaNome = nomeMarca else { return }
        guard let ano = anoSelecionadoFixo else { return }
        
        labelMarca.text = marcaNome
        labelModelo.text = modeloNome
        labelAno.text = ano
        
        getValorByID(id: ano, modelo: modelo, marca: marca)
    }
    
    @IBOutlet weak var labelMarca: UILabel!
    
    @IBOutlet weak var labelModelo: UILabel!
    
    @IBOutlet weak var labelAno: UILabel!
    
    @IBOutlet weak var labelValor: UILabel!
    
    func getValorByID(id: String, modelo: Int, marca: String){
        let url: String = "https://parallelum.com.br/fipe/api/v1/carros/marcas/\(marca)/modelos/\(modelo)/anos/\(id)"
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    guard let data = response.data else { return }
                    let dataDecode = try JSONDecoder().decode(ResponseValor.self, from: data)
//                    print(dataDecode)
                    if let valorText = dataDecode.Valor {
                        self.labelValor.text = valorText
                    }
                    
                }catch{
                    print("getValorByID: \(error)")
                }
            case .failure:
                print("Erro na requisição de getValorByID")
                
            }
        }
    }
}
