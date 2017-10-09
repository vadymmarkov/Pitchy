public struct WaveCalculator {
  public static var wavelengthBounds: (minimum: Double, maximum: Double) {
    let minimum = try! wavelength(forFrequency: FrequencyValidator.maximumFrequency)
    let maximum = try! wavelength(forFrequency: FrequencyValidator.minimumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var periodBounds: (minimum: Double, maximum: Double) {
    let bounds = wavelengthBounds
    let minimum = try! period(forWavelength: bounds.minimum)
    let maximum = try! period(forWavelength: bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }

  // MARK: - Validators

  public static func isValid(wavelength: Double) -> Bool {
    let bounds = wavelengthBounds

    return wavelength > 0.0
      && wavelength >= bounds.minimum
      && wavelength <= bounds.maximum
  }

  public static func validate(wavelength: Double) throws {
    if !isValid(wavelength: wavelength) {
      throw PitchError.invalidWavelength
    }
  }

  public static func isValid(period: Double) -> Bool {
    let bounds = periodBounds

    return period > 0.0
      && period >= bounds.minimum
      && period <= bounds.maximum
  }

  public static func validate(period: Double) throws {
    if !isValid(period: period) {
      throw PitchError.invalidPeriod
    }
  }

  // MARK: - Conversions

  public static func frequency(forWavelength wavelength: Double) throws -> Double {
    try WaveCalculator.validate(wavelength: wavelength)
    return AcousticWave.speed / wavelength
  }

  public static func wavelength(forFrequency frequency: Double) throws -> Double {
    try FrequencyValidator.validate(frequency: frequency)
    return AcousticWave.speed / frequency
  }

  public static func wavelength(forPeriod period: Double) throws -> Double {
    try WaveCalculator.validate(period: period)
    return period * AcousticWave.speed
  }

  public static func period(forWavelength wavelength: Double) throws -> Double {
    try WaveCalculator.validate(wavelength: wavelength)
    return wavelength / AcousticWave.speed
  }
}
