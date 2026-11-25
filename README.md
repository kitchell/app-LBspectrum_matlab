<h1 align="center">LBspectrum matlab</h1>

<p align="center">
  Computes the Laplace-Beltrami spectrum (eigenvalues and eigenvectors) of each VTK surface mesh in a 3D surfaces dataset with compiled MATLAB code.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/bl.app.96"><img src="https://img.shields.io/badge/Brainlife-bl.app.96-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-see_LICENSE-lightgrey.svg" alt="License"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Computes the Laplace-Beltrami spectrum (eigenvalues and eigenvectors) of each VTK surface mesh in a 3D surfaces dataset with compiled MATLAB code.**

For every .vtk mesh in the input surfaces directory, normalizes the mesh by surface area, builds the cotangent Laplacian and barycentric mass matrix, and solves for the spectrum_size smallest eigenpairs. Eigenvalues go to spectrum.json and, when save_eigenvectors is true, eigenvectors go to eigenvectors.mat. Use it for shape analysis or to reconstruct surfaces from eigenfunctions; meshes with too few vertices for the requested spectrum are skipped.

| | |
|---|---|
| **Inputs** | `neuro/3Dsurfaces` |
| **Outputs** | `neuro/laplace_beltrami_spectrum` · `raw` |
| **Container** | `brainlife/mcr:neurodebian1604-r2017a` |
| **Resources** | 8 CPUs · 28 GB memory · 8 h walltime |
| **Run it** | [doi.org/10.25663/bl.app.96](https://doi.org/10.25663/bl.app.96) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `0` | `neuro/3Dsurfaces` | yes | Directory of triangle surface meshes in VTK format, one per structure. Only *.vtk files are read; each mesh needs more vertices than spectrum_size. |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `0` | `neuro/laplace_beltrami_spectrum` | spectrum.json with the Laplace-Beltrami eigenvalues for each surface, keyed by surface name. |
| `1` | `raw` | eigenvectors.mat (MATLAB v7.3) with the eigenvectors for each surface, written when save_eigenvectors is true. |

<details>
<summary><b>Parameters</b> (2)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `save_eigenvectors` | boolean | `true` | this app saves the eigenvectors |
| `spectrum_size` | number | `50` | number of eigenvalues |

</details>

<!-- brainlife-app:end -->

## Versions on brainlife.io

This repository hosts several Apps, each built from its own branch.

| App | Branch | Run it | Status |
|---|---|---|---|
| Laplace Beltrami Spectrum: Eigenvalues and Eigenvectors | [`singularity_evecs`](https://github.com/kitchell/app-LBspectrum_matlab/tree/singularity_evecs) | [doi:10.25663/bl.app.96](https://doi.org/10.25663/bl.app.96) | current |
| Laplace Beltrami Spectrum: Eigenvalues Only | [`singularity`](https://github.com/kitchell/app-LBspectrum_matlab/tree/singularity) | [doi:10.25663/bl.app.97](https://doi.org/10.25663/bl.app.97) | available |

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/bl.app.96](https://doi.org/10.25663/bl.app.96), choose `neuro/3Dsurfaces` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/laplace_beltrami_spectrum`, `raw`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/mcr:neurodebian1604-r2017a`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository and check out the App's branch (`git checkout singularity_evecs`).
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "surfaces": "/path/to/0/surfaces",
       "save_eigenvectors": true,
       "spectrum_size": 50
   }
   ```

3. Run `./main`.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- Laplace Beltrami Spectrum: Eigenvalues and Eigenvectors. brainlife.io App. [doi:10.25663/bl.app.96](https://doi.org/10.25663/bl.app.96)
- Kitchell L. Shape Analysis of Human White Matter Tracts: An Examination of Normal Morphological Variability and the Association Between Morphology, Brain Size, and Behavior. Indiana University (2020).
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Lindsey Kitchell

**Contributors**

- Soichi Hayashi

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>

## License

See [LICENSE](LICENSE).
