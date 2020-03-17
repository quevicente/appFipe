import UIKit
import Alamofire

class PesquisaViewController: UITableViewController {
    
    var listaMarcas: [ResponseMarcas] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaMarcas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        guard let marca = listaMarcas[indexPath.row].nome else { return cell }
        cell.textLabel?.text = marca
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let idMarcaSelecionada = listaMarcas[indexPath.row].codigo else { return }
        guard let marca = listaMarcas[indexPath.row].nome else { return }
        
        let storyBoard = UIStoryboard(name: "Modelos", bundle: nil)
        if let viewController = storyBoard.instantiateViewController(withIdentifier: "ModelosViewController") as? ModelosViewController {
            viewController.idMarcaSelecionada = idMarcaSelecionada
            viewController.nomeMarca = marca
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    override func viewDidLoad() {
        Fipe().getAllMarcas() { (response) in
            self.listaMarcas.append(contentsOf: response)
            self.tableView.reloadData()
        }
    }
}
