Content-Type: multipart/mixed; boundary="===============0370350877386474392=="
MIME-Version: 1.0
From: Michael Zaidman <michael.zaidman@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/hid/hid-ft260.c:794:44: warning: format specifies type 'short' but the argument has type 'int'
Date: Thu, 06 May 2021 14:55:46 +0300
Message-ID: <20210506115546.GA1745@michael-VirtualBox>
In-Reply-To: <202105060637.LeEC6ztp-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0370350877386474392==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 06, 2021 at 06:47:46AM +0800, kernel test robot wrote:
> =

>    drivers/hid/hid-ft260.c:515:59: warning: variable 'len' is uninitializ=
ed when used here [-Wuninitialized]
>                    hid_err(hdev, "%s: unsupported wr len: %d\n", __func__=
, len);
>                                                                          =
  ^~~
>    include/linux/hid.h:1190:30: note: expanded from macro 'hid_err'
>            dev_err(&(hid)->dev, fmt, ##__VA_ARGS__)
>                                        ^~~~~~~~~~~
>    include/linux/dev_printk.h:112:32: note: expanded from macro 'dev_err'
>            _dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
>                                          ^~~~~~~~~~~
>    drivers/hid/hid-ft260.c:507:9: note: initialize the variable 'len' to =
silence this warning
>            int len, ret;
>                   ^
>                    =3D 0

This warning has already been found and fixed by Dan Carpenter in
the "HID: ft260: fix an error message in ft260_i2c_write_read()" commit
on March 18, 2021.

--===============0370350877386474392==--

