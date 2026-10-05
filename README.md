# TMXC OS - Volla Phone Quintus Edition

<div align="center">

**A Custom Microkernel Operating System for Volla Phone Quintus**

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Architecture: ARM64](https://img.shields.io/badge/Architecture-ARM64-blue.svg)](https://developer.arm.com/)
[![Target: Volla Phone Quintus](https://img.shields.io/badge/Target-Volla%20Phone%20Quintus-green.svg)]()
[![SoC: Dimensity 7050](https://img.shields.io/badge/SoC-Dimensity%207050-orange.svg)]()

</div>

---

## Overview

TMXC OS is a custom-engineered microkernel operating system designed **exclusively** for the **Volla Phone Quintus**. Built from scratch with a clean, optimized architecture, TMXC OS provides a native, efficient operating system tailored specifically for the MediaTek Dimensity 7050 (MT6877TT) chipset.

**Target Hardware**: Volla Phone Quintus only - no cross-device bloat or compatibility layers.

### Hardware Specifications

- **SoC**: MediaTek Dimensity 7050 (MT6877TT)
- **CPU**: 2x Cortex-A78 @ 2.6GHz + 6x Cortex-A55 @ 2.0GHz (8 cores)
- **GPU**: ARM Mali-G68 MP4 @ 800MHz
- **RAM**: 8GB LPDDR5 @ 0x40000000
- **Display**: 6.78" AMOLED, 2400x1080, 120Hz
- **UART**: 0x11002000 (for debug console)
- **WDT**: 0x10007000
- **Storage**: 256GB UFS
- **Battery**: 4700 mAh, 66W fast charging

### Key Features

- **Device-Specific Optimization**: Every line of code optimized for Volla Phone Quintus hardware
- **Clean Microkernel Architecture**: No bloat, no cross-device compatibility layers
- **Native ARM64 Support**: Full ARMv8.2-a with Cortex-A78 optimization
- **Hardware-Specific Drivers**: MediaTek-specific implementations
- **Memory Management**: 8GB LPDDR5 physical memory management
- **Display Driver**: 2400x1080 AMOLED @ 120Hz support
- **Efficient Bootloader**: ARM64 bootloader for MediaTek Dimensity 7050

## Quick Start

### Prerequisites

- `aarch64-none-elf-gcc` (ARM64 cross-compiler)
- `aarch64-none-elf-as` (ARM64 assembler)
- `aarch64-none-elf-ld` (ARM64 linker)
- `make` (Build tool)

### Installation

**Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install gcc-arm-none-eabi make
```

**Fedora/RHEL:**
```bash
sudo dnf install arm-none-eabi-gcc-cs make
```

**Arch Linux:**
```bash
sudo pacman -S arm-none-eabi-gcc make
```

**macOS:**
```bash
brew install gcc-arm-embedded make
```

**Windows:**
```powershell
choco install gcc-arm-embedded make
```

### Building TMXC OS

**Using PowerShell (Windows):**
```powershell
.\build_quintus.ps1
```

**Using Make (Cross-platform):**
```bash
make clean
make all
```

The build will produce `build/tmxc_os.bin` - the kernel binary ready for flashing to Volla Phone Quintus.

## Architecture

TMXC OS follows a clean, layered microkernel architecture designed specifically for the MediaTek Dimensity 7050.

```
┌─────────────────────────────────────────────────────────────┐
│                      Microkernel                             │
│  (Process Management, Memory Management, IPC, Scheduling)    │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      Driver Layer                            │
│  (Display Driver for MediaTek Controller, UART, Timer)       │
└─────────────────────────────────────────────────────────────┘
                              │
┌─────────────────────────────────────────────────────────────┐
│                      Hardware Layer                          │
│  (MediaTek Dimensity 7050, 8GB LPDDR5, AMOLED Display)      │
└─────────────────────────────────────────────────────────────┘
```

### Directory Structure

```
TMXC_OS - Volla Phone Quintus/
├── boot/              # ARM64 bootloader for MediaTek Dimensity 7050
│   └── arm64_bootloader.S
├── kernel/            # Microkernel implementation
│   ├── kernel_main.c  # Kernel entry point
│   ├── uart.c/h       # UART driver (0x11002000)
│   ├── memory.c/h     # Memory management (8GB LPDDR5)
│   ├── mmu.c/h        # Memory management unit
│   ├── exceptions.c/h # Exception handlers
│   ├── timer.c/h      # System timer
│   └── process.c/h    # Process management
├── drivers/           # Hardware drivers
│   └── display/       # Display driver (2400x1080 AMOLED)
│       ├── tmxc_display_driver.c
│       └── tmxc_display_driver.h
├── docs/              # Documentation
├── Makefile           # Build system
├── linker_arm64.ld    # ARM64 linker script (0x40080000)
└── build_quintus.ps1  # Windows build script
```

## Build System

The TMXC OS build system is optimized for the Volla Phone Quintus hardware:

### Available Make Targets

```bash
make              # Build kernel binary (default)
make clean        # Remove build artifacts
make info         # Show kernel information
make help         # Display help message
```

### Configuration

- **Architecture**: ARM64 (AArch64)
- **CPU Tuning**: Cortex-A78
- **Instruction Set**: ARMv8.2-a
- **Kernel Load Address**: 0x40080000
- **Physical Memory Base**: 0x40000000
- **Physical Memory Size**: 8GB (0x200000000)
- **UART Base**: 0x11002000
- **UART Clock**: 26MHz

## Hardware Configuration

### Memory Map

```
0x40000000 - 0x200000000  : 8GB LPDDR5 RAM
0x40080000 - 0x40280000  : Kernel (2MB)
0x40280000 - 0x40680000  : Page Tables (4MB)
0x14000000              : Display Controller Base
0x11002000              : UART Base
0x10007000              : Watchdog Timer
```

### Display Configuration

- **Resolution**: 2400x1080
- **Color Depth**: 32 bits per pixel
- **Refresh Rate**: 120Hz
- **Display Type**: AMOLED
- **Controller Base**: 0x14000000

## Development

### Coding Standards

- Follow C99 standard for kernel code
- Use 4-space indentation
- Maximum line length: 80 characters
- Functions should be small and focused
- Comments should explain "why", not "what"
- All code must be specific to Volla Phone Quintus hardware

### Adding New Features

When adding new features:
1. Ensure they are specific to MediaTek Dimensity 7050
2. Use correct hardware register addresses
3. Follow the existing microkernel architecture
4. Update documentation
5. Test on actual Volla Phone Quintus hardware

## Documentation

- [Boot Sequence Documentation](docs/BOOT_SEQUENCE_DOCUMENTATION.md) - Detailed boot process
- [Kernel Initialization](docs/KERNEL_INITIALIZATION_DOCUMENTATION.md) - Kernel startup sequence
- [Microkernel Architecture](docs/MICROKERNEL_ARCHITECTURE_SPEC.md) - Architecture specification
- [Codebase Audit Report](docs/CODEBASE_AUDIT_REPORT.md) - Code analysis

## Hardware Deployment

### Prerequisites

- Volla Phone Quintus device
- Unlocked bootloader
- USB data cable
- Fastboot/ADB tools
- TMXC OS kernel binary (build/tmxc_os.bin)

### Installation Steps

1. **Backup Data**: Backup all data from your device
2. **Unlock Bootloader**: Follow Volla's official bootloader unlock process
3. **Flash TMXC OS**: Use fastboot to flash the kernel
4. **Boot Device**: Reboot into TMXC OS

**⚠️ Important**: Installing custom OS may void your warranty. Always backup your data before proceeding.

## Performance

TMXC OS is optimized for the Volla Phone Quintus:

- **Boot Time**: Optimized for MediaTek Dimensity 7050
- **Memory Footprint**: Efficient 8GB LPDDR5 utilization
- **Power Efficiency**: Cortex-A78/A55 big.LITTLE optimization
- **Display Performance**: 120Hz AMOLED optimization

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Volla for the Volla Phone Quintus hardware
- MediaTek for the Dimensity 7050 chipset
- ARM Limited for ARM architecture documentation
- The GNU project for toolchain support

## Contact

- **Email**: tmxc.os.destek@gmail.com
- **Target Device**: Volla Phone Quintus only

---

<div align="center">

**Built exclusively for Volla Phone Quintus**

[⬆ Back to Top](#tmxc-os---volla-phone-quintus-edition)

</div>
