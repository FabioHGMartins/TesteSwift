//
//  ListaCarrosViewController.swift
//  TesteSwift
//
//  Created by Fabio Martins on 13/08/18.
//  Copyright © 2018 Fabio Martins. All rights reserved.
//

import UIKit

class ListaCarrosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    var carros:Array<Carro> = []
    var tipo = "classicos"
    
    // trava a orientacao na vertical
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Carros"
        self.carros = CarroService.getCarrosByTipoFromFile("esportivos")        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        let xib = UINib(nibName: "CarroCell", bundle: nil) // xib que será o que vai inflar
        self.tableView.register(xib, forCellReuseIdentifier: "cell") // registra o xib na tabela que será inflada
        
        self.buscarCarros()
    }
    
    @IBAction func alterarTipo(sender: UISegmentedControl) {
        let idx = sender.selectedSegmentIndex
        switch idx {
        case 0:
            self.tipo = "classicos"
        case 1:
            self.tipo = "esportivos"
        default:
            self.tipo = "luxo"
        }
        self.buscarCarros()
    }
    
    func buscarCarros() {
        self.carros = CarroService.getCarrosByTipoFromFile(tipo)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.carros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! CarroCell     // Cast da célula para CarroCell
        let linha = indexPath.row
        let carro = self.carros[linha]
        
        cell.cellNome.text = carro.nome
        cell.cellDesc.text = carro.desc
        
        let data = try! Data(contentsOf: URL(string: carro.url_foto)!)
            cell.cellImg.image = UIImage(data: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let linha = indexPath.row
        let carro = self.carros[linha]
        
        let vc = DetalhesCarroViewController(nibName: "DetalhesCarroViewController", bundle: nil)
        vc.carro = carro
        self.navigationController!.pushViewController(vc, animated: false)
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("viewWillTransitionToSize \(size)")
        if(size.width > size.height) {
            print("Horizontal")
        } else {
            print("Vertical")
        }
    }
    
}
