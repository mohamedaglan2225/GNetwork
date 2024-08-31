# GNetwork

**GNetwork** is a Swift package that provides a modular and reusable network layer using Clean Architecture principles. It is designed to be flexible and can be integrated into any Swift project to handle HTTP requests and manage responses.

## Features

- Supports GET, POST, and other HTTP methods.
- Decodable models allow easy JSON decoding.
- Supports file uploads with multipart/form-data.
- Modular architecture using Use Cases, Repositories, and Data Sources.
- Full async/await support.

## Installation

### Swift Package Manager

To integrate **GNetwork** into your project using Swift Package Manager:

1. In Xcode, go to `File > Add Packages...`.
2. Enter the repository URL: `https://github.com/yourusername/GNetwork.git`.
3. Select the version or branch you want to use.
4. Click "Add Package" to add it to your project.

## Usage

### 1. Define a Model

Create a `Decodable` model that represents the structure of the response you expect:

```swift
struct UserModel: Decodable {
    let id: Int
    let name: String
    let email: String
}
```

### 2. Set Up the API Client
Initialize the APIClient:

```
import GNetwork
let apiClient = APIClient()
```

### 3. Make a Network Request
Use the APIClient to fetch data from an API:

```
import GNetwork

@available(iOS 13.0.0, *)
func fetchUserData() async {
    do {
        let user: UserModel = try await apiClient.fetchData(
            method: .get,
            parameters: ["user_id": 1],
            domain: "https://example.com",
            endpoint: "/api/user",
            model: UserModel.self,
            headerType: .unauthorized
        )
        print("User: \(user)")
    } catch {
        print("Failed to fetch user data: \(error)")
    }
}

```
### 4. Handle Errors
Errors will be thrown if the request fails. Handle them in your application logic:

```
do {
    // Request
} catch let error as ResponseError {
    switch error {
    case .canNotConnectToServer:
        // Handle connection error
    case .serverError:
        // Handle server error
    case .unableToDecodeResponse:
        // Handle decoding error
    case .server(let message):
        // Handle custom server message
        print(message)
    }
} catch {
    // Handle other errors
}

```


