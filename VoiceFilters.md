# VoiceFilters SDK

The Synervoz VoiceFilters SDK allows you to easily add voice filters features to your iOS audio application.

To get started, check out the [Integration guide](#Integration) or have a look at a few [example integrations](#Example-Integrations).

## Requirements

The VoiceFilters iOS SDK supports devices on iOS 11 and above. 

### Sample Rate Support

There is currently support for the following sample rates: 8000, 16000, 44100, 48000. An API call to `VoiceFiltersSetSampleRate` is needed to set a filters sample rate, and before any audio processing is done.

## Integration

The VoiceFilters SDK can be integrated in your C/C++, Objective-C or Swift project with ease. 

First, add the xcframework to your project under Project Settings → General → Frameworks and Libraries. Language specific integration instructions follow. 

### C API

The native C API is the recommended method of integration with the PinPoint SDK. The steps to get up and running with a basic integration are as follows: 

1. Add the C API header to your code using `#include <voicefilters/VoiceFiltersAPI.h>`
2. Create a noise filter object using the `VoiceFilterCreate` function:
`VoiceFilter voiceFilter = VoiceFilterCreate();` 
3. The noise filter operates on audio at 16 KHz and automatically handles sample rate conversion for you. Set your input sample rate using the `VoiceFilterSetSampleRate` function:
`VoiceFilterSetSampleRate(voiceFilter, 44100);`
4. Call `VoiceFilterProcessVoice` in your audio callback with your input audio buffer. Transformations happens in place and the cleaned up audio is available in the same buffer. 
`VoiceFilterProcessVoice(voiceFilter, audioBuffer, numberOfSamples);`
5. Use the `VoiceFilterGetIsEnabled/VoiceFilterSetIsEnabled` functions to enable/disable the filter as and when its required.
`VoiceFilterSetIsEnabled(voiceFilter, true);`
6. When you're done with processing audio, call `VoiceFilterDestroy`.
`VoiceFilterDestroy(voiceFilter);`

### Objective-C

The Objective-C API is also available to use by following the below steps:

1. The extension of the .cpp file consuming the API must be changed to .mm and adding `#import <voicefilters/PinPoint.h>` to the file.

2. Create a noise filter object using `PPNoisefilter* noiseFilter = [[PPNoiseFilter alloc] init]`  

3. Setting the noise filter sample rate using the `setSampleRate` function: 

`[noiseFilter setSampleRate:44000]`. This must be done before the filter is ready to process any audio.

4. The `processAudio` function is called during the audio callback with your input audio buffer, and the number of samples. Transformations happens in place and the cleaned up audio is available in the same buffer. `[noiseFilter processAudio:audioBuffer numberOfSamples:numSamples]`.

5. The filter can then be enabled, and disabled by using the enabled property on the object `noiseFilter.enabled = false;`

### Swift

The PinPoint API is also available to be used with Swift following the below steps:

1. Import the PinPoint module in the Swift file consuming the API by using `import PinPoint`
2. Create a noise filter object using `var noiseFilter = PPNoiseFilter()`
3. Setting the noise filter sample rate using `setSampleRate` function: `noiseFilter.setSampleRate(44000)` This must be done before the filter is ready to process any audio.
 4. The `processAudio` function is called during the audio callback with your input audio buffer, and the number of samples. Transformations happens in place and the cleaned up audio is available in the same buffer. `noiseFilter.processAudio(audioBuffer, numberOfSamples: numSamples)`
5. Both the `processAudio` and `setSampleRate` functions return a `NoiseFilterStatus` which may indicate any Internal Errors or signs of No Output if they occur.
6. The filter can then be enabled, and disabled by using the enabled property on the object `noiseFilter.enabled = false;`

### Example Integrations

- Communication Services - This example demonstrates how you can integrate with communication services like Agora.

### Logging

The Logger provided has five levels which can be set with `VoiceFilterSetLogLevel` function with the default being `VoiceFilterLogLevelInfo`. For more detailed messages for the console `VoiceFilterLogLevelTrace`, and `VoiceFilterLogLevelDebug` are also provided. These more detailed messages may impact performance. Finally `VoiceFilterLogLevelWarning` and `VoiceFilterLogLevelError` are provided for warning and error messages.
