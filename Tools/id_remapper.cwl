cwlVersion: v1.0
class: CommandLineTool

baseCommand: [python3]

requirements:
 - class: InlineJavascriptRequirement

inputs:
    id_remapper_py:
        type: File
        inputBinding:
            position: 1

    protein_accessions_csv:
        type: File
        inputBinding:
            position: 2
            prefix: -i

    from:
        type: string
        inputBinding:
            position: 3
            prefix: -f
    to:
        type: string
        inputBinding:
            position: 4
            prefix: -t

    remapped_identifiers:
        type: string
        inputBinding:
            position: 5
            prefix: -o
    
    email:
        type: string
        inputBinding:
            position: 6
            prefix: -e

    fileType:
        type: string
        inputBinding:
            position: 7
            prefix: --output-format
outputs:
    remapped_identifiers_csv:
        type: File
        outputBinding: 
            glob: $(inputs.remapped_identifiers)
