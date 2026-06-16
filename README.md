[update-readmes]   Mode: rewrite — migrating to template structure...
# dell_warranty

[![Built with Ona](https://ona.com/build-with-ona.svg)](https://app.ona.com/#https://github.com/Interested-Deving-1896/dell_warranty)

<!-- AI:start:what-it-does -->
_Description pending._
<!-- AI:end:what-it-does -->

## Architecture

<!-- AI:start:architecture -->
_Architecture documentation pending._
<!-- AI:end:architecture -->

## Install

<!-- Add installation instructions here. This section is yours — the AI will not modify it. -->

```bash
git clone https://github.com/Interested-Deving-1896/dell_warranty.git
cd dell_warranty
```

## Usage


```
Usage:  dell_warranty.sh [-j] [-e] <service_tag>

        -j  output data is serialized as a JSON object
        -e  only display the warranty expiration date
```

Example output:

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

JSON output:
```
$ ./dell_warranty -j <service_tag>
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
   ]
}
```


### REST API


To start the API server, you can either:

* use [`shell2http`](https://github.com/msoap/shell2http) directly, and run:
  ```
  $ shell2http -form /check './dell_warranty.sh -j $v_svctag'
  2020/07/14 09:36:36 register: /check (./dell_warranty.sh -j $v_svctag)
  2020/07/14 09:36:36 register: / (index page)
  2020/07/14 09:36:36 listen http://:8080/
  ```
* or use Docker:
  ```
  $ docker build -t dell_warranty_api .
  $ docker run -t dell_warranty_api
  2020/07/14 18:43:40 register: /check (/app/dell_warranty.sh -j $v_svctag)
  2020/07/14 18:43:40 listen http://localhost:8080/
  ```

* or directly deploy to [Railway](railway.app):

  [![Deploy on Railway](https://railway.app/button.svg)](https://railway.app/template/23biGs?referralCode=KL3ssj)


And then, you can query the API server with:
  ```
  $ curl http://localhost:8080/check?svctag=<servicetag>
  {
     "product": "PowerEdge R630",
     "svctag": "<servicetag>",
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
     ]
  }
```

## Configuration

<!-- Document configuration options here. This section is yours — the AI will not modify it. -->

## CI

<!-- AI:start:ci -->
_CI documentation pending._
<!-- AI:end:ci -->

## Mirror chain

<!-- AI:start:mirror-chain -->
This repo is maintained in [`Interested-Deving-1896/dell_warranty`](https://github.com/Interested-Deving-1896/dell_warranty) and mirrored through:

```
Interested-Deving-1896/dell_warranty  ──►  OpenOS-Project-OSP/dell_warranty  ──►  OpenOS-Project-Ecosystem-OOC/dell_warranty
```

Changes flow downstream automatically via the hourly mirror chain in
[`fork-sync-all`](https://github.com/Interested-Deving-1896/fork-sync-all).
Direct commits to OSP or OOC are detected and opened as PRs back to `Interested-Deving-1896`.
<!-- AI:end:mirror-chain -->

## Contributors

<!-- AI:start:contributors -->
_Contributors pending._
<!-- AI:end:contributors -->

## Origins

<!-- AI:start:origins -->
_Original project — no upstream fork._
<!-- AI:end:origins -->

## Resources

<!-- AI:start:resources -->
_No additional resource files found._
<!-- AI:end:resources -->

## License

<!-- AI:start:license -->
[GPL-3.0](https://github.com/Interested-Deving-1896/dell_warranty/blob/main/LICENSE) © 2026 [Interested-Deving-1896](https://github.com/Interested-Deving-1896)
<!-- AI:end:license -->
