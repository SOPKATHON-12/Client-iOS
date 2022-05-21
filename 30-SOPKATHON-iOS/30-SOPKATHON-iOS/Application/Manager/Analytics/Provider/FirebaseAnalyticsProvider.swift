//
//  FirebaseAnalyticsProvider.swift

import FirebaseCore
import FirebaseAnalytics

open class FirebaseAnalyticsProvider: RuntimeProviderType {
  public let className: String = "FIRAnalytics"
  public let selectorName: String = "logEventWithName:parameters:"

  public init() {}
}
