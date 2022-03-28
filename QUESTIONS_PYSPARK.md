
# SeQura Data Engineering

## PySpark Question

Given a batch process that runs daily, the following logic needs to be implemented in Pyspark code:

We have an aggregate table in the DWH, where monthly credit status snapshots and yesterday's snapshot are stored. 

Every day the current snapshot should be inserted and the previous snapshot deleted except for when the
previous photo was on the last day of the month.

### Data Sample

```
AGG_table
T0:
Id; record_date; **
Xxxxxx; 2021-03-31; **
Yyyyyy; 2021-04-30; **

T1:
Id; record_date; **
Xxxxxx; 2021-03-31; **
Yyyyyy; 2021-04-30; **
Zzzzzz; 2021-05-01; **

T2:
Id; record_date; **
Xxxxxx; 2021-03-31; **
Yyyyyy; 2021-04-30; **
Zzzzzz; 2021-05-02; **
...
T31:
Id; record_date; **
Xxxxxx; 2021-03-31; **
Yyyyyy; 2021-04-30; **
Zzzzzz; 2021-05-31; **
T32:
Id; record_date; **
Xxxxxx; 2021-03-31; **
Yyyyyy; 2021-04-30; **
Zzzzzz; 2021-05-31; **
Aaaaaa; 2021-06-01; **
```

You are asked to write the extraction and loading sentences in pyspark so that the data is stored as previously
explained.

Please elaborate on reasons for your chosen partitioning, file format, etc.

:thumbsup: [Proposed solution for the PySpark question](SOLUTIONS_PYSPARK.md).
