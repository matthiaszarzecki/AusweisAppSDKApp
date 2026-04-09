//
//  eIDViewModel.swift
//  AusweisAppiOS
//
//  Created by Zarzecki, Matthias (MATERNA External) on 09.04.26.
//

import AusweisApp2SDKWrapper
import Combine
import SwiftUI

class eIDViewModel: ObservableObject {
  private let workflowController = AA2SDKWrapper.workflowController

  init() {
    AA2SDKWrapper.workflowController.registerCallbacks(self)
  }

  func startProcess() {
    AA2SDKWrapper.workflowController.start()
  }

  private func cleanup() {
    AA2SDKWrapper.workflowController.unregisterCallbacks(self)
    if AA2SDKWrapper.workflowController.isStarted {
      AA2SDKWrapper.workflowController.stop()
    }
  }
}

extension eIDViewModel: WorkflowCallbacks {
  func onAccessRights(error: String?, accessRights: AusweisApp2SDKWrapper.AccessRights?) {
    print("### onAccessRights")
    workflowController.accept()
  }

  func onAuthenticationCompleted(authResult: AusweisApp2SDKWrapper.AuthResult) {
    print("### onAuthenticationCompleted")
    if let url = authResult.url {
      UIApplication.shared.open(url)
    }
  }

  func onEnterPin(error: String?, reader: AusweisApp2SDKWrapper.Reader) {
    print("### onEnterPin")
    workflowController.setPin("123456")
  }

  func onStarted() {
    print("### onStarted")
    // https://test.governikus-eid.de/AusweisAuskunft/WebServiceRequesterServlet
    // https://test.governikus-eid.de/DEMO
    let tcTokenUrl = URL(string: "https://test.governikus-eid.de/AusweisAuskunft/WebServiceRequesterServlet")!
    workflowController.startAuthentication(withTcTokenUrl: tcTokenUrl)

    /*<
     workflowController.startAuthentication(
       withTcTokenUrl: tcTokenUrl,
       withDeveloperMode: true,
       withUserInfoMessages: userInfoMessages,
       withStatusMsgEnabled: status
     )
     */
  }

  func start() {
    workflowController.registerCallbacks(self)
    workflowController.start()
  }
  
  func onAuthenticationStarted() {
    print("### onAuthenticationStarted")
  }
  
  func onAuthenticationStartFailed(error: String) {
    print("### onAuthenticationStartFailed")
  }
  
  func onBadState(error: String) {
    print("### onBadState")
  }
  
  func onCertificate(certificateDescription: AusweisApp2SDKWrapper.CertificateDescription) {
    print("### onCertificate")
  }
  
  func onChangePinCompleted(changePinResult: AusweisApp2SDKWrapper.ChangePinResult) {
    print("### onChangePinCompleted")
  }
  
  func onChangePinStarted() {
    print("### onChangePinStarted")
  }
  
  func onEnterCan(error: String?, reader: AusweisApp2SDKWrapper.Reader) {
    workflowController.setCan("654321")
    print("### onEnterCan")
  }
  
  func onEnterNewPin(error: String?, reader: AusweisApp2SDKWrapper.Reader) {
    print("### onEnterNewPin")
  }

  func onEnterPuk(error: String?, reader: AusweisApp2SDKWrapper.Reader) {
    print("### onEnterPuk")
  }
  
  func onInfo(versionInfo: AusweisApp2SDKWrapper.VersionInfo) {
    print("### onInfo")
  }
  
  func onInsertCard(error: String?) {
    print("### onInsertCard")
  }
  
  func onInternalError(error: String) {
    print("### onInternalError")
  }
  
  func onPause(cause: AusweisApp2SDKWrapper.Cause) {
    print("### onPause")
  }
  
  func onReader(reader: AusweisApp2SDKWrapper.Reader?) {
    print("### onReader")
  }
  
  func onReaderList(readers: [AusweisApp2SDKWrapper.Reader]?) {
    print("### onReaderList")
  }

  func onStatus(workflowProgress: AusweisApp2SDKWrapper.WorkflowProgress) {
    print("### onStatus")
  }
  
  func onWrapperError(error: AusweisApp2SDKWrapper.WrapperError) {
    print("### onWrapperError")
  }
}
