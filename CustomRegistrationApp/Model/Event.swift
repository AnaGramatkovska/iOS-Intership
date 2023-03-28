//
//  Event.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 16.2.23.
//

import Foundation

struct Event:Identifiable, Codable{
    var eventId: String?
    var id: String? { eventId }
    var collaboration: String?
    var createdBy: User?
    var dateCreated: Int64?
    var description: String?
    var eventFilesList:[Picture]?
    var eventUsers: [User]?
    var isPublic: Bool?
    var location: String?
    var name: String?
    var tags: [String]?
    var thumbnailUrl: String?
    
}

//{
//  "eventId": "73999cbe-1f03-49dc-a761-83a7313cfe09",
//  "name": "Ivana event ANYONE",
//  "description": "No dress code",
//  "location": "Gevgelija",
//  "tags": [
//    "tag1",
//    "tag2"
//  ],
//  "isPublic": true,
//  "dateCreated": 1676332325898,
//  "thumbnailUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/gettyimages-1183414292-1-_slide-edff8c3fe6afcab5c6457e3c7bd011f5c1745161-s1100-c50 (1).jpg",
//  "collaboration": "EDITORS_ONLY",
//  "eventUsers": [
//    {
//      "id": "94ba606c-cfdc-4ed7-91a6-e45ca903e873",
//      "firstName": "Darko",
//      "lastName": "Popovski",
//      "pictureUrl": null
//    },
//    {
//      "id": "32d5e8e2-7af0-4710-94ea-3a658c6e2eff",
//      "firstName": "Angela",
//      "lastName": "Dineva",
//      "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/girl-drawings-cameron-mark-1.jpg"
//    }
//  ],
//  "createdBy": {
//    "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//    "firstName": "Ivana",
//    "lastName": "Dineva",
//    "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//  },
//  "eventFilesList": [
//    {
//      "id": "a9bbdec1-e955-4793-90c0-3ca683cd4da7",
//      "fileName": "getty_614867390_321301.jpg",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1676552185068,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/getty_614867390_321301.jpg"
//    },
//    {
//      "id": "186c06bd-1d8b-4bea-bcb1-152aeef91a39",
//      "fileName": "1676465348248.jpg",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1676553796753,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/1676465348248.jpg"
//    },
//    {
//      "id": "87740f20-a918-497a-88ba-4aa689183c1c",
//      "fileName": "1676465338214.jpg",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1676553826693,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/1676465338214.jpg"
//    },
//    {
//      "id": "e3a22489-9575-4c7c-8ca3-c661617e5467",
//      "fileName": "image (3).png",
//      "createdBy": {
//        "id": "94ba606c-cfdc-4ed7-91a6-e45ca903e873",
//        "firstName": "Darko",
//        "lastName": "Popovski",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/jujutsu-kaisen-9-scaled.jpg"
//      },
//      "dateCreated": 1676884114886,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/image (3).png"
//    },
//    {
//      "id": "6da0299b-ef4e-40c8-8aa2-6761c2f687b6",
//      "fileName": "girl-drawings-cameron-mark-1.jpg",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1677067293543,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/girl-drawings-cameron-mark-1.jpg"
//    },
//    {
//      "id": "409fc037-a609-4867-989f-cf98e4c22510",
//      "fileName": "come-on-lets-party_large.jpg",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1677146732787,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/come-on-lets-party_large.jpg"
//    },
//    {
//      "id": "aea208ae-0fc9-4f97-9ced-fa196231e119",
//      "fileName": "1877565.png",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1677578252704,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/1877565.png"
//    },
//    {
//      "id": "95d108a4-0193-47bc-a13e-53e2784ef135",
//      "fileName": "filename",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1677583563373,
//      "videoUrlLink": null,
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/filename"
//    },
//    {
//      "id": "694cd20d-7d4a-4658-9ab9-a7394d830248",
//      "fileName": "file_example_MP4_480_1_5MG.mp4",
//      "createdBy": {
//        "id": "0988b69d-ed2c-4345-9946-3e76302fb04c",
//        "firstName": "Ivana",
//        "lastName": "Dineva",
//        "pictureUrl": "https://f004.backblazeb2.com/file/test-bucket435243424324/DXi9TjjXcAAEsmh.jpg"
//      },
//      "dateCreated": 1677637269568,
//      "videoUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/file_example_MP4_480_1_5MG.mp4",
//      "thumbnailUrlLink": "https://f004.backblazeb2.com/file/test-bucket435243424324/video-frame-1151d79b-5977-412b-82cf-6533380d2fb4.png"
//    }
//  ]
//}
