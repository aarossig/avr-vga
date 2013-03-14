# AVR-based VGA Generator

## Overview

This project implements a VGA generator that runs on an AVR microcontroller.

The software is written in assembly due to its' timing critical nature.

## VGA Generator

You will find the VGA generator in the src/ folder.

## Image Converter

Images are converted from png to bin using the image-converter utility. This
utility is currently very crude and works with only pre-indexed images.
