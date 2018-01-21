//
//  CameraViewController.swift
//  Instagram
//
//  Created by 辛忠翰 on 20/01/18.
//  Copyright © 2018 辛忠翰. All rights reserved.
//

import UIKit
import AVFoundation

class CameraViewController: UIViewController {
    let capturePhotoButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "capture_photo")?.withRenderingMode(.alwaysOriginal) , for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.addTarget(self, action: #selector(handleCapturePhoto), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func handleCapturePhoto(){
        
    }
    
    let dismissButton: UIButton = {
       let btn = UIButton(type: .system)
        btn.setImage(UIImage(named: "right_arrow_shadow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.addTarget(self, action: #selector(handleDismissButton), for: .touchUpInside)
        return btn
    }()
    
    @objc fileprivate func handleDismissButton(){
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCaptureSession()
        setupCapturePhotoButton()
        setupBackHomeVCButton()
        
    }

    fileprivate func setupCaptureSession(){
        let captureSession = AVCaptureSession()
        //1.setup input
        guard let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) else{return}
        do{
            let input = try AVCaptureDeviceInput(device: captureDevice)
            if captureSession.canAddInput(input){
                captureSession.addInput(input)
            }
        }catch let error{
            print("Could not setup camera input: ", error)
        }
        
        //2.setup output
        let output = AVCapturePhotoOutput()
        if captureSession.canAddOutput(output){
            captureSession.addOutput(output)
        }
        
        
        //3.setup output preview
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.frame
        view.layer.addSublayer(previewLayer)
        
        //4.running camera
        captureSession.startRunning()
    }
    
    fileprivate func setupCapturePhotoButton(){
        view.addSubview(capturePhotoButton)
        capturePhotoButton.anchor(top: nil, topPadding: 0, bottom: view.bottomAnchor, bottomPadding: -24, left: nil, leftPadding: 0, right: nil, rightPadding: 0, width: 80, height: 80)
        capturePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    
    fileprivate func setupBackHomeVCButton(){
        view.addSubview(dismissButton)
        dismissButton.anchor(top: view.topAnchor, topPadding: 10, bottom: nil, bottomPadding: 0, left: nil, leftPadding: 0, right: view.rightAnchor, rightPadding: 24, width: 80, height: 80)
    }
}
