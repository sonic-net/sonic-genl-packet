# Copilot Instructions for sonic-genl-packet

## Project Overview

sonic-genl-packet provides tools and a library for working with Generic Netlink packets within SONiC. It includes a sniffer for capturing and recording Generic Netlink traffic (outputting pcapng files viewable in Wireshark) and a generator for sending test packets through the Generic Netlink multicast mechanism.

## Architecture

```
sonic-genl-packet/
├── genl-packet-module/      # Kernel module for Generic Netlink device
├── genl-packet-tools/       # Sniffer and generator CLI tools
├── libgenl-packet/          # Shared library for Generic Netlink operations
├── install_deps.sh          # Dependency installation script
├── WORKSPACE.bazel          # Bazel workspace configuration
├── ppp.BUILD                # External dependency BUILD file
└── README.md
```

### Key Concepts
- **Generic Netlink**: Linux kernel's extensible netlink protocol for custom communication
- **Sniffer**: Captures Generic Netlink traffic and records to pcapng files
- **Generator**: Sends test packets through Generic Netlink for debugging
- **pcapng output**: Captures can be analyzed in Wireshark

## Language & Style

- **Primary language**: C++
- **Build system**: Bazel
- **Dependencies**: libnl (libnl-3, libnl-genl-3, libnl-route-3, libnl-nf-3)
- **Naming conventions**: Follow standard C++ conventions
- **Indentation**: 4 spaces

## Build Instructions

```bash
# Install dependencies
./install_deps.sh

# Build with Bazel
bazel build genl-packet:sniffer
bazel build genl-packet:generator

# Binaries in bazel-bin/genl-packet/
# Can also be built via sonic-buildimage
```

## Usage

```bash
# Capture Generic Netlink traffic to out.pcapng
genl-packet

# Append to existing capture
genl-packet -a

# Specify output file
genl-packet -f capture.pcapng
```

## PR Guidelines

- **Signed-off-by**: Required on all commits
- **CLA**: Sign Linux Foundation EasyCLA
- **Testing**: Verify sniffer and generator functionality
- **Build**: Ensure Bazel build succeeds and produces working binaries

## Gotchas

- **Kernel module**: The Generic Netlink device must be created by a privileged user
- **Privileges**: Reading/writing packets requires appropriate netlink permissions
- **Bazel version**: Ensure Bazel version compatibility with WORKSPACE.bazel
- **libnl versions**: Must match the specific libnl package versions expected
- **pcapng format**: Follow the pcapng specification for any capture format changes
