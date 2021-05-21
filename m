Content-Type: multipart/mixed; boundary="===============8737261253057011180=="
MIME-Version: 1.0
From: Lee Jones <lee.jones@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [android-goldfish:android-3.18 396/1051] block/blk-throttle.c:956:9-10: WARNING: return of 0/1 in function 'tg_may_dispatch' with return type bool
Date: Fri, 21 May 2021 07:52:11 +0100
Message-ID: <20210521065211.GN2549456@dell>
In-Reply-To: <202105210256.1Q2XDf1M-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8737261253057011180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 21 May 2021, kernel test robot wrote:

> Hi Lee,
> =

> First bad commit (maybe !=3D root cause):
> =

> tree:   https://android.googlesource.com/kernel/goldfish android-3.18

Please ...

a) I'm pretty sure I've asked for this kernel not to be tested.
b) Why have you sent me an 83 strong patch-set for a 7 year-old kernel?

Please could you make the necessary changes.

> head:   dd54b61f1458c03f68fc019b4874d98f2f0ae3a5
> commit: 8214bf079208b146e63cd0a3ce0ed335a87ce7b3 [396/1051] scripts/dtc: =
Export YYLOC global declaration
> config: arc-randconfig-c023-20210520 (attached as .config)
> compiler: arceb-elf-gcc (GCC) 9.3.0
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> =

> cocci warnings: (new ones prefixed by >>)
> >> block/blk-throttle.c:956:9-10: WARNING: return of 0/1 in function 'tg_=
may_dispatch' with return type bool
> >> block/blk-throttle.c:911:8-9: WARNING: return of 0/1 in function 'tg_w=
ith_in_bps_limit' with return type bool
> >> block/blk-throttle.c:869:8-9: WARNING: return of 0/1 in function 'tg_w=
ith_in_iops_limit' with return type bool
> >> block/blk-throttle.c:760:8-9: WARNING: return of 0/1 in function 'thro=
tl_slice_used' with return type bool



-- =

Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
Senior Technical Lead - Developer Services
Linaro.org =E2=94=82 Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
--===============8737261253057011180==--

