import Foundation

public struct PitchOffset {

  public let pitch: Pitch
  public let frequency: Double
  public let percentage: Double

  // MARK: - Initialization

  public init(pitch: Pitch, frequency: Double, percentage: Double) {
    self.pitch = pitch
    self.frequency = frequency
    self.percentage = percentage
  }
}