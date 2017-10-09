public struct WaveCalculator {
  public static var wavelengthBounds: (minimum: Double, maximum: Double) {
    let minimum = try! wavelength(frequency: FrequencyValidator.maximumFrequency)
    let maximum = try! wavelength(frequency: FrequencyValidator.minimumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var periodBounds: (minimum: Double, maximum: Double) {
    let bounds = wavelengthBounds
    let minimum = try! period(wavelength: bounds.minimum)
    let maximum = try! period(wavelength: bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }

  // MARK: - Validators

  public static func isValidWavelength(_ wavelength: Double) -> Bool {
    let bounds = wavelengthBounds

    return wavelength > 0.0
      && wavelength >= bounds.minimum
      && wavelength <= bounds.maximum
  }

  public static func isValidPeriod(_ period: Double) -> Bool {
    let bounds = periodBounds

    return period > 0.0
      && period >= bounds.minimum
      && period <= bounds.maximum
  }

  // MARK: - Conversions

  public static func frequency(wavelength: Double) throws -> Double {
    guard isValidWavelength(wavelength) else {
      throw PitchError.invalidWavelength
    }

    return AcousticWave.speed / wavelength
  }

  public static func wavelength(frequency: Double) throws -> Double {
    try FrequencyValidator.validate(frequency: frequency)
    return AcousticWave.speed / frequency
  }

  public static func wavelength(period: Double) throws -> Double {
    guard isValidPeriod(period) else {
      throw PitchError.invalidPeriod
    }

    return period * AcousticWave.speed
  }

  public static func period(wavelength: Double) throws -> Double {
    guard isValidWavelength(wavelength) else {
      throw PitchError.invalidWavelength
    }

    return wavelength / AcousticWave.speed
  }
}
