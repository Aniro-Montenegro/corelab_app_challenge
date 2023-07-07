class Product {
  late int id;
  late String name;
  late String description;
  late String image;
  late double price;
  late int stock;
  late String paymentForm;
  late String category;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.stock,
    required this.paymentForm,
    required this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      stock: json['stock'],
      paymentForm: json['paymentForm'],
      category: json['category'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'image': image,
        'price': price,
        'stock': stock,
        'paymentForm': paymentForm,
        'category': category,
      };

  static List<Product> products = [
    Product(
      id: 1,
      name: 'Captopril 50mg',
      description:
          'Captopril é um fármaco do tipo iECA, inibidor da enzima conversora da angiotensina I. Sua principal indicação é para tratamento de hipertensão arterial e alguns casos de insuficiência cardíaca.',
      image: 'assets/captopril.jpeg',
      price: 10.00,
      stock: 10,
      paymentForm: 'Em até 12x de R\$ 2,49',
      category: 'Medicamentos',
    ),
    Product(
      id: 2,
      name: 'Paraetamol 500mg',
      description:
          'O paracetamol, também conhecido por acetaminofeno, é um fármaco com propriedades analgésicas e antipiréticas utilizado essencialmente para tratar a febre e a dor leve e moderada, embora existam poucas evidências de que o seu uso seja realmente eficaz no alívio da febre em crianças.',
      image: 'assets/paracetamol.jpeg',
      price: 5.00,
      stock: 10,
      paymentForm: 'Em até 12x de R\$ 0,49	',
      category: 'Medicamentos',
    ),
    Product(
      id: 3,
      name: 'Plasil 10mg',
      description:
          'Metoclopramida é um fármaco utilizado pela medicina no tratamento de distúrbios na motilidade gastrointestinal. É um bloqueador dopaminérgico, antiemético e estimulante peristáltico. Este fármaco é antagonista dos receptores dopaminérgicos D2..',
      image: 'assets/plasil.jpeg',
      price: 7.00,
      stock: 10,
      paymentForm: 'Em até 12x de R\$ 0,69	',
      category: 'Medicamentos',
    ),
    Product(
      id: 4,
      name: 'Redoxon 1g',
      description:
          'Um sistema imunológico forte e eficiente é fundamental para a saúde do corpo. Por isso, Redoxon® usa seus 80 anos de experiência em cuidado imunológico para fornecer a você os produtos que ajudam a fortalecer sua imunidade a cada dia..',
      image: 'assets/redoxon.jpeg',
      price: 3.00,
      stock: 10,
      paymentForm: 'Em até 12x de R\$ 0,29	',
      category: 'Medicamentos',
    ),
    Product(
      id: 5,
      name: 'Plano de Camper',
      description:
          'Acessórios para Prótese Plano de Camper com Inclinação de 15°.\nPlano de Camper com Inclinação de 15°.\nSuporte utilizado para montagem estandarizada do modelo superior no articulador.',
      image: 'assets/plano_camper.jpeg',
      price: 81.60,
      stock: 10,
      paymentForm: 'Em até 12x de R\$ 8,00',
      category: 'Proteses dentárias',
    ),
    Product(
      id: 6,
      name: 'Garfo para Desdentado',
      description:
          'Produto utilizado para o registro de pacientes desdentados totais com o Arco Facial. Foi desenvolvido e projetado através de testes clínicos realizados na Universidade de São Paulo – Faculdade de Odontologia de Bauru pelo Prof. Dr. Conti.',
      image: 'assets/garfo_desdentado.jpeg',
      price: 62.40,
      stock: 5,
      paymentForm: 'Em até 12x de R\$ 6,00',
      category: 'Proteses dentárias',
    ),
    Product(
      id: 7,
      name: 'Broca 703 Alta Rotação',
      description:
          'Fabricada em carboneto de tungstênio. Ultra resistente a fraturas melhor balanceamento. Sua composição especial de carboneto de tungstênio e a sua incrível afiação asseguram a melhor durabilidade. Corte espiral fissurado.Disponibilidade: 1 a 7 dias úteis.',
      image: 'assets/broca.jpeg',
      price: 155.00,
      stock: 5,
      paymentForm: 'Em até 12x de R\$ 6,00',
      category: 'Brocas',
    ),
    Product(
      id: 8,
      name: 'Enxerto Ósseo Lumina',
      description:
          'LUMINA-BONE é um produto direcionado a todas as técnicas de preenchimento. É um excelente recurso material para preservação de alvéolos pós exodontia e preenchimento de gap entre o implante e a parede vestibular de modo seguro simples e econômico.Disponibilidade: 1 a 7 dias úteis..',
      image: 'assets/enxerto_osseo.jpeg',
      price: 155.00,
      stock: 5,
      paymentForm: 'Em até 12x de R\$ 6,00',
      category: 'Biomateriais',
    ),
  ];
  static List<String> dentalCategories = [
    'Anestesicos e agulhas',
    'Escovas de dentes',
    'Pastas de dentes',
    'Enxaguantes bucais',
    'Fios dentais',
    'Kit de clareamento dental',
    'Próteses dentárias',
    'Anestésicos dentais',
    'Materiais restauradores',
    'Instrumentos odontológicos',
    'Máscaras e luvas descartáveis',
    'Proteses dentárias',
    'Biomateriais',
    'Brocas'
  ];
}
