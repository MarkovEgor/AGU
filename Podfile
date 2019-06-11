project 'AGU.xcodeproj'

# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def shared_pods

 pod 'Firebase/Core'
 pod 'Firebase/Auth'
 pod 'Firebase/Firestore'
 pod 'Firebase/Storage'
 pod 'Kingfisher', '~> 4.0'
 pod 'CodableFirebase'
 pod 'IQKeyboardManagerSwift'
 
 end

target 'AGU' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AGU
 shared_pods
 pod 'Stripe'
 pod 'Alamofire'
end

target 'AGU_ADMIN' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AGU_ADMIN
 shared_pods
 pod 'CropViewController'
end
