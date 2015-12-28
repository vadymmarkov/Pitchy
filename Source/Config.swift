public struct Config {

  public static var minimumFrequency = 20.0
  public static var maximumFrequency = 4190.0

  public static var wavelengthBounds: (minimum: Double, maximum: Double) {
    let minimum = try! WaveCalculator.wavelength(frequency: maximumFrequency)
    let maximum = try! WaveCalculator.wavelength(frequency: minimumFrequency)

    return (minimum: minimum, maximum: maximum)
  }

  public static var periodBounds: (minimum: Double, maximum: Double) {
    let bounds = wavelengthBounds
    let minimum = try! WaveCalculator.period(wavelength: bounds.minimum)
    let maximum = try! WaveCalculator.period(wavelength: bounds.maximum)

    return (minimum: minimum, maximum: maximum)
  }
}
