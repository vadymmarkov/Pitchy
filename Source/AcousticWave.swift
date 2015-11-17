public struct AcousticWave {

  public static let speed: Double = 343

  public let frequency: Double
  public let wavelength: Double
  public let period: Double

  // MARK: - Initialization

  public init(frequency: Double) {
    self.frequency = frequency
    wavelength = WaveCalculator.wavelength(frequency: frequency)
    period = WaveCalculator.period(wavelength: wavelength)
  }

  public init(wavelength: Double) {
    self.wavelength = wavelength
    frequency = WaveCalculator.frequency(wavelength: wavelength)
    period = WaveCalculator.period(wavelength: wavelength)
  }

  public init(period: Double) {
    self.period = period
    wavelength = WaveCalculator.wavelength(period: period)
    frequency = WaveCalculator.frequency(wavelength: wavelength)
  }
}
