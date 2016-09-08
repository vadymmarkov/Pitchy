public struct WaveCalculator {

  // MARK: - Bounds

  public static var wavelengthBounds: (minimum: Double, maximum: Double) {
    let minimum = try! wavelength(frequency: Config.maximumFrequency)
    let maximum = try! wavelength(frequency: Config.minimumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var periodBounds: (minimum: Double, maximum: Double) {
    let bounds = wavelengthBounds
    let minimum = try! period(bounds.minimum)
    let maximum = try! period(bounds.maximum)

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

  public static func frequency(_ wavelength: Double) throws -> Double {
    guard isValidWavelength(wavelength) else {
      throw PitchError.invalidWavelength
    }

    return AcousticWave.speed / wavelength
  }

  public static func wavelength(frequency frequency: Double) throws -> Double {
    guard PitchCalculator.isValidFrequency(frequency) else {
      throw PitchError.invalidFrequency
    }

    return AcousticWave.speed / frequency
  }

  public static func wavelength(period period: Double) throws -> Double {
    guard isValidPeriod(period) else {
      throw PitchError.invalidPeriod
    }

    return period * AcousticWave.speed
  }

  public static func period(_ wavelength: Double) throws -> Double {
    guard isValidWavelength(wavelength) else {
      throw PitchError.invalidWavelength
    }

    return wavelength / AcousticWave.speed
  }
}
