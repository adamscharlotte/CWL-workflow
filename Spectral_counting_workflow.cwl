cwlVersion: v1.0
class: Workflow
requirements:
    MultipleInputFeatureRequirement: {}

inputs:
    mztab_to_idxml_py: File  
    mztab: File
    bait: string
    fasta: File
    idxml_output: string
    pepxml_output: string
    missing_decoy_action:
        type: string
        default: "silent"
    enzyme_specificity:
        type: string
        default: "full"
    IL_equivalent:
        type: boolean
        default: TRUE
    allow_unmatched:
        type: boolean
        default: TRUE
    unique_per_protein:
        type: boolean
        default: TRUE

outputs:
    pepxml:
        type: File
        outputSource: ID_file_converter/pepxml

steps:
    mztab_to_idxml:
        run: Tools/mztab_to_idxml.cwl
        in:
            mztab_to_idxml_py: mztab_to_idxml_py
            mztab: mztab
            bait: bait
        out:
            [idxml]

    peptide_indexer:
        run: Tools/peptide_indexer.cwl
        in:
            input: mztab_to_idxml/idxml
            fasta: fasta
            idxml_output: idxml_output
            missing_decoy_action: missing_decoy_action
            IL_equivalent: IL_equivalent
            enzyme_specificity: enzyme_specificity
            allow_unmatched: allow_unmatched
        out:
            [idxml]

    ID_filter:
        run: Tools/ID_filter.cwl
        in: 
            input: peptide_indexer/idxml
            output: idxml_output
            unique_per_protein: unique_per_protein
        out:
            [idxml]
    
    ID_file_converter:
        run: Tools/ID_file_converter.cwl
        in: 
            input: ID_filter/idxml
            output: pepxml_output
        out:
            [pepxml]
