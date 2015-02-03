#!/bin/bash

# Set up and run simulation in serial mode.

if [ ! -e output ]; then
    echo "Making output directory..."
    mkdir output
fi

# Clean up any leftover files
echo "Cleaning up previous simulation..."
yank cleanup --store=output

# Set up calculation
echo "Setting up binding free energy calculation..."
yank prepare binding amber --setupdir=setup --ligname=MOL --store=output --iterations=1 --restraints=harmonic --gbsa=OBC2 --temperature="300*kelvin" --verbose --iterations=10

# Run the simulation with verbose output
echo "Running simulation..."
yank run --store=output --verbose

# Analyze the simulation
echo "Analyzing simulation..."
yank analyze --store=output --verbose
