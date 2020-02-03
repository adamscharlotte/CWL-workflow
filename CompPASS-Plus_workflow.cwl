cwlVersion: v1.0
class: Workflow
requirements:
    MultipleInputFeatureRequirement: {}

inputs:
    CompPASS_pre_R : File
    id_remapper_py: File
    CompPASS_R : File
    protein_directory_path: string
    from:
        type: string
        default: "ACC"
    to:
        type: string
        default: "GENENAME"
    remapped_identifiers:
        type: string
        default: "remapped_identifiers.csv"
    email: 
        type: string
        default: "charlotte.adams@student.uantwerpen.be"
    fileType: 
        type: string
        default: "CSV"
    
outputs:
    CompPASS_csv:
        type: File
        outputSource: CompPASS/CompPASS_csv

steps:
    CompPASS_pre:
        run: Tools/CompPASS_pre.cwl
        in:
            CompPASS_pre_R: CompPASS_pre_R
            protein_directory_path: protein_directory_path
        out:
            [protein_accessions_csv]

    id_remapper:
        run: Tools/id_remapper.cwl
        in:
            id_remapper_py: id_remapper_py
            protein_accessions_csv: CompPASS_pre/protein_accessions_csv
            from: from
            to: to
            remapped_identifiers: remapped_identifiers
            email: email
            fileType: fileType
        out:
            [remapped_identifiers_csv]
    
    CompPASS:
        run: Tools/CompPASS.cwl
        in: 
            CompPASS_R: CompPASS_R
            protein_directory_path: protein_directory_path
            gene_names: id_remapper/remapped_identifiers_csv
        out:
            [CompPASS_csv]
