

import XCTest
@testable import GNetwork

@available(iOS 13.0.0, *)
final class NetworkUseCaseTests: XCTestCase {
    var mockRepository: MockNetworkRepository!
    var useCase: NetworkUseCase!

    override func setUp() {
        super.setUp()
        mockRepository = MockNetworkRepository()
        useCase = DefaultNetworkUseCase(repository: mockRepository)
    }

    override func tearDown() {
        mockRepository = nil
        useCase = nil
        super.tearDown()
    }

    // Mock Model for testing purposes
    struct MockModel: Decodable, Equatable {
        let id: Int
        let name: String
    }

    func testExecuteRequestSuccess() async throws {
        // Setup expected result
        let expectedModel = MockModel(id: 1, name: "Test")
        mockRepository.mockResult = .success(expectedModel)
        
        // Execute the use case
        let result: MockModel = try await useCase.executeRequest(
            method: .get,
            parameters: nil,
            domain: "https://example.com",
            endpoint: "/test",
            model: MockModel.self,
            headerType: .unauthorized,
            uploads: nil,
            progress: nil
        )
        
        // Assert result
        XCTAssertEqual(result, expectedModel)
    }

    func testExecuteRequestFailure() async {
        // Setup expected error
        mockRepository.mockResult = .failure(ResponseError.serverError)
        
        do {
            // Execute the use case
            let _: MockModel = try await useCase.executeRequest(
                method: .get,
                parameters: nil,
                domain: "https://example.com",
                endpoint: "/test",
                model: MockModel.self,
                headerType: .unauthorized,
                uploads: nil,
                progress: nil
            )
            XCTFail("Expected failure but got success")
        } catch {
            // Assert error
            XCTAssertEqual(error as? ResponseError, .serverError)
        }
    }
}
