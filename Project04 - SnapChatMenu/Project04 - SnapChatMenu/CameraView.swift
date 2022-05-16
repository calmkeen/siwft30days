//
//  CameraView.swift
//  Project04 - SnapChatMenu
//
//  Created by calmkeen on 2022/05/16.
//

import UIKit
import AVFoundation

class CameraView: UIViewController {
    
    
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
    
}


