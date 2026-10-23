PC16 — Asynchronous Programming in Dart (Week 11)

Overview

This project builds upon the Object-Oriented Programming (OOP) foundation established in Weeks 9 and 10 by incorporating asynchronous operations using Dart's Future, async, and await keywords.

The program simulates vehicle diagnostics using simulated delays, demonstrating how asynchronous tasks run without blocking the application flow.

Features

Base Class (Vehicle): Defines core attributes (brand, speed) and methods.

Inheritance (Car, ElectricScooter): Derived classes extending base vehicle functionality.

Abstract Class (Maintainable): Enforces maintenance interface implementation.

Mixin (Logger): Reusable logging capabilities attached to ServiceCenter.

Asynchronous Method (runDiagnostics): Returns a Future<String> with a 2-second simulated delay using Future.delayed.

Non-Blocking Proof: Immediate terminal outputs demonstrating correct execution order prior to await completion.
