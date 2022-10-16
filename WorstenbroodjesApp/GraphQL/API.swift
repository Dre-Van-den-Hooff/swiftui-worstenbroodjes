// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct StatsInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - totalSpent
  ///   - lastPurchase
  ///   - worstenbroodjes
  ///   - pizzas
  ///   - muffins
  ///   - paninis
  public init(totalSpent: Double, lastPurchase: Swift.Optional<Food?> = nil, worstenbroodjes: Int, pizzas: Int, muffins: Int, paninis: Int) {
    graphQLMap = ["totalSpent": totalSpent, "lastPurchase": lastPurchase, "worstenbroodjes": worstenbroodjes, "pizzas": pizzas, "muffins": muffins, "paninis": paninis]
  }

  public var totalSpent: Double {
    get {
      return graphQLMap["totalSpent"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "totalSpent")
    }
  }

  public var lastPurchase: Swift.Optional<Food?> {
    get {
      return graphQLMap["lastPurchase"] as? Swift.Optional<Food?> ?? Swift.Optional<Food?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastPurchase")
    }
  }

  public var worstenbroodjes: Int {
    get {
      return graphQLMap["worstenbroodjes"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "worstenbroodjes")
    }
  }

  public var pizzas: Int {
    get {
      return graphQLMap["pizzas"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pizzas")
    }
  }

  public var muffins: Int {
    get {
      return graphQLMap["muffins"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "muffins")
    }
  }

  public var paninis: Int {
    get {
      return graphQLMap["paninis"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "paninis")
    }
  }
}

public enum Food: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case `none`
  case pizza
  case worstenbroodje
  case muffin
  case panini
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "NONE": self = .none
      case "PIZZA": self = .pizza
      case "WORSTENBROODJE": self = .worstenbroodje
      case "MUFFIN": self = .muffin
      case "PANINI": self = .panini
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .none: return "NONE"
      case .pizza: return "PIZZA"
      case .worstenbroodje: return "WORSTENBROODJE"
      case .muffin: return "MUFFIN"
      case .panini: return "PANINI"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Food, rhs: Food) -> Bool {
    switch (lhs, rhs) {
      case (.none, .none): return true
      case (.pizza, .pizza): return true
      case (.worstenbroodje, .worstenbroodje): return true
      case (.muffin, .muffin): return true
      case (.panini, .panini): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Food] {
    return [
      .none,
      .pizza,
      .worstenbroodje,
      .muffin,
      .panini,
    ]
  }
}

public final class GetAllUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllUsers {
      getAllUsers {
        __typename
        id
        username
        stats {
          __typename
          worstenbroodjes
          pizzas
          paninis
        }
      }
    }
    """

  public let operationName: String = "GetAllUsers"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAllUsers", type: .nonNull(.list(.nonNull(.object(GetAllUser.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAllUsers: [GetAllUser]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getAllUsers": getAllUsers.map { (value: GetAllUser) -> ResultMap in value.resultMap }])
    }

    public var getAllUsers: [GetAllUser] {
      get {
        return (resultMap["getAllUsers"] as! [ResultMap]).map { (value: ResultMap) -> GetAllUser in GetAllUser(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetAllUser) -> ResultMap in value.resultMap }, forKey: "getAllUsers")
      }
    }

    public struct GetAllUser: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("stats", type: .object(Stat.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, stats: Stat? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "stats": stats.flatMap { (value: Stat) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var stats: Stat? {
        get {
          return (resultMap["stats"] as? ResultMap).flatMap { Stat(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "stats")
        }
      }

      public struct Stat: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Stats"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("worstenbroodjes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pizzas", type: .nonNull(.scalar(Int.self))),
            GraphQLField("paninis", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(worstenbroodjes: Int, pizzas: Int, paninis: Int) {
          self.init(unsafeResultMap: ["__typename": "Stats", "worstenbroodjes": worstenbroodjes, "pizzas": pizzas, "paninis": paninis])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var worstenbroodjes: Int {
          get {
            return resultMap["worstenbroodjes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "worstenbroodjes")
          }
        }

        public var pizzas: Int {
          get {
            return resultMap["pizzas"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pizzas")
          }
        }

        public var paninis: Int {
          get {
            return resultMap["paninis"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "paninis")
          }
        }
      }
    }
  }
}

public final class GetUserByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserById($id: ID!) {
      getById(id: $id) {
        __typename
        id
        username
        stats {
          __typename
          worstenbroodjes
          pizzas
          paninis
        }
      }
    }
    """

  public let operationName: String = "GetUserById"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getById", arguments: ["id": GraphQLVariable("id")], type: .nonNull(.object(GetById.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getById: GetById) {
      self.init(unsafeResultMap: ["__typename": "Query", "getById": getById.resultMap])
    }

    public var getById: GetById {
      get {
        return GetById(unsafeResultMap: resultMap["getById"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getById")
      }
    }

    public struct GetById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("stats", type: .object(Stat.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, stats: Stat? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "stats": stats.flatMap { (value: Stat) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var stats: Stat? {
        get {
          return (resultMap["stats"] as? ResultMap).flatMap { Stat(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "stats")
        }
      }

      public struct Stat: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Stats"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("worstenbroodjes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pizzas", type: .nonNull(.scalar(Int.self))),
            GraphQLField("paninis", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(worstenbroodjes: Int, pizzas: Int, paninis: Int) {
          self.init(unsafeResultMap: ["__typename": "Stats", "worstenbroodjes": worstenbroodjes, "pizzas": pizzas, "paninis": paninis])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var worstenbroodjes: Int {
          get {
            return resultMap["worstenbroodjes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "worstenbroodjes")
          }
        }

        public var pizzas: Int {
          get {
            return resultMap["pizzas"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pizzas")
          }
        }

        public var paninis: Int {
          get {
            return resultMap["paninis"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "paninis")
          }
        }
      }
    }
  }
}

public final class UpdateUsernameMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateUsername($id: ID!, $newName: String!) {
      updateName(id: $id, newName: $newName) {
        __typename
        id
        username
        stats {
          __typename
          worstenbroodjes
          pizzas
          paninis
        }
      }
    }
    """

  public let operationName: String = "UpdateUsername"

  public var id: GraphQLID
  public var newName: String

  public init(id: GraphQLID, newName: String) {
    self.id = id
    self.newName = newName
  }

  public var variables: GraphQLMap? {
    return ["id": id, "newName": newName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateName", arguments: ["id": GraphQLVariable("id"), "newName": GraphQLVariable("newName")], type: .nonNull(.object(UpdateName.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateName: UpdateName) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateName": updateName.resultMap])
    }

    public var updateName: UpdateName {
      get {
        return UpdateName(unsafeResultMap: resultMap["updateName"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateName")
      }
    }

    public struct UpdateName: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("stats", type: .object(Stat.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, stats: Stat? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "stats": stats.flatMap { (value: Stat) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var stats: Stat? {
        get {
          return (resultMap["stats"] as? ResultMap).flatMap { Stat(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "stats")
        }
      }

      public struct Stat: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Stats"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("worstenbroodjes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pizzas", type: .nonNull(.scalar(Int.self))),
            GraphQLField("paninis", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(worstenbroodjes: Int, pizzas: Int, paninis: Int) {
          self.init(unsafeResultMap: ["__typename": "Stats", "worstenbroodjes": worstenbroodjes, "pizzas": pizzas, "paninis": paninis])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var worstenbroodjes: Int {
          get {
            return resultMap["worstenbroodjes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "worstenbroodjes")
          }
        }

        public var pizzas: Int {
          get {
            return resultMap["pizzas"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pizzas")
          }
        }

        public var paninis: Int {
          get {
            return resultMap["paninis"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "paninis")
          }
        }
      }
    }
  }
}

public final class UpdateUserStatsMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateUserStats($id: ID!, $stats: StatsInput!) {
      updateStats(id: $id, stats: $stats) {
        __typename
        id
        username
        stats {
          __typename
          worstenbroodjes
          pizzas
          paninis
        }
      }
    }
    """

  public let operationName: String = "UpdateUserStats"

  public var id: GraphQLID
  public var stats: StatsInput

  public init(id: GraphQLID, stats: StatsInput) {
    self.id = id
    self.stats = stats
  }

  public var variables: GraphQLMap? {
    return ["id": id, "stats": stats]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateStats", arguments: ["id": GraphQLVariable("id"), "stats": GraphQLVariable("stats")], type: .nonNull(.object(UpdateStat.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateStats: UpdateStat) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateStats": updateStats.resultMap])
    }

    public var updateStats: UpdateStat {
      get {
        return UpdateStat(unsafeResultMap: resultMap["updateStats"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateStats")
      }
    }

    public struct UpdateStat: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("username", type: .nonNull(.scalar(String.self))),
          GraphQLField("stats", type: .object(Stat.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, username: String, stats: Stat? = nil) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "username": username, "stats": stats.flatMap { (value: Stat) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var username: String {
        get {
          return resultMap["username"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "username")
        }
      }

      public var stats: Stat? {
        get {
          return (resultMap["stats"] as? ResultMap).flatMap { Stat(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "stats")
        }
      }

      public struct Stat: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Stats"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("worstenbroodjes", type: .nonNull(.scalar(Int.self))),
            GraphQLField("pizzas", type: .nonNull(.scalar(Int.self))),
            GraphQLField("paninis", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(worstenbroodjes: Int, pizzas: Int, paninis: Int) {
          self.init(unsafeResultMap: ["__typename": "Stats", "worstenbroodjes": worstenbroodjes, "pizzas": pizzas, "paninis": paninis])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var worstenbroodjes: Int {
          get {
            return resultMap["worstenbroodjes"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "worstenbroodjes")
          }
        }

        public var pizzas: Int {
          get {
            return resultMap["pizzas"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pizzas")
          }
        }

        public var paninis: Int {
          get {
            return resultMap["paninis"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "paninis")
          }
        }
      }
    }
  }
}
