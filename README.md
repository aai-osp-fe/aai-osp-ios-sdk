# osp_selfie

[![CI Status](https://img.shields.io/travis/loong/osp_selfie.svg?style=flat)](https://travis-ci.org/loong/osp_selfie)
[![Version](https://img.shields.io/cocoapods/v/osp_selfie.svg?style=flat)](https://cocoapods.org/pods/osp_selfie)
[![License](https://img.shields.io/cocoapods/l/osp_selfie.svg?style=flat)](https://cocoapods.org/pods/osp_selfie)
[![Platform](https://img.shields.io/cocoapods/p/osp_selfie.svg?style=flat)](https://cocoapods.org/pods/osp_selfie)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.


## Device requirements
osp_selfie SDK requires iOS 11 or newer.

## Installation

osp_selfie is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'osp_selfie'
```

# iOS Integration Guide

## OneStopSDK integration Guide and Technical Documentation

The OSP SDK Inquiry flow lets you securely and seamlessly collect your user's information

## Integration

```ruby
pod 'Moya'
pod 'PromiseKit'
pod 'SwiftMessages'
```

---

## Usage

### 1.Register

```swift
/**
name: The NodeType you want to register.
node: The instance of nodeable.
*/
OneStopManager.default.registerNode(name: .selfie, node: SelfieNode.init()) 
```

---
Note: The start and end node already supported by SDK, but you need manual specify selfie、document、or format node according to your demand.The NodeType euum:

```swift
enum NodeType: String {
    case start
    case selfie
    case document
    case format
    case end
}
```

NodeType & Nodeable class map:

|NodeType   |class          |
|-------    |-------        |
|selfie     |SelfieNode     |
|document   |DocumentNode   |
|format     |coming         |

### 2. Start a workflow

Generate SDK Token

```sh
curl --location --request POST 'https://sandbox-oop-api.advai.net/intl/openapi/sdk/v2/trans/start' \
--header 'X-ADVAI-KEY: XXXX' \
--header 'journeyId: xxx' \
--header 'Content-Type: application/json' \
--data '{
    "referenceId": "123213123",
}'
```

|name           |Description|
|----           |----|
|X-ADVAI-KEY    |The Access Key in you OneStop platform |
|journeyId      |The Workflow unqiue ID                 |

Response

```json
{
    "code": "SUCCESS",
    "message": "SUCCESS",
    "data": {
        "sdkToken": "fbbcc9f3-fcb2-4d1e-a4c2-7a443f0d5307",
        "transId": "073a78797a4e111f",   # You need store this in your DB and fetch transaction detail using this one. 
        }
}
```

```swift
/**
token: Generate SDK Token step
context: The current UIViewController, this context.naviationController cannt be nil
*/

public func ex_start(token: String, context: UIViewController)
```

### 2. CallBack

|name       |params             |decription                     |
|-------    |-------            |----------                     |
|onReady    |                   |start                          |
|onFinish   |status:true|false  |The workflow finish            |
|onExit     |nodeType: string   |User actively ends the process |
|onError    |                   |                               |
|onEvent    |eventName:String,params:[string: string]|          |

#### eventName & params

|name                   |params |
|----                   |----   |
|start                  |       |
|document_country_select|   country: String|
|document_type_select|      type:string|
|document_camera_capture|   type:front,back,unknow|
|document_upload|           type:front,back,unknow|
|selfie_camera_capture|     type:2D,3D|
|selfie_photo_upload| type:2D,3D|
|enable_camera| source:document,selfie|
|retry|source:document,selie|
|failure|source:document,selie|
|load_camera_failed|            |
|form|                          |
|form_submit|status:success,fail|
|decline    |   |
|success    |   |
|pending    |   |

You can call this method to listen for an event, example:

```swift
/**
des: you can call this method multiple times
type: CallBackType
*/
public func subscribe(type: CallBackType, _ act: @escaping (CallBackData?) -> Void)
```

or

```swift
public func subScribe(types: [CallBackType], _ act: @escaping (CallBackData?) -> Void)
```

You can call this method multiple times, the SDK will save these closures and execute them in order.

## ipa volume
Using selfie single node, the ipa package size will increase by 7.3M

## License

osp_selfie is available under the MIT license. See the LICENSE file for more info.
