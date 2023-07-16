//
//  ViewController.swift
//  FocusFlow
//
//  Created by Joaquín Collazo Ruiz on 28/6/23.
//

import UIKit


class ViewController: UIViewController {
    
    var contador = 0
    @IBOutlet weak var stopChronoButton: UIButton!
    @IBOutlet weak var chronoButton: UIButton!
    var timer: Timer?
    @IBOutlet weak var switchMode: UISwitch!
    @IBOutlet weak var chrono_Text: UITextView!
    @IBOutlet weak var restartButton: UIButton!
    @IBOutlet weak var moonButton: UIButton!
    @IBOutlet weak var figureImage: UIImageView!
    var darkModeOn = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func stopChrono(_ sender: Any) {
        chronoButton.isEnabled = true
        stopChronoButton.isEnabled = false
        timer?.invalidate()
    }
    
    @IBAction func chronoController(_ sender: Any) {
        //startTimer()
    }
    
    func startTimer() {
         // Crear un temporizador que se repite cada segundo y llama a la función "actualizarContador"
        
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actualizarContador), userInfo: nil, repeats: true)
            let selectedImage = UIImage(systemName: "play")
            chronoButton.setImage(selectedImage, for: .normal)
     }
    
    @IBAction func restartChrono(_ sender: Any) {
        timer?.invalidate()
        timer = nil
        
        chronoButton.isEnabled = true
        stopChronoButton.isEnabled = true

        
        // Reiniciar los segundos y actualizar la etiqueta
        contador = 0
        chrono_Text.text = "00:00"
        
    }
    
    @IBAction func startChrono(_ sender: Any) {
        chronoButton.isEnabled = false
        stopChronoButton.isEnabled = true

        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(actualizarContador), userInfo: nil, repeats: true)
        let selectedImage = UIImage(systemName: "play")
        chronoButton.setImage(selectedImage, for: .normal)
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
        chrono_Text.text = "\(minutosFormateados):\(segundosFormateados)"
    }
    
    
    @IBAction func DarkMode(_ sender: Any) {
        if switchMode.isOn{
            
            //MODO OSCURO
            self.view.backgroundColor = UIColor.black
            chrono_Text.textColor = UIColor.white
            
            darkModeOn = true
            
            // Cambiar la imagen del botón
            chronoButton.tintColor = UIColor.white
            stopChronoButton.tintColor = UIColor.white
            restartButton.tintColor = UIColor.white
            moonButton.tintColor = UIColor.white
            figureImage.tintColor = UIColor.white
        }else{
            
            darkModeOn = false
            
            self.view.backgroundColor = UIColor.white
            chrono_Text.textColor = UIColor.black
            chronoButton.tintColor = UIColor.black
            stopChronoButton.tintColor = UIColor.black
            restartButton.tintColor = UIColor.black
            moonButton.tintColor = UIColor.black
            figureImage.tintColor = UIColor.black 
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Detener el temporizador cuando la vista desaparece para evitar fugas de memoria
        timer?.invalidate()
    }
    
    @IBAction func chillButton(_ sender: Any) {
       // let viewController2 = ChillViewController()
         //       self.present(viewController2, animated: true, completion: nil)
        
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "ChillViewController") as? ChillViewController
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vcContinue" {
            if let ChillViewController = segue.destination as? ChillViewController {
                ChillViewController.receivedData = darkModeOn
            }
        }
    }
}
