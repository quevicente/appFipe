import UIKit

class AnosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaAnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        guard let nome = listaAnos[indexPath.row].nome else { return cell }
        cell.textLabel?.text = nome
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let idAnoSelecionado = listaAnos[indexPath.row].codigo else { return }
        guard let idModeloSelecionado = listaModelos[indexPath.row].codigo else { return }
        guard let modelo = listaModelos[indexPath.row].nome else { return }
        
        let storyBoard = UIStoryboard(name: "Precos", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "PrecosViewController") as? PrecosViewController else {  return }
        viewController.anoSelecionadoFixo = idAnoSelecionado
        viewController.modeloSelecionadoFixo = idModeloSelecionado
        viewController.marcaSelecionadaFixa = idMarca
        viewController.nomeModelo = modelo
        viewController.nomeMarca = self.nomeMarca
        
        present(viewController, animated: true, completion: nil)
        
    }
    
    var listaAnos: [Anos] = []
    var listaModelos: [Modelos] = []
    var idMarca: String?
    var nomeMarca: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
