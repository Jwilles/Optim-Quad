## Quadcopter Mechanical Design Optimzation 

Optimization of the mechanical design of a quadcopter at a component level using DACE for meta-modelling and MATLAB fmincon with interior point method. Design may be optimized for payload capacity, flight time or dynamic performance with respect to battery, propeller and motor choices. 

## Use 
1. Install the DACE toolbox in the working directory. More info can be found at http://www2.imm.dtu.dk/projects/dace/ 
2. OPTIONAL: Modify component meta-models in QuadcopterMetaModelling.m and run to update .mat files 
3. OPTIONAL: Modify non-linear constraints and select optimization objective in ObjectiveFunction.m 
4. Run OptimMain.m to run the optimization 
