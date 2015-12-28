public struct Validator {

  public static func isValidFrequency(frequency: Double) -> Bool {
    return frequency > 0.0
      && frequency >= Config.minimumFrequency
      && frequency <= Config.maximumFrequency
  }

  public static func isValidWavelength(wavelength: Double) -> Bool {
    return wavelength > 0.0
  }

  public static func isValidPeriod(period: Double) -> Bool {
    return period > 0.0
  }
}
