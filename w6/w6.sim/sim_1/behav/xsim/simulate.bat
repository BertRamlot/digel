@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : simulate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for simulating the design by launching the simulator
REM
<<<<<<< HEAD
REM Generated by Vivado on Fri Nov 19 12:09:41 +0100 2021
=======
REM Generated by Vivado on Fri Nov 26 22:03:34 +0100 2021
>>>>>>> ecae7d1a4ff4fca3063760d65812e209a657fce7
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: simulate.bat
REM
REM ****************************************************************************
REM simulate design
echo "xsim tb_rom_example_behav -key {Behavioral:sim_1:Functional:tb_rom_example} -tclbatch tb_rom_example.tcl -view C:/Users/bertr/digel/w6/tb_rom_example_behav.wcfg -log simulate.log"
call xsim  tb_rom_example_behav -key {Behavioral:sim_1:Functional:tb_rom_example} -tclbatch tb_rom_example.tcl -view C:/Users/bertr/digel/w6/tb_rom_example_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
