public struct WaveCalculator {

  // MARK: - Validators

  public static func isValidWavelength(wavelength: Double) -> Bool {
    let wavelengthBounds = Config.wavelengthBounds

    return wavelength > 0.0
      && wavelength >= wavelengthBounds.minimum
      && wavelength <= wavelengthBounds.maximum
  }

  public static func isValidPeriod(period: Double) -> Bool {
    let periodBounds = Config.periodBounds

    print(periodBounds)

    return period > 0.0
      && period >= periodBounds.minimum
      && period <= periodBounds.maximum
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
