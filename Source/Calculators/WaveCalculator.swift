public struct WaveCalculator {

  // MARK: - Bounds

  public static var wavelengthBounds: (minimum: Double, maximum: Double) {
    let minimum = try! wavelength(frequency: Config.maximumFrequency)
    let maximum = try! wavelength(frequency: Config.minimumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var periodBounds: (minimum: Double, maximum: Double) {
    let bounds = wavelengthBounds
    let minimum = try! period(wavelength: bounds.minimum)
    let maximum = try! period(wavelength: bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }

  // MARK: - Validators

  public static func isValidWavelength(wavelength: Double) -> Bool {
    let bounds = wavelengthBounds

    return wavelength > 0.0
      && wavelength >= bounds.minimum
      && wavelength <= bounds.maximum
  }

  public static func isValidPeriod(period: Double) -> Bool {
    let bounds = periodBounds

    return period > 0.0
      && period >= bounds.minimum
      && period <= bounds.maximum
  }

  // MARK: - Conversions

  public static func frequency(wavelength wavelength: Double) throws -> Double {
    guard isValidWavelength(wavelength) else {
      throw Error.InvalidWavelength
    }

    return AcousticWave.speed / wavelength
  }

  public static func wavelength(frequency frequency: Double) throws -> Double {
    guard PitchCalculator.isValidFrequency(frequency) else {
      throw Error.InvalidFrequency
    }

    return AcousticWave.speed / frequency
  }

  public static func wavelength(period period: Double) throws -> Double {
    guard isValidPeriod(period) else {
      throw Error.InvalidPeriod
    }

    return period * AcousticWave.speed
  }

  public static func period(wavelength wavelength: Double) throws -> Double {
    guard isValidWavelength(wavelength) else {
      throw Error.InvalidWavelength
    }

    return wavelength / AcousticWave.speed
  }
}
