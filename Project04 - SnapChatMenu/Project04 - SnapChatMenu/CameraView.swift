//
//  CameraView.swift
//  Project04 - SnapChatMenu
//
//  Created by calmkeen on 2022/05/16.
//

import UIKit
import AVFoundation

class CameraView: UIViewController, AVCapturePhotoCaptureDelegate {
    
    
    @IBOutlet weak var cameraView: UIView!
    var CapturepreviewLayer : AVCaptureVideoPreviewLayer?
    var stillImageOutput: AVCapturePhotoOutput!
    var captureSession: AVCaptureSession!
    
    var takePicture = false
    var isBackCamera = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //CapturepreviewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .hd1920x1080
        guard let backCamera = AVCaptureDevice.default(for: .video) else{
            return print("NSError")
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            stillImageOutput = AVCapturePhotoOutput()
            
            if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                captureSession.addInput(input)
                captureSession.addOutput(stillImageOutput)
                setPreviewPhoto()
            }
        } catch {
            print(error.localizedDescription)
        }
        
        func setPreviewPhoto(){
            let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            previewLayer.session = captureSession
            previewLayer.videoGravity = .resizeAspectFill
            previewLayer.connection?.videoOrientation = .portrait
            cameraView.layer.addSublayer(CapturepreviewLayer!)
            //captureSession?.startRunning()
            startCaptureSession()
        }
    }
    @IBOutlet tempImage: UIImageView!
    private func startCaptureSession(){
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
            
            DispatchQueue.main.async {
                self.CapturepreviewLayer?.frame = self.cameraView.bounds
            }
        }
    }
    
    
    
    
    
    // preview까지 준비되었으니 captureSession을 시작하도록 설정
    
    func didTakePhoto() {
        // 호출될 때 마다 다른 세팅을 주어야 하기 때문에 메서드 안에서 생성
        //        let previewPixelType = settings.availablePreviewPhotoPixelFormatTypes.first!
        //        let previewFormat = [kCVPixelBufferPixelFormatTypeKey as String: previewPixelType,
        //                                       kCVPixelBufferWidthKey as String: 160,
        //                                       kCVPixelBufferHeightKey as String: 160]
        //                  settings.previewPhotoFormat = previewFormat
        
        
        // 아래에 AVCapturePhotoCaptureDelegate를 채택
        //stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
    
}

extension ViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: imageData)
        print(image)
    }
}


