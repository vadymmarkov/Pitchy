public struct WaveCalculator {

  // MARK: - Conversions

  public static func frequency(wavelength wavelength: Double) throws -> Double {
    guard Validator.isValidWavelength(wavelength) else {
      throw Error.InvalidWavelength
    }

    return AcousticWave.speed / wavelength
  }

  public static func wavelength(frequency frequency: Double) throws -> Double {
    guard Validator.isValidFrequency(frequency) else {
      throw Error.InvalidFrequency
    }

    return AcousticWave.speed / frequency
  }

  public static func wavelength(period period: Double) throws -> Double {
    guard Validator.isValidPeriod(period) else {
      throw Error.InvalidPeriod
    }

    return period * AcousticWave.speed
  }

  public static func period(wavelength wavelength: Double) throws -> Double {
    guard Validator.isValidWavelength(wavelength) else {
      throw Error.InvalidWavelength
    }

    return wavelength / AcousticWave.speed
  }
}
