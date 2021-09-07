//
//  ViewController.swift
//  vlBitcoin
//
//  Created by Brian Aboytes Morales on 06/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblunidad: UILabel!
    @IBOutlet weak var btnActualizar: UIButton!
    
    @IBOutlet weak var txtvalue: UITextField!
    
    private var viewModel: ViewModel = ViewModel()
    
    private var valMoneda = ["USD", "GBP", "EUR"]
    private var Description = ["Unided State Dolar", "Great Britain pound", "Euro"]
    private var strVal = 0
    private var data: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtvalue.isUserInteractionEnabled = false
        self.getData()
    }
    
    /**
                Valor del segmento cliqueado
     */
    
    @IBAction func didChangeSegment(_ sender: UISegmentedControl) {
        self.strVal = sender.selectedSegmentIndex
        self.getData()
        self.lblunidad?.text = self.Description[self.strVal]
    }
    
    /**
                Genera una nueva peticion al servicio para actualizar el valor de la moneda
     */
    
    
    @IBAction func btnUpdate(_ sender: Any) {
        self.getData();
    }
    
    /**
                Obtencion de datos del servicio API
     */
    private func getData(){
        self.viewModel.executeApi(moneda: self.valMoneda[self.strVal], bitcoinCompletionHandler: { bitcoinvalue, error in
            if let bitcoinvalue = bitcoinvalue {
                print(bitcoinvalue.price_24h)
                self.data = String (bitcoinvalue.price_24h)
            }
        })
    self.txtvalue.text = self.data
        
    }
    
}

