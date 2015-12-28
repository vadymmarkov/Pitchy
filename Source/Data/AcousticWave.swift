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
    guard Validator.isValidFrequency(frequency) else {
      throw Error.InvalidFrequency
    }

    self.frequency = frequency
    wavelength = WaveCalculator.wavelength(frequency: frequency)
    period = WaveCalculator.period(wavelength: wavelength)
  }

  public init(wavelength: Double) throws {
    guard Validator.isValidWavelength(wavelength) else {
      throw Error.InvalidWavelength
    }

    self.wavelength = wavelength
    frequency = WaveCalculator.frequency(wavelength: wavelength)
    period = WaveCalculator.period(wavelength: wavelength)
  }

  public init(period: Double) throws {
    guard Validator.isValidPeriod(period) else {
      throw Error.InvalidPeriod
    }

    self.period = period
    wavelength = WaveCalculator.wavelength(period: period)
    frequency = WaveCalculator.frequency(wavelength: wavelength)
  }
}
