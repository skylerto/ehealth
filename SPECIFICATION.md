# The eHealth Project

It has been decided to develop an eHealth prescriptions management prototype (that will be part of a bigger system). The prototype will keep track of prescriptions for patients so that dangerous interactions between medications can be controlled and checked.

There exist pairs of medications that when taken together have undesirable interactions. For example, Wafarin and Aspirin both increase anti-coagulation and should not be taken together, unless prescribed by a specialist.

Physicians, patients, medications and prescriptions each have an identifier (ID) and can be added to the database. Physicians are either generalists or specialists. Only specialist can add dangerous interactions. There shall be a query to inquire if there are any dangerous interactions prescribed for patients.
