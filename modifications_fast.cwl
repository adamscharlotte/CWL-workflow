cwlVersion: v1.0
class: CommandLineTool

baseCommand: [python3]

requirements:
 - class: InlineJavascriptRequirement

inputs:
    python_script:
        type: File
        inputBinding:
            position: 1

    name:
        type: string
        inputBinding:
            position: 2

    unimod_path:
        type: string
        inputBinding:
            position: 3
 
    input_path:
        type: File
        inputBinding:
            position: 4

outputs:
    mod_csv:
        type: File
        outputBinding: 
            glob: $(inputs.name)_mod.csv
#    tibbles:
 #       type: stdout
#stdout: tibble.txt          #this will appear in the working directory