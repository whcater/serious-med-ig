Profile: SmPatientBase
Parent: Patient
Id: sm-patient
Title: "SmPatient Base"
Description: "This profile represents the constraints applied to the Patient resource by the International Patient Summary FHIR Implementation Guide and describes the minimum expectations for the Patient resource when used in the composition or in one of the referred resources."
* identifier MS  
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "type"
* identifier ^slicing.rules = #open
* identifier ^slicing.ordered = false
* identifier contains
    patientId 1..1 MS  
* identifier[patientId] ^short = "patient id" 
* identifier[patientId].value ^maxLength = 12  
* name 1..* MS 
* name.text 1..1 MS
* name.text ^short = "English full name, Patient’s full name in English" 
* name.text ^min = 0
* name.text ^maxLength = 100
* name.family 0..1 MS
* name.family ^short = "English surname, Patient's surname in English"
* name.family ^maxLength = 40
* name.given MS
* name.given ^min = 0
* name.given ^short = "English given name, Patient's given name in English"
* name.given ^maxLength = 40
* telecom MS
* gender 1..1 MS
* gender ^short = "Sex"
* birthDate 1.. MS
* birthDate ^short = "Date of Birth, The patient's date of birth"
* birthDate ^maxLength = 10 

 