import UIKit

class CursoCell: UITableViewCell {
    private let horinzontalStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16
        stack.backgroundColor = .blue
        stack.layer.cornerRadius = 16
        return stack
    }()
    
    private let cursoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 18
        imageView.layer.masksToBounds = true
        imageView.backgroundColor = .blue
        return imageView
    }()
    
    private let verticalStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .equalCentering
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private let descricaoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .lightGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        addViewInHierarchy()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
  
    public func setup(curso: Curso) {
        nameLabel.text = curso.name
       
    }
    
    private func setupView() {
        selectionStyle = .none
        
    }
    
    private func addViewInHierarchy() {
        contentView.addSubview(horinzontalStack)
        horinzontalStack.addArrangedSubview(cursoImageView)
        horinzontalStack.addArrangedSubview(verticalStack)
        verticalStack.addArrangedSubview(UIView())
        verticalStack.addArrangedSubview(nameLabel)
        verticalStack.addArrangedSubview(descricaoLabel)
        verticalStack.addArrangedSubview(UIView())
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            horinzontalStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            horinzontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            horinzontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            horinzontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            cursoImageView.widthAnchor.constraint(equalToConstant: 90),
            cursoImageView.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
}
