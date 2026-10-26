# TEMPLATE ONLY. Never add this file to a working constraints set as-is.
# Required: exact board model, manufacturer pinout, oscillator, voltage banks,
# reset/start conditioning, accessible status outputs and programmer identity.
# Replace every placeholder using manufacturer documentation, then review.
# set_property PACKAGE_PIN <MANUFACTURER_CLOCK_PACKAGE_PIN> [get_ports clk]
# set_property IOSTANDARD <VERIFIED_CLOCK_IOSTANDARD> [get_ports clk]
# set_property PACKAGE_PIN <VERIFIED_RESET_PIN> [get_ports rst]
# set_property IOSTANDARD <VERIFIED_RESET_IOSTANDARD> [get_ports rst]
# Add ONLY verified start/status pins and any justified input/output delays.
# Change clock_only.xdc period to the documented oscillator or generated clock.
error "board_pins_TEMPLATE.xdc is intentionally non-executable; board data missing"
