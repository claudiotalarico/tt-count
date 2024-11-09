# SPDX-FileCopyrightText: © 2024 Tiny Tapeout
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles


@cocotb.test()
async def test_project(dut):
      
      dut._log.info("Start")

      # Set the clock period to 20 ns (50 MHz)
      clock = Clock(dut.clk, 20, units="ns")
      cocotb.start_soon(clock.start())

      # Reset
      dut._log.info("Reset")
      dut.ena.value = 1
      dut.ui_in.value = 0
      dut.uio_in.value = 0
      dut.rst_n.value = 0
      await ClockCycles(dut.clk, 20)
      dut.rst_n.value = 1

      dut._log.info("Test project behavior")

      # Set the input values you want to test
      dut.ui_in.value = 7; # ui_in[2] = en, ui_in[1] = ud, ui_in[0] = test
                              
      ##dut.uio_in.value = 0

      # Wait for 100 clock cycle to see the output values
      await ClockCycles(dut.clk, 100)

      # The following assersion is just an example of how to check the output values.
      # Change it to match the actual expected output of your module:
      ## assert dut.uo_out.value == 50

      # Keep testing the module by changing the input values, waiting for
      # one or more clock cycles, and asserting the expected output values.
