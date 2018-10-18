[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.1-blue.svg)](https://doi.org/10.25663/bl.app.1)

# app-LBspectrum_matlab
This service computes the Laplace Beltrami Spectrum of 3D surfae meshes using Matlab.

### Author
- Lindsey Kitchell (kitchell@indiana.edu)

### Contributors
- Soichi Hayashi (hayashis@iu.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://brainlife.io/app/5a53b2be56e507002d1a9628](https://brainlife.io/app/5a53b2be56e507002d1a9628) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
    "save_eigenvectors": false,
    "surfaces": "../surfaces",
    "spectrum_size": 10,
}
```
If you have singularity on your local machine:

3. Launch the App by executing `main`

```bash
./main
```

Otherwise:

3. Execute the main.m file in Matlab
### Sample Datasets

If you don't have your own input file, you can download sample datasets from Brainlife.io, or you can use [Brainlife CLI](https://github.com/brain-life/cli).


## Output

The main output of this App is a file called `spectrum.json`. This file contains the eigenvalues of the Laplace Beltrami spectrum for each surface file in the input folder.

If you requested the eigenvectors be saved you will also have a file called `eigenvectors.mat`. This file contains the eigenvectors of the Laplace Beltrami spectrum for each surface file in the input folder.


### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.  

  - MATLAB: https://www.mathworks.com/products/matlab.html
  - JSONlab: https://www.mathworks.com/matlabcentral/fileexchange/33381-jsonlab-a-toolbox-to-encode-decode-json-files
  - geom3D: https://www.mathworks.com/matlabcentral/fileexchange/24484-geom3d

