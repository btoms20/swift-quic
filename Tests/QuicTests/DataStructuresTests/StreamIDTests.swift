//  Copyright Kenneth Laskoski. All Rights Reserved.
//  SPDX-License-Identifier: Apache-2.0

import XCTest
@testable import Quic

final class StreamIDTests: XCTestCase {
  func testInit() throws {
    XCTAssertEqual(StreamID(rawValue: 0).rawValue.rawValue, 0)
    XCTAssertEqual(StreamID(rawValue: VarInt.max).rawValue, VarInt.max)
  }

  func testType() throws {
    let streamID0 = StreamID(rawValue: 0)
    let streamID1 = StreamID(rawValue: 1)
    let streamID2 = StreamID(rawValue: 2)
    let streamID3 = StreamID(rawValue: 3)

    XCTAssertEqual(streamID0.encodedType, .clientBidi)
    XCTAssertEqual(streamID1.encodedType, .serverBidi)
    XCTAssertEqual(streamID2.encodedType, .clientUni)
    XCTAssertEqual(streamID3.encodedType, .serverUni)
  }
}
