public struct AcousticWave {
  public static let speed: Double = 343

  public let frequency: Double
  public let wavelength: Double
  public let period: Double

  public var harmonics: [Pitch] {
    var pitches = [Pitch]()

    do {
      for index in 1...16 {
        try pitches.append(Pitch(frequency: Double(index) * frequency))
      }
    } catch {}

    return pitches
  }

  // MARK: - Initialization

  public init(frequency: Double) throws {
    try FrequencyValidator.validate(frequency: frequency)
    self.frequency = frequency
    wavelength = try WaveCalculator.wavelength(forFrequency: frequency)
    period = try WaveCalculator.period(forWavelength: wavelength)
  }

  public init(wavelength: Double) throws {
    try WaveCalculator.validate(wavelength: wavelength)
    self.wavelength = wavelength
    frequency = try WaveCalculator.frequency(forWavelength: wavelength)
    period = try WaveCalculator.period(forWavelength: wavelength)
  }

  public init(period: Double) throws {
    try WaveCalculator.validate(period: period)
    self.period = period
    wavelength = try WaveCalculator.wavelength(forPeriod: period)
    frequency = try WaveCalculator.frequency(forWavelength: wavelength)
  }
}
