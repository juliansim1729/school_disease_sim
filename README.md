# school_disease_sim

A customizable simulation of the spread of an infectious disease at a secondary school based off the work of Jenness et al. on [EpiModel](https://www.epimodel.org/). This work was completed as part of an undergraduate thesis under the guidance of Dr. David Hunter for the Schreyer Honors College at the Pennsylvania State University, and the full thesis can be viewed [here](https://honors.libraries.psu.edu/catalog/8733jzs6321).

Currently, this repository is being redesigned and rebuilt from a pre-existing directory located [here](https://github.com/juliansim1729/EpiModelExpansion) to complete several design goals that were not accomplished during the span of my undergraduate thesis writing, namely:

    1. Edge Covariates
    2. Customizable Module Design
    3. Full Shiny Integration

## The Modular System
Within base EpiModel, the progression of a disease is simulated by modeling a network (in our case, students are represented as vertices and friendships are represented as edges) and a modular stack on that network. This modular stack follows compartmental model designs commonly seen within literature (e.g. Susceptible-Infected-Recovered) and traces through the progression of the disease by first modeling all Susceptible to Infected infections, then all Infected to Recovered progressions. Several other helper and diagnostic functions are also included within this module stack, and running through this module stack once completes a single step. The cycle then repeats until the desired amount of steps in the simulation have been completed. 

Modules within this stack are represented as R functions with two parameters, `dat`, a data object containing the following items and `at`, which indicates the step the system is on.
    1. temp 
    2. temp
    3. temp
    4. temp
    5. temp

Two main modules are of primary interest:
    1. infection: This module describes disease mechanics where nodes can affect the status of their neighbors.
    2. progression: This module describes disease mechanics which are all internal to a specific node.

This project adds additional parameters to these modules, namely `from`, `to`, and `by` for the infection module, which describe:
    - **from** which compartment/status the node is changing from
    - **to** which status the node is becoming
    - **by** which status can cause this to happen (in case of infection)

To see this more clearly, consider the Susceptible-Exposed-Infected-Recovered-Susceptible (SEIRS) model of infection, where patients enter a so-called "exposed" stage when they are first infected, where they themselves are not infectious yet. This system would model this interaction between Susceptible, Exposed, and Infected subjects through an Infection module with `from = "s"`, `to = "e"`, `by = "i"`.