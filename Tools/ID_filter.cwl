cwlVersion: v1.0
class: CommandLineTool

baseCommand: [/Applications/OpenMS-2.4.0/bin/IDFilter]

inputs:
    input:
        type: File
        inputBinding:
            position: 1
            prefix: -in
    
    output:
        type: string
        inputBinding:
            position: 2
            prefix: -out

    unique_per_protein:
        type: boolean
        inputBinding:
            position: 3
            prefix: -unique_per_protein

outputs:
    idxml:
        type: File
        outputBinding: 
            glob: $(inputs.output)
