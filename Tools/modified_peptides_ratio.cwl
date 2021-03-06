cwlVersion: v1.0
class: CommandLineTool

baseCommand: [Rscript]

requirements:
 - class: InlineJavascriptRequirement

inputs:
    R_script:
        type: File
        inputBinding:
            position: 1

    Path:
        type: string
        inputBinding:
            position: 2

    name:
        type: string
        inputBinding:
            position: 3

    mass_tolerance:
        type: string
        inputBinding:
            position: 4

outputs:
    tibbles:
        type: stdout
stdout: tibble.txt          #this will appear in the working directory
