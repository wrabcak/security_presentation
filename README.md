# Security presentation
Purpose of this repository is to demonstrate several security technologies on real examples such as audit, aide, fapolicyd and SELinux..

> Warning: Please execute the demo on development system!

## How to
You will need two systems. Server for tang service and client for rest of technologies.

Shell script should download all dependencies to run the demo.

To deploy all technologies and configuration for both server and client run following command:
```bash
./run.sh
```

After ansible plays are done, you should be able to login to client machine and execute the following script:
```bash
./hackme.sh
```

Tested on the latest stable version of Fedora and RHEL-9.
