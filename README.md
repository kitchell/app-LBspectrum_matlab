[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.97-blue.svg)](https://doi.org/10.25663/bl.app.97)

# app-LBspectrum_matlab

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes the Laplace-Beltrami spectrum (eigenvalues and eigenvectors) of each VTK surface mesh in a 3D surfaces dataset with compiled MATLAB code.**

For every .vtk mesh in the input surfaces directory, normalizes the mesh by surface area, builds the cotangent Laplacian and barycentric mass matrix, and solves for the spectrum_size smallest eigenpairs. Eigenvalues go to spectrum.json and, when save_eigenvectors is true, eigenvectors go to eigenvectors.mat. Use it for shape analysis or to reconstruct surfaces from eigenfunctions; meshes with too few vertices for the requested spectrum are skipped.

| | |
|---|---|
| 📥 **Inputs** | `neuro/3Dsurfaces` |
| 📤 **Outputs** | `neuro/laplace_beltrami_spectrum` · `raw` |
| 🐳 **Container** | `brainlife/mcr:neurodebian1604-r2017a` |
| ⚙️ **Resources** | 8 CPUs · 28 GB memory · 8 h walltime |
| 🔗 **Run it** | [doi.org/10.25663/bl.app.96](https://doi.org/10.25663/bl.app.96) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `0` | `neuro/3Dsurfaces` | yes | Directory of triangle surface meshes in VTK format, one per structure. Only *.vtk files are read; each mesh needs more vertices than spectrum_size. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `0` | `neuro/laplace_beltrami_spectrum` | spectrum.json with the Laplace-Beltrami eigenvalues for each surface, keyed by surface name. |
| `1` | `raw` | eigenvectors.mat (MATLAB v7.3) with the eigenvectors for each surface, written when save_eigenvectors is true. |

<details>
<summary><b>⚙️ Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `save_eigenvectors` | boolean | `true` | this app saves the eigenvectors |
| `spectrum_size` | number | `50` | number of eigenvalues |

</details>

📚 **References used by this App:**
- Kitchell L. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. Indiana University (2020).

<!-- brainlife-app:end -->

This service computes the Laplace Beltrami Spectrum of 3D surfae meshes using Matlab.

### Author
- Lindsey Kitchell (kitchell@indiana.edu)

### Contributors
- Soichi Hayashi (hayashis@iu.edu)

### Funding 
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations
We kindly ask that you cite the following when publishing papers and code using this code. 

1. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

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

