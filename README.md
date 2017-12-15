# SDStateTableView

[![CI Status](http://img.shields.io/travis/sauvikatinnofied/SDStateTableView.svg?style=flat)](https://travis-ci.org/sauvikatinnofied/SDStateTableView)
[![Version](https://img.shields.io/cocoapods/v/SDStateTableView.svg?style=flat)](http://cocoapods.org/pods/SDStateTableView)
[![License](https://img.shields.io/cocoapods/l/SDStateTableView.svg?style=flat)](http://cocoapods.org/pods/SDStateTableView)
[![Platform](https://img.shields.io/cocoapods/p/SDStateTableView.svg?style=flat)](http://cocoapods.org/pods/SDStateTableView)

## Example
[![Stateful TableView](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/Demo.gif)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SDStateTableView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SDStateTableView'
```
## Usages

#### 1. Data Available
```swift
stateTableView.setState( .dataAvailable)
```
![1_DataAvailable.png](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/1_DataAvailable.png)


#### 2. Empty List
```swift
stateTableView.setState(.withImage(image: "empty_cart", title: "EMPTY CART", message: "Please add some item in your cart first"))
```
![2_EmptyData.png](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/2_EmptyData.png)


#### 3. Server Side Error
```swift
stateTableView.setState(.withImage(image: "server_error", title: "SERVER ERROR", message: "We are notified and working on it, we will be back soon"))
```
![3_ServerError.png](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/3_ServerError.png)


#### 4. Error with Title & Message only
```swift
stateTableView.setState(.withImage(image: nil, title: "SIMPLE ERROR TITLE", message: "Error message goes here"))
```

![4_Title&Message.png](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/4_Title&Message.png)

#### 5. Loading Data
```swift
stateTableView.setState(.loading(message: "Loading data..."))
```
![5_LoadingData.png](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/5_LoadingData.png)

#### 6. No Internet Connection
```swift
stateTableView.setState(.withButton(errorImage: "no_internet", title: "NO INTERNET",
                      message: "You are not connected to Internet, please try later",
                  buttonTitle: "Try Again",
                 buttonConfig: { (button) in
                                 // You can configure the button here
                               },
                  retryAction: {
                           self.stateTableView.setState(.loading(message: "Loading data..."))
                     }))
```
![6_No_Internet_Connection.png](https://raw.githubusercontent.com/sauvikdolui/SDStateTableView/master/Screenshots/6_No_Internet_Connection.png)

## Author

sauvikatinnofied, sauvikdolui@gmail.com

## License

SDStateTableView is available under the MIT license. See the LICENSE file for more info.
