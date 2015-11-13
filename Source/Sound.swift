import Foundation

public struct Sound {

  public typealias Offset = (
    pitch: Pitch,
    frequency: Double,
    percentage: Double
  )

  public struct Offsets {
    let left: Sound.Offset
    let right: Sound.Offset

    public var closest: Sound.Offset {
      return abs(left.frequency) < abs(right.frequency)
        ? left : right
    }

    public init(left: Offset, right: Offset) {
      if left.pitch.frequency < right.pitch.frequency {
        self.left = left
        self.right = right
      } else {
        self.left = right
        self.right = left
      }
    }
  }

  public let frequency: Double
  public let offsets: Offsets

  // MARK: - Initialization

  public init(frequency: Double) {
    self.frequency = frequency
    offsets = PitchCalculator.offsets(frequency)
  }
}
