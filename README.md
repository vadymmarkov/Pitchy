![Pitchy](https://github.com/vadymmarkov/Pitchy/blob/master/Resources/PitchyPresentation.png)

[![CI Status](http://img.shields.io/travis/vadymmarkov/Pitchy.svg?style=flat)](https://travis-ci.org/vadymmarkov/Pitchy)
[![Version](https://img.shields.io/cocoapods/v/Pitchy.svg?style=flat)](http://cocoadocs.org/docsets/Pitchy)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![License](https://img.shields.io/cocoapods/l/Pitchy.svg?style=flat)](http://cocoadocs.org/docsets/Pitchy)
[![Platform](https://img.shields.io/cocoapods/p/Pitchy.svg?style=flat)](http://cocoadocs.org/docsets/Pitchy)

**Pitchy** provides a simple way to get a music pitch from a frequency. Other
than that it has a bunch of useful data structures, calculators and helper
functions to work with notes, octaves and acoustic waves.

From [Wikipedia](https://en.wikipedia.org/wiki/Pitch_(music)):
> Pitch is a perceptual property of sounds that allows their ordering on a
> frequency-related scale, or more commonly, pitch is the quality that makes
> it possible to judge sounds as "higher" and "lower" in the sense associated
> with musical melodies.

## Table of Contents

<img src="https://github.com/vadymmarkov/Pitchy/blob/master/Resources/PitchyIcon.png" alt="Pitchy Icon" width="193" height="195" align="right" />

* [Key features](#key-features)
* [Usage](#usage)
  * [Pitch](#pitch)
  * [Acoustic wave](#acoustic-wave)
  * [Note](#note)
  * [Calculators](#calculators)
  * [FrequencyValidator](#config)
  * [Error handling](#error-handling)
* [Installation](#installation)
* [Author](#author)
* [Contributing](#contributing)
* [License](#license)

## Key features
- Get lower, higher and closest pitch offsets from a specified frequency.
- Get an acoustic wave with wavelength, period and harmonics.
- Create a note from a pitch index, frequency or a letter with octave number.
- Calculate a frequency, note letter and octave from a pitch index
- Find a pitch index from a specified frequency or a note letter with octave.
- Convert a frequency to wavelength and vice versa.
- Convert a wavelength to time period and vice versa.

## Usage

### Pitch
Create `Pitch` struct with a specified frequency to get lower, higher and
closest pitch offsets:

```swift
do {
  // Frequency = 445 Hz
  let pitch = try Pitch(frequency: 445.0)
  let pitchOffsets = pitch.offsets

  print(pitchOffsets.lower.frequency)     // 5 Hz
  print(pitchOffsets.lower.percentage)    // 19.1%
  print(pitchOffsets.lower.note.index)    // 0
  print(pitchOffsets.lower.cents)         // 19.56

  print(pitchOffsets.higher.frequency)    // -21.164 Hz
  print(pitchOffsets.higher.percentage)   // -80.9%
  print(pitchOffsets.higher.note.index)   // 1
  print(pitchOffsets.higher.cents)        // -80.4338

  print(pitchOffsets.closest.note.string) // "A4"

  // You could also use acoustic wave
  print(pitch.wave.wavelength)            // 0.7795 meters
} catch {
  // Handle errors
}
```

### Acoustic wave
Get an acoustic wave with wavelength, period and harmonics.

```swift
do {
  // AcousticWave(wavelength: 0.7795)
  // AcousticWave(period: 0.00227259)
  let wave = try AcousticWave(frequency: 440.0)

  print(wave.frequency)       // 440 Hz
  print(wave.wavelength)      // 0.7795 meters
  print(wave.period)          // 0.00227259 s
  print(wave.harmonics[0])    // 440 Hz
  print(wave.harmonics[1])    // 880 Hz
} catch {
  // Handle errors
}
```

### Note
Note could be created with a corresponding frequency, letter + octave number or
a pitch index.

```swift
do {
  // Note(frequency: 261.626)
  // Note(letter: .C, octave: 4)
  let note = try Note(index: -9)

  print(note.index)                 // -9
  print(note.letter)                // .C
  print(note.octave)                // 4
  print(note.frequency)             // 261.626 Hz
  print(note.string)                // "C4"
  print(try note.lower().string)    // "B3"
  print(try note.higher().string)   // "C#4"
} catch {
  // Handle errors
}
```

### Calculators

Calculators are used in the initialization of `Pitch`, `AcousticWave`
and `Note`, but also are included in the public API.

```swift
do {
  // PitchCalculator
  let pitchOffsets = try PitchCalculator.offsets(445.0)
  let cents = try PitchCalculator.cents(
    frequency1: 440.0,
    frequency2: 440.0
  ) // 19.56

  // NoteCalculator
  let frequency1 = try NoteCalculator.frequency(forIndex: 0)       // 440.0 Hz
  let letter = try NoteCalculator.letter(forIndex: 0)              // .A
  let octave = try NoteCalculator.octave(forIndex: 0)              // 4
  let index1 = try NoteCalculator.index(forFrequency: 440.0)       // 0
  let index2 = try NoteCalculator.index(forLetter: .A, octave: 4)  // 0

  // WaveCalculator
  let f = try WaveCalculator.frequency(forWavelength: 0.7795)      // 440.0 Hz
  let wl1 = try WaveCalculator.wavelength(forFrequency: 440.0)     // 0.7795 meters
  let wl2 = try WaveCalculator.wavelength(forPeriod: 0.00227259)   // 0.7795 meters
  let period = try WaveCalculator.period(forWavelength: 0.7795)    // 0.00227259 s
} catch {
  // Handle errors
}
```

### FrequencyValidator

With a help of `FrequencyValidator` it's possible to adjust minimum and
maximum frequencies that are used for validations in all calculations:

```swift
FrequencyValidator.minimumFrequency = 20.0
FrequencyValidator.maximumFrequency = 4190.0
```

### Error handling

Almost everything is covered with tests, but it's important to pass valid
values, such as frequencies and pitch indexes. That's why there a re a list of
errors that should be handled properly.

```swift
enum Error: ErrorType {
  case InvalidFrequency
  case InvalidWavelength
  case InvalidPeriod
  case InvalidPitchIndex
  case InvalidOctave
}
```

## Installation

**Pitchy** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Pitchy'
```

**Pitchy** is also available through [Carthage](https://github.com/Carthage/Carthage).
To install just write into your Cartfile:

```ruby
github "vadymmarkov/Pitchy"
```

**Pitchy** is also distributed using the [Swift Package Manager](https://swift.org/package-manager). To install it into a project, simply add it as a dependency within your `Package.swift` manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/vadymmarkov/Pitchy.git", from: "0.1.0")
    ],
    ...
)
```

For more information on how to use the Swift Package Manager, check out [this article](https://www.swiftbysundell.com/articles/managing-dependencies-using-the-swift-package-manager), or [its official documentation](https://github.com/apple/swift-package-manager/tree/master/Documentation).

## Author

Vadym Markov, markov.vadym@gmail.com

## Contributing

Check the [CONTRIBUTING](https://github.com/vadymmarkov/Pitchy/blob/master/CONTRIBUTING.md)
file for more info.

## License

**Pitchy** is available under the MIT license. See the LICENSE file for more info.
