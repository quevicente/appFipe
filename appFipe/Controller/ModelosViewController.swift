import UIKit
import Alamofire

class ModelosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        guard let nome = modelos[indexPath.row].nome else { return cell }
        cell.textLabel?.text = nome
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let idModeloSelecionado = modelos[indexPath.row].codigo else { return }
        guard let idMarcaSelecionada = idMarcaSelecionada else { return }
        
        Fipe().getAnos(id: idMarcaSelecionada, codigo: idModeloSelecionado) { (response) in
            let storyBoard = UIStoryboard(name: "Anos", bundle: nil)
            guard let viewController = storyBoard.instantiateViewController(withIdentifier: "AnosViewController") as? AnosViewController else { return }
            
            viewController.listaAnos = response
            viewController.listaModelos = self.modelos
            viewController.idMarca = idMarcaSelecionada
            viewController.nomeMarca = self.nomeMarca
            
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    @IBOutlet weak var tableViewModelos: UITableView!
    
    var modelos: [Modelos] = []
    
    var idMarcaSelecionada: String?
    var nomeMarca: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let id = idMarcaSelecionada else { return }
        
        Fipe().getCarrosByMarca(id: id) { (response) in
            self.modelos = response
            self.tableViewModelos.reloadData()
        }
    }
}
