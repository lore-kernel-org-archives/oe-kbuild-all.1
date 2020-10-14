Content-Type: multipart/mixed; boundary="===============1584145058332174419=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] i2c: designware: fix slave omitted IC_INTR_STOP_DET
Date: Wed, 14 Oct 2020 11:52:51 +0300
Message-ID: <20201014085251.GS4077@smile.fi.intel.com>
In-Reply-To: <202010141551.Y4x2qiN1-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1584145058332174419==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2020 at 03:39:51PM +0800, kernel test robot wrote:
> Hi Michael,
> =

> Thank you for the patch! Yet something to improve:

Wondering if you compile this at all...

>    include/asm-generic/io.h:1017:55: warning: performing pointer arithmet=
ic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>            return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
>                                                      ~~~~~~~~~~ ^
> >> drivers/i2c/busses/i2c-designware-slave.c:181:42: error: expected ';' =
after expression
>                            dev->status =3D STATUS_WRITE_IN_PROGRESS
>                                                                  ^
>                                                                  ;
> >> drivers/i2c/busses/i2c-designware-slave.c:195:22: error: use of undecl=
ared identifier 'STATUS_IDEL'
>                    if (dev->status !=3D STATUS_IDEL) {
>                                       ^
>    7 warnings and 2 errors generated.


-- =

With Best Regards,
Andy Shevchenko


--===============1584145058332174419==--

