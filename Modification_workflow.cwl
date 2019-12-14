cwlVersion: v1.0
class: Workflow
requirements:
    MultipleInputFeatureRequirement: {}

inputs:
    R_script: File
    Path: string
    name: string
    mass_tolerance:
        type: string
        default: "50"
    python_script: File
    unimod_path: string

outputs:
    mod_csv:
        type: File
        outputSource: modifications_fast/mod_csv
#    tibble:
 #       type: File
  #      outputSource: modifications_fast/tibbles

steps:
    modifications:
        run: /Users/adams/Desktop/Thesis/Thesis/Code/CWL/Tools/modifications.cwl
        in: 
            R_script: R_script
            Path: Path
            name: name
            mass_tolerance: mass_tolerance
        out:
            [tol_py_csv]

    modifications_fast:
        run: /Users/adams/Desktop/Thesis/Thesis/Code/CWL/Tools/modifications_fast.cwl
        in: 
            python_script: python_script
            name: name
            unimod_path: unimod_path
            input_path: modifications/tol_py_csv
        out:
            [mod_csv]