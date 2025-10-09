# dell_warranty
CLI + REST API to check Dell hardware warranty information.

```markdown
## Usage

```
Usage:  dell_warranty.sh [-j] [-e] [-p] <service_tag>

        -j  output data is serialized as a JSON object
        -e  only display the warranty expiration date
        -p  include a list of parts associated with the service tag
```

### Example output:

Including parts:
```
$ ./dell_warranty.sh -p <service_tag>
===========================================
 PowerEdge R630
===========================================
 service tag         | <service_tag>
 ship date           | 2016-10-19
-------------------------------------------
 warranty type       | ProSupport
 warranty status     | InWarranty
 warranty expiration | 2020-10-20
-------------------------------------------
 ProSupport Mission Critical
   start date: 2016-10-19
   end   date: 2020-10-20
-------------------------------------------
 4 Hour On-Site Service
   start date: 2019-10-20
   end   date: 2020-10-21
-------------------------------------------
 Parts:
   Part number: ABC123
   Description: Hard Drive
   Quantity: 1
-------------------------------------------
   Part number: DEF456
   Description: RAM Module
   Quantity: 2
-------------------------------------------
```

Without parts:
```
$ ./dell_warranty.sh <service_tag>
===========================================
 PowerEdge R630
===========================================
 service tag         | <service_tag>
 ship date           | 2016-10-19
-------------------------------------------
 warranty type       | ProSupport
 warranty status     | InWarranty
 warranty expiration | 2020-10-20
-------------------------------------------
 ProSupport Mission Critical
   start date: 2016-10-19
   end   date: 2020-10-20
-------------------------------------------
 4 Hour On-Site Service
   start date: 2019-10-20
   end   date: 2020-10-21
-------------------------------------------
```

JSON example output with parts:
```
$ ./dell_warranty.sh -j -p <service_tag>
{
   "product": "PowerEdge R630",
   "svctag": "<service_tag>",
   "ship_date": "2016-10-19",
   "warranty_type": "ProSupport",
   "warranty_status": "InWarranty",
   "warranty_expiration_date": "2020-10-20",
   "support_services": [
      {
         "service": "ProSupport Mission Critical",
         "start_date": "2016-10-19",
         "end_date": "2020-10-20"
      },
      {
         "service": "4 Hour On-Site Service",
         "start_date": "2019-10-20",
         "end_date": "2020-10-21"
      }
   ],
   "parts": [
      {
         "part_number": "ABC123",
         "description": "Hard Drive",
         "quantity": 1
      },
      {
         "part_number": "DEF456",
         "description": "RAM Module",
         "quantity": 2
      }
   ]
}
```
