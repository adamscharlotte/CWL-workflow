cwlVersion: v1.0
class: CommandLineTool

baseCommand: [Rscript]

requirements:
 - class: InlineJavascriptRequirement
inputs:
    CompPASS_R:
        type: File
        inputBinding:
            position: 1

    protein_directory_path:
        type: string
        inputBinding:
            position: 2

    gene_names:
        type: File
        inputBinding:
            position: 3
outputs:
    CompPASS_csv:
        type: File
        outputBinding: 
            glob: CompPASS.csv
