# 📞 DTMF Signal Generation and Decoding in MATLAB

## 📖 Project Description

This project implements a complete **DTMF (Dual Tone Multi-Frequency)**
communication system in MATLAB.

It includes:

-   GUI Keypad (Transmitter)
-   DTMF Tone Generation
-   Audio Playback
-   FFT-based DTMF Decoding (Receiver)
-   Power Spectrum Visualization (Welch Method)

The project simulates how telephone systems generate and detect DTMF
tones.

------------------------------------------------------------------------

# 📌 What is DTMF?

DTMF (Dual Tone Multi-Frequency) is a signaling system used in
telecommunication.

Each key press generates **two sinusoidal tones simultaneously**:

-   One from a low-frequency group
-   One from a high-frequency group

Each key is uniquely identified by a pair of frequencies.

------------------------------------------------------------------------

# 📊 DTMF Frequency Table

<img width="787" height="191" alt="image" src="https://github.com/user-attachments/assets/9b0dcd3d-513c-4d5c-b2ef-5aef7db924b8" />

for example The image below also shows the frequency spectrum produced by key 1 :

<img width="827" height="700" alt="image" src="https://github.com/user-attachments/assets/909bba60-91c9-4d7e-8729-cfdf2a0ae355" />


------------------------------------------------------------------------

# 🎯 Project Objectives

-   Generate DTMF signals based on keypad input
-   Decode the generated signal using FFT
-   Identify pressed key via spectral analysis
-   Display frequency spectrum using Welch method
-   Simulate transmitter and receiver in one system

------------------------------------------------------------------------

# 🧠 Signal Processing Approach

## 1️⃣ Signal Generation

Each DTMF tone is generated as:

x(t) = sin(2πf_row t) + sin(2πf_col t)

Sampling Frequency: 8000 Hz\
Signal Duration: 0.5 seconds

------------------------------------------------------------------------

## 2️⃣ Signal Decoding

Decoding steps:

1.  Take FFT with N = 512

2.  Convert DTMF frequencies to FFT bin index:

    k = round((f × N) / fs)

3.  Find maximum magnitude in row and column groups

4.  Use lookup table to determine pressed key

------------------------------------------------------------------------

## 3️⃣ Spectrum Analysis

Power Spectral Density is computed using:

-   Hamming window
-   Overlap = 100 samples
-   Welch method

This improves frequency resolution and reduces spectral leakage.

------------------------------------------------------------------------

# 📂 Project Structure

<img width="298" height="274" alt="image" src="https://github.com/user-attachments/assets/b9451ff7-1eea-4ae3-bfaf-2558beaef8ca" />


------------------------------------------------------------------------

# 🚀 How to Run

1.  Open MATLAB
2.  Run: main
3.  Press any key on the keypad GUI
4.  The detected key and frequency spectrum will be displayed

------------------------------------------------------------------------

# 🔍 Why Hamming Window?

-   Reduces spectral leakage
-   Improves frequency detection accuracy
-   Smooths signal discontinuities

------------------------------------------------------------------------

# 🔍 Why FFT From Center of Signal?

-   Beginning and end may contain transient effects
-   Center represents steady-state tone
-   Improves decoding reliability

------------------------------------------------------------------------

# 🔍 Why N = 512?

Frequency resolution = fs / N

Higher N improves frequency resolution but increases computation.

512 is a balanced trade-off.

------------------------------------------------------------------------

# ✅ Features

-   GUI Keypad
-   Real-time Audio Playback
-   FFT-based DTMF Detection
-   Welch Spectrum Visualization
-   Modular Code Structure
-   Clean Academic Implementation 

------------------------------------------------------------------------

# Result 

keyPadd App : 

<img width="333" height="542" alt="image" src="https://github.com/user-attachments/assets/cdd7bdf5-8324-4bc9-a941-4faba56a9ff6" />

decode app  :

<img width="662" height="454" alt="image" src="https://github.com/user-attachments/assets/afc2f62e-36ec-41a7-9c64-e9797f349728" />


-------------------------------------------------------------------------

# 👨‍💻 Author

Keyhan Salehi
