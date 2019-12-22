cwlVersion: v1.0
class: CommandLineTool

baseCommand: [Rscript]

requirements:
 - class: InlineJavascriptRequirement

inputs:
    identifications_R:
        type: File
        inputBinding:
            position: 1

    csv:
        type: File
        inputBinding:
            position: 2

    bait:
        type: string
        inputBinding:
            position: 3

    mass_tolerance:
        type: string
        inputBinding:
            position: 4

outputs:
    identifications_csv:
        type: File
        outputBinding: 
            glob: $(inputs.bait)_identifications.csv

#    ANN-SoLo_identifications:
 #       type: stdout
#stdout: tibble.txt          #this will appear in the working directory
