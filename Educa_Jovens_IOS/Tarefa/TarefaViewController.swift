import UIKit

class TarefaViewController: UIViewController {
    
    private let tarefa: [Tarefa] = [
        .init(exer: "Crie uma conta", descexer: "Como abrir uma finança", imageURL: ""),
        .init(exer: "Como pedir cartão?", descexer: "Como abrir uma conta no banco", imageURL: ""),
        .init(exer: "Planeje seu futuro", descexer: "Como fazer o seu primeiro investimento", imageURL: ""),
        .init(exer: "Cartão de Crédito?", descexer: "Como abrir um cartão de crédito", imageURL: "")
    ]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight:.bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Tarefas"
        return label
    }()
    
    private let tableView:UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        addViewsInHierarchy()
        setupConstraints()
    }
    
    private func addViewsInHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension TarefaViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tarefa.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TarefaCell()
        let tarefa = tarefa[indexPath.row]
        cell.setup(tarefa: tarefa)
        
        return cell
    }
}

extension TarefaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Tarefa", bundle: Bundle(for: ConteudoViewController.self))
        let tarefaViewController = storyboard.instantiateViewController(withIdentifier: "Tarefa")
        navigationController?.pushViewController(tarefaViewController, animated: true)
    }
}
