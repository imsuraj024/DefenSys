# Mobile Garuda - A Security Analysis Package

A robust mobile security package designed to enhance application resilience against various threats. This package includes features for device integrity checks, secure communication, mobile privacy, and fraud prevention.

## Features

### Device Integrity
- **Root Detection**: Detects rooted devices to prevent unauthorized modifications.  
  - **Severity**: High  
  - **Status**: Present (Bypassed)  
  - **Benefits**: Prevents tampering and enhances app security.

- **Emulator Detection**: Identifies if the app runs in an emulator, a common tool for reverse engineering.  
  - **Severity**: High  
  - **Status**: Absent  
  - **Benefits**: Reduces the risk of reverse engineering and debugging attacks.

- **Debugger Detection**: Identifies debuggers attached to the app.  
  - **Severity**: High  
  - **Status**: Absent  
  - **Benefits**: Increases resistance to runtime inspection and protects sensitive data.

- **Malicious Root App Detection**: Flags root management apps that can compromise security.  
  - **Severity**: Medium  
  - **Status**: Absent  
  - **Benefits**: Safeguards user data from root-level threats.

### OS Integrity
- **ADB Wireless/USB Debugging Detection**: Flags if ADB debugging is enabled.  
  - **Severity**: Low  
  - **Status**: Absent  
  - **Benefits**: Protects against unauthorized debugging and data exposure.

- **Developer Mode Detection**: Identifies if developer mode is active.  
  - **Severity**: Low  
  - **Status**: Absent  
  - **Benefits**: Minimizes attack surface by disabling additional tools for attackers.

### Secure Communication
- **VPN Detection**: Checks if the app is accessed over a VPN.  
  - **Severity**: Low  
  - **Status**: Absent  
  - **Benefits**: Provides network security insights.

### Mobile Privacy
- **Screen Capturing Prevention**: Restricts unauthorized screenshots or recordings.  
  - **Severity**: Medium  
  - **Status**: Absent  
  - **Benefits**: Secures sensitive visual data.

- **Copy-Paste Prevention**: Prevents sensitive data from being copied to the clipboard.  
  - **Severity**: Medium  
  - **Status**: Absent  
  - **Benefits**: Ensures confidentiality of sensitive information.

- **Screen Sharing Prevention**: Restricts unauthorized screen sharing.  
  - **Severity**: Medium  
  - **Status**: Absent  
  - **Benefits**: Protects sensitive visual information.

### Mobile Fraud
- **App Cloning/Second Space Detection**: Identifies cloned apps or dual instances to prevent fraud.  
  - **Severity**: Medium  
  - **Status**: Absent  
  - **Benefits**: Protects against impersonation and unauthorized access.

## Installation

To integrate this package into your project:

```bash
flutter pub add security_analysis_package