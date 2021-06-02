//
//  Created by Wojciech Chojnacki on 23/05/2021.
//

import Foundation

// MARK: - Pages

 extension NotionClient {

    public func page(
        pageId: Page.Identifier,
        completed: @escaping (Result<Page, Network.Errors>) -> Void
    ) {
        networkClient.get(
            urlBuilder.url(path: "/v1/pages", identifier: pageId),
            headers: headers(),
            completed: completed
        )
    }

    public func pageCreate(request: PageCreateRequest, completed: @escaping (Result<Page, Network.Errors>) -> Void) {
        networkClient.post(
            urlBuilder.url(path: "/v1/pages"),
            body: request,
            headers: headers(),
            completed: completed
        )
    }

//    public func pageUpdateProperties(pageId: Page.Identifier, properties: PageUpdateParams, completed: @escaping (Result<Page, Network.Errors>) -> Void) {
//        networkClient.patch(
//            urlBuilder.url(path: "/v1/pages", identifier: pageId),
//            body: properties,
//            headers: headers(),
//            completed: completed
//        )
//    }
}
