# fpvd {#fpvdmd}
@brief @ref mob server

**fpvd** is a server part of the FPV/IP software bundle runs on every @ref mob.

```
$ ./fpvd <mob-IP> <PORT>
```

* `mob-IP`  <br>@ref mob bind address, default is `127.0.0.1` to use via SSH port forwarding and local debug
            <br>can be redefined to the mob IP address in wifi intranet or `0.0.0.0` to bind on every available network interface
* `PORT`    <br>default is 12345
