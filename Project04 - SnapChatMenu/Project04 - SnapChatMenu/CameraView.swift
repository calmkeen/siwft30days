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
    var previewLayer : AVCaptureVideoPreviewLayer?
    var stillImageOutput: AVCapturePhotoOutput!
    
    var captureSession: AVCaptureSession!
    var backCamera: AVCaptureDevice!
    var frontCamera: AVCaptureDevice!
    var backCameraInput: AVCaptureInput!
    var frontCameraInput: AVCaptureInput!
    var videoOutput: AVCaptureVideoDataOutput!
    
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
        
        previewLayer?.frame = cameraView.bounds
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
                // 여기에서 preview 세팅하는 함수 호출
            }
        } catch {
            print(error.localizedDescription)
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // 세션 정지
        self.captureSession.stopRunning()
    }
    func setPreviewPhoto(){
        let previewLayer = AVCaptureVideoPreviewLayer()
        previewLayer.session = captureSession
        view.layer.addSublayer(previewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.captureSession.startRunning()
            
            DispatchQueue.main.async {
                self.previewLayer?.frame = self.cameraView.bounds
            }
        }
    }
    
    @IBOutlet weak var tempImageView: UIImageView!
    
    func didTakePhoto() {
        // 호출될 때 마다 다른 세팅을 주어야 하기 때문에 메서드 안에서 생성
        let settings = AVCapturePhotoSettings(
format: [AVVideoCodecKey: AVVideoCodecType.jpeg])
        
        // 아래에 AVCapturePhotoCaptureDelegate를 채택
        stillImageOutput.capturePhoto(with: settings, delegate: self)
    }
}

extension ViewController: AVCapturePhotoCaptureDelegate {

    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
        let image = UIImage(data: imageData)
        print(image)
    }
}


