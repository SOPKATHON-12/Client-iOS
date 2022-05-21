//
//  BaseAPI.swift
//  ReadMe-iOS
//
//  Created by 송지훈 on 2022/04/03.
//

import Moya
import Alamofire

enum BaseAPI{
  case sampleAPI
  case postGameResult(type: String, score: Int, comment: String, emojiLevel: Int)
  case getMyRecordInMonth
  case getMyRecordInDay
  case getRanking(type: String)

}

extension BaseAPI: TargetType {
  // MARK: - Base URL & Path
  /// - Parameters:

  ///
  public var baseURL: URL {
      var base = Config.Network.baseURL
      switch self{
      case .postGameResult:
        base += "/game"
          
        case .getMyRecordInMonth:
          base += "/myrecord/month"
          
        case .getMyRecordInDay:
          base += "/myrecord/date"
          
        case .getRanking:
          base += "/game/ranking"
          
        case .sampleAPI:
          base += "/"
      }
    guard let url = URL(string: base) else {
      fatalError("baseURL could not be configured")
    }
    return url
  }
  
  // MARK: - Path
  /// - note :
  ///  path에 필요한 parameter를 넣어야 되는 경우,
  ///  enum을 정의했을때 적은 파라미터가
  ///  .case이름(let 변수이름):
  ///  형태로 작성하면 변수를 받아올 수 있습니다.
  ///
  var path: String {
    switch self{

    default :
      return ""
    }
  }
  
  // MARK: - Method
  /// - note :
  ///  각 case 별로 get,post,delete,put 인지 정의합니다.
  var method: Moya.Method {
    switch self{
    case .postGameResult:
      return .post
    default :
      return .get
      
    }
  }
  
  // MARK: - Data
  var sampleData: Data {
    return Data()
  }
  
  // MARK: - Parameters
  /// - note :
  ///  post를 할때, body Parameter를 담아서 전송해야하는 경우가 있는데,
  ///  이 경우에 사용하는 부분입니다.
  ///
  ///  (get에서는 사용 ❌, get의 경우에는 쿼리로)
  ///
  private var bodyParameters: Parameters? {
    var params: Parameters = [:]
    switch self{

        
      case .postGameResult(let type, let score, let comment, let emojiLevel) :
        params["type"] = type
        params["score"] = score
        params["comment"] = comment
        params["emojiLevel"] = emojiLevel
        
      case .getMyRecordInMonth:
        params["month"] = 5
        
      case .getMyRecordInDay:
        params["month"] = 5
        params["day"] = 9
      
      case .getRanking(let type) :
        params["type"] = type
        
    default:
      break
      
    }
    return params
  }
  
  // MARK: - MultiParts
  
  /// - note :
  ///  사진등을 업로드 할때 사용하는 multiparts 부분이라 따로 사용 X
  ///
  private var multiparts: [Moya.MultipartFormData] {
    switch self{

    default : return []
    }
  }
  
  /// - note :
  ///  query문을 사용하는 경우 URLEncoding 을 사용해야 합니다
  ///  나머지는 그냥 전부 다 default 처리.
  ///
  private var parameterEncoding : ParameterEncoding{
    switch self {
      case .sampleAPI,.getMyRecordInMonth, .getMyRecordInDay, .getRanking:
      return URLEncoding.init(destination: .queryString, arrayEncoding: .noBrackets, boolEncoding: .literal)
    default :
      return JSONEncoding.default
      
    }
  }
  
  /// - note :
  ///  body Parameters가 있는 경우 requestParameters  case 처리.
  ///  일반적인 처리는 모두 requestPlain으로 사용.
  ///
  var task: Task {
    switch self{
      case .sampleAPI,.postGameResult, .getMyRecordInMonth, .getMyRecordInDay, .getRanking:
      return .requestParameters(parameters: bodyParameters ?? [:], encoding: parameterEncoding)
    default:
      return .requestPlain
      
    }
  }

  public var headers: [String: String]? {
    if let userToken = UserDefaults.standard.string(forKey: "userToken") {
      return ["Authorization": userToken,
              "Content-Type": "application/json"]
    } else {
      return ["Content-Type": "application/json"]
    }
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
  
  typealias Response = Codable
}
