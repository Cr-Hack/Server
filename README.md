# Server

This is the server integration of the sollution made by Cr'Hack.
It uses a Docker container to run.

Informations
========

Images:
-------

CrHackServer
> Our own image with the full REST Api done with Express.
> The API will start on the port 5000 of the host machine.
> A docker volume is associated with this image to store all the encrypted files permanently.

MYSQL
> Official image of MYSQL that will store all of the user and file data.
> A docker volume is associated with this image to keep all the database permanently.

Routes:
-------

Authentification routes:
* POST /auth/register

Values:
```
> first_name
> last_name
> email
> hashpassword
> privatekey
> publickey
> iv
> salt
```
Response:
```
> 200 message
or
> 400/500 error
```

* POST /auth/login

Values:
```
> email
> hashpassword
```
Response:
```
> token
> first_name
> last_name
> email
> privatekey
> publickey
> iv
> salt
or
> 400/500 error
```

File routes:

!! Need authentification !!

For authentification in the header add:
```
> token (jwt token given by the /auth/login route valid 24h)
```

* POST /file/view

Response:
```
> 200 files : [fileID, name, type, size, datedeposite, sender, other]
or
> 400/500 error
```

* POST /file/delete

Values:
```
> fileID
```
Response:
```
> 200 message
or
> 400/500 error
```

* POST file/upload

Values:
```
> blob
--
> receiverID
> body.name
> body.type
> body.size
> body.partNumber
> body.totalParts
> body.receiverkey
> body.senderkey
> body.receiverIV
> body.senderIV
> body.fileID // Optionnal
```
Response:
```
> 200 fileID
or
> 400/500 error
```

* POST /file/download

Values:
```
> fileID
> partNumber
```
Response:
```
> fileID
> name
> type
> size
> datedeposite
> sender
> other
> aeskey
> iv
or
> 400/500 error
```

Users routes:

* POST /users/publickey

Values:
```
> userID
```
Response:
```
> 200 publickey
or
> 400/500 error
```

* POST /users/getid

Values:
```
> email
```
Response:
```
> 200 userID
or
> 400/500 error
```

Building And Running
========
Please follow the instruction to run it properly.

Requirements:
-------

To build and run the server, you should install `docker` and `docker-compose`.

Linux:
-------

```sh
   sh build_and_run.sh
```

Windows:
---------

* From the interface:

run the file named `build_and_run.bat` in the root folder.

* From the CMD

```bash
    build_and_run.bat
```
