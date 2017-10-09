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
    guard PitchCalculator.isValidFrequency(frequency) else {
      throw PitchError.invalidFrequency
    }

    self.frequency = frequency
    wavelength = try WaveCalculator.wavelength(frequency: frequency)
    period = try WaveCalculator.period(wavelength: wavelength)
  }

  public init(wavelength: Double) throws {
    guard WaveCalculator.isValidWavelength(wavelength) else {
      throw PitchError.invalidWavelength
    }

    self.wavelength = wavelength
    frequency = try WaveCalculator.frequency(wavelength: wavelength)
    period = try WaveCalculator.period(wavelength: wavelength)
  }

  public init(period: Double) throws {
    guard WaveCalculator.isValidPeriod(period) else {
      throw PitchError.invalidPeriod
    }

    self.period = period
    wavelength = try WaveCalculator.wavelength(period: period)
    frequency = try WaveCalculator.frequency(wavelength: wavelength)
  }
}
