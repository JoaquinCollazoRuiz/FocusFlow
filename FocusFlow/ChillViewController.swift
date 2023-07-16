//
//  ChillViewController.swift
//  FocusFlow
//
//  Created by Joaquín Collazo Ruiz on 29/6/23.
//

import UIKit

class ChillViewController: UIViewController {

    var timer: Timer?
    var contador = 0
    @IBOutlet weak var figureIcon: UIImageView!
    @IBOutlet weak var chronoText: UILabel!
    var receivedData: Bool?
    var darkModeOn = false

    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actualizarContador), userInfo: nil, repeats: true)
        
        if receivedData != nil {
            // Utiliza la variable "data" para configurar tu interfaz de usuario
            // por ejemplo, asignar el texto a una etiqueta
            darkModeOn = receivedData!
            
            if darkModeOn == true{
                self.view.backgroundColor = UIColor.black
                figureIcon.tintColor = UIColor.white
                chronoText.textColor = UIColor.white
            }else{
                self.view.backgroundColor = UIColor.white
                figureIcon.tintColor = UIColor.black
                chronoText.textColor = UIColor.black
            }
        }
        
    }
    
    @objc func actualizarContador() {
        // Incrementar el contador y actualizar la etiqueta en la interfaz de usuario
        contador += 1
        actualizarEtiqueta()
    }
    
    func actualizarEtiqueta() {
        // Obtener los minutos y segundos a partir del contador
        let minutos = contador / 60
        let segundos = contador % 60
        
        // Formatear los minutos y segundos con dos dígitos cada uno
        let minutosFormateados = String(format: "%02d", minutos)
        let segundosFormateados = String(format: "%02d", segundos)
        
        // Actualizar la etiqueta en la interfaz de usuario con el valor formateado
        // Supongamos que tienes una etiqueta llamada "contadorLabel" en tu interfaz de usuario
        chronoText?.text = "\(minutosFormateados):\(segundosFormateados)"
    }
}
