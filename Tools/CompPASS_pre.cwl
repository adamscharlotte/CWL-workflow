cwlVersion: v1.0
class: CommandLineTool

baseCommand: [Rscript]

requirements:
 - class: InlineJavascriptRequirement
inputs:
    CompPASS_pre_R:
        type: File
        inputBinding:
            position: 1

    protein_directory_path:
        type: string
        inputBinding:
            position: 2

outputs:
    protein_accessions_csv:
        type: File
        outputBinding: 
            glob: protein_accessions.csv
#    tibbles:
 #       type: stdout
#stdout: tibble.txt          #this will appear in the working directory