//
//  LogEventType.swift

import Foundation

enum LogEventType {
  // 1. 앱 최초 실행
  case appFirstOpen // 앱 최초 실행
  
  // 2. 온보딩
  case onboardingFirstOpen // 온보딩 최초 실행
  case onboardingViewSecondPage // 온보딩 두번째 페이지 보기
  case onboardingViewThirdPage // 온보딩 세번째 페이지 보기
  case onboardingSkip // 온보딩 스킵
  case onboardingComplete // 온보딩 완료
  
  // 3. 로그인
  case signin(source: LoginSource) // 애플로그인,카카오로그인,둘러보기
  
  // 4. 회원가입
  case signupNickname(source: LoginSource) // 닉네임 작성 완료
  case signupEmail(source: LoginSource) // 이메일 작성 완료
  case signupComplete(source: LoginSource) // 회원가입 완료
  
  // 5. 탭바 클릭 액션 O
  case clickTab(source: TabSource) // 각자 탭바 클릭
  
}

extension LogEventType: EventType {
  func name(for provider: ProviderType) -> String? {
    switch self {
      case .appFirstOpen:                 return "firebase_first_open"
      case .onboardingFirstOpen:          return "onboarding_first_open"
      case .onboardingViewSecondPage:     return "onboarding_view_second_page"
      case .onboardingViewThirdPage:      return "onboarding_view_third_page"
      case .onboardingSkip:               return "onboarding_skip"
      case .onboardingComplete:           return "onboarding_complete"
      case .signin:                       return "signin_click"
      case .signupNickname:               return "signup_nickname"
      case .signupEmail:                  return "signup_email"
      case .signupComplete:               return "signup_complete"
      case .clickTab:                     return "click_tab"
    }
  }
  
  func parameters(for provider: ProviderType) -> [String : Any]? {
    var params: [String: Any] = [
      "device": "iOS",
      "userIdx": String(UserDefaults.standard.integer(forKey: "userIdx"))
    ]
    switch self {
      case .signin(let loginSource),
          .signupNickname(let loginSource),
          .signupEmail(let loginSource),
          .signupComplete(let loginSource):
        params["loginSource"] = loginSource.rawValue
        
      case .clickTab(let tabSource):
        params["tabSource"] = tabSource.rawValue
      


      default: break
    }
    return params
  }
}

extension LogEventType {
  enum LoginSource: String {
    case kakao
    case apple
    case guest  }
  
  enum TabSource: String {
    case home
    case travelSpot
    case scrap
    case myPlan
  }
  
  enum ViewSource: String {
    case homeView
    case scrapView
    case scrapRecommendView
    case travelListView
    case planListView
    case planPreview
    case planDetail
    case myPlanView
  }
  
  enum PaymentSource: String{
    case kakaoPay
    case naverPay
    case toss
  }
  
  enum MapSource: String{
    case kakaoMap
    case naverMap
  }
}
