# The eHealth Project

It has been decided to develop an eHealth prescriptions management prototype (that will be part of a bigger system). The prototype will keep track of prescriptions for patients so that dangerous interactions between medications can be controlled and checked.

There exist pairs of medications that when taken together have undesirable interactions. For example, Wafarin and Aspirin both increase anti-coagulation and should not be taken together, unless prescribed by a specialist.

Physicians, patients, medications and prescriptions each have an identifier (ID) and can be added to the database. Physicians are either generalists or specialists. Only specialist can add dangerous interactions. There shall be a query to inquire if there are any dangerous interactions prescribed for patients.

## List of methods

system eHealth
  -- manage prescriptions for physicians and patients

  -- ids for physicians, patients, medications and prescriptions
  -- each with its own sort
  -- 1..
type ID_MD = INT -- physicians
type ID_PT = INT -- patients
type ID_RX = INT -- prescriptions
type ID_MN = INT -- medications

type NAME = STRING
  -- names of physicians, patients and medications

  -- prescription
type KIND = {pill, liquid}
  -- for a pill, it is a positive real in mg
  -- for a liquid it is a positive real in cc
type MEDICATION = TUPLE [name: NAME; kind: KIND; low: VALUE; hi: VALUE]

type PHYSICIAN_TYPE = {generalist, specialist}

-- User Actions
add_physician      (id: ID_MD; name: NAME; kind: PHYSICIAN_TYPE)
add_patient        (id: ID_PT; name: NAME)
add_medication     (id: ID_MN; medicine: MEDICATION)
add_interaction    (id1:ID_MN;id2:ID_MN)

new_prescription   (id: ID_RX; doctor: ID_MD; patient: ID_PT)
add_medicine       (id: ID_RX; medicine:ID_MN; dose: VALUE)
remove_medicine    (id: ID_RX; medicine:ID_MN)

-- On Demand Queries: _q
prescriptions_q(medication_id: ID_MN)
  -- shows list of patient-ids -> patients 
  -- with this medication in a prescription

dpr_q
  -- dangerous prescription report
  -- e.g. There are dangerous prescriptions:
  --(Dora,3)->{ [Sulfamethizole,pl,2]->[Wafarin,pl,1] }


## List of Errors

----Status Messages for eHealth v1.4---------------------------------
-- The order of error checking on the arguments of input commands 
-- decreases from high precedence at the top to low at the bottom. 
-- Only the first error, in precedence order, is reported 
-- to the user at the output. If the above errors are not present, 
-- then the status message displays as "ok".
-- Please comment at the forum if any error messages are omitted.
--------------------------------------------------------------------

add_physician  (id: ID_MD; name: NAME; kind: PHYSICIAN_TYPE)
    physician id must be a positive integer
    physician id already in use
    name must start with a letter

add_patient  (id: ID_PT; name: NAME)
    patient id must be a positive integer
    patient id already in use
    name must start with a letter

MEDICATION = TUPLE [name: NAME; kind: KIND; low: VALUE; hi: VALUE]        
add_medication  (id: ID_MN; medicine: MEDICATION)
    medication id must be a positive integer
    medication id already in use
    medication name must start with a letter
    medication name already in use
    require 0 < low-dose <= hi-dose

add_interaction (id1:ID_MN;id2:ID_MN)
    medication ids must be positive integers
    medication ids must be different
    medications with these ids must be registered
    interaction already exists
    first remove conflicting medicine prescribed by generalist

new_prescription (id: ID_RX; doctor: ID_MD; patient: ID_PT)
    prescription id must be a positive integer
    prescription id already in use
    physician id must be a positive integer
    physician with this id not registered
    patient id must be a positive integer
    patient with this id not registered
    prescription already exists for this physician and patient

add_medicine (id: ID_RX; medicine:ID_MN; dose: VALUE)
    prescription id must be a positive integer
    prescription with this id does not exist
    medication id must be a positive integer
    medication id must be registered
    medication is already prescribed
    specialist is required to add a dangerous interaction
    dose is outside allowed range

remove_medicine  (id: ID_RX; medicine:ID_MN)
    prescription id must be a positive integer
    prescription with this id does not exist
    medication id must be a positive integer
    medication id must be registered
    medication is not in the prescription

prescriptions_q  (medication_id: ID_MN)
    medication id must be a positive integer
    medication id must be registered

dpr_q
    -- does not have error conditions
    -- but does return a warnings
    -- either "There are dangerous prescriptions:"
    -- or "There are no dangerous prescriptions"
    -- see at1.expected.txt
