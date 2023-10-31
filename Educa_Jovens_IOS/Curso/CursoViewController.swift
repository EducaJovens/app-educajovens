import UIKit

class CursoViewController: UIViewController {
    
    private let curso: [Curso] = [
        .init(name: "Abrir conta", descricao: "Como abrir uma finança", imageURL: ""),
        .init(name: "Finanças", descricao: "Como abrir uma conta no banco", imageURL: ""),
        .init(name: "Investimento", descricao: "Como fazer o seu primeiro investimento", imageURL: ""),
        .init(name: "Cartão de Crédito", descricao: "Como abrir um cartão de crédito", imageURL: "")
    ]
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight:.bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Cursos"
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

extension CursoViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        curso.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CursoCell()
        let curso = curso[indexPath.row]
        cell.setup(curso: curso)
        
        return cell
    }
}

extension CursoViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Tarefa", bundle: Bundle(for: TarefaViewController.self))
        let tarefaViewController = storyboard.instantiateViewController(withIdentifier: "Tarefa")
        navigationController?.pushViewController(tarefaViewController, animated: true)
    }
}
