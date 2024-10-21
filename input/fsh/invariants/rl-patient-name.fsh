Invariant: rl-patient-name
Description: "Patient.name.text or Patient.name.family or both SHALL be present"
* severity = #error
* expression = "text.exists() or family.exists()"
* xpath = "f:text or f:given"