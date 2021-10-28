@echo off
REM ****************************************************************************
REM Vivado (TM) v2020.2 (64-bit)
REM
REM Filename    : elaborate.bat
REM Simulator   : Xilinx Vivado Simulator
REM Description : Script for elaborating the compiled design
REM
REM Generated by Vivado on Thu Oct 28 15:46:20 +0200 2021
REM SW Build 3064766 on Wed Nov 18 09:12:45 MST 2020
REM
REM Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
REM
REM usage: elaborate.bat
REM
REM ****************************************************************************
REM elaborate design
echo "xelab -wto 33a40c3fb69a48acac70df0f434d9e46 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_rom_example_behav xil_defaultlib.tb_rom_example -log elaborate.log"
call xelab  -wto 33a40c3fb69a48acac70df0f434d9e46 --incr --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot tb_rom_example_behav xil_defaultlib.tb_rom_example -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
