Content-Type: multipart/mixed; boundary="===============8143247145588216854=="
MIME-Version: 1.0
From: John Stultz <john.stultz@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 7/7] dma-buf: system_heap: Add a system-uncached heap re-using the system heap
Date: Wed, 07 Oct 2020 22:38:03 -0700
Message-ID: <CALAqxLVdjxYB-7hNRoxAMu+qbiQ+qEfo0VMSvRNV391=ffZQwQ@mail.gmail.com>
In-Reply-To: <20201007074352.GP4282@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8143247145588216854==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2020 at 12:44 AM Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>
> Hi John,
>
> url:    https://github.com/0day-ci/linux/commits/John-Stultz/dma-buf-Perf=
ormance-improvements-for-system-heap-a-system-uncached-implementation/20201=
003-120520
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t bcf876870b95592b52519ed4aafcf9d95999bc9c
> config: i386-randconfig-m021-20201002 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/dma-buf/heaps/system_heap.c:496 system_heap_create() warn: passin=
g zero to 'PTR_ERR'
>
> vim +/PTR_ERR +496 drivers/dma-buf/heaps/system_heap.c
>
> efa04fefebbd724 John Stultz     2019-12-03  478  static int system_heap_c=
reate(void)
> efa04fefebbd724 John Stultz     2019-12-03  479  {
> efa04fefebbd724 John Stultz     2019-12-03  480         struct dma_heap_e=
xport_info exp_info;
> efa04fefebbd724 John Stultz     2019-12-03  481
> 263e38f82cbb35b Andrew F. Davis 2019-12-16  482         exp_info.name =3D=
 "system";
> efa04fefebbd724 John Stultz     2019-12-03  483         exp_info.ops =3D =
&system_heap_ops;
> efa04fefebbd724 John Stultz     2019-12-03  484         exp_info.priv =3D=
 NULL;
> efa04fefebbd724 John Stultz     2019-12-03  485
> efa04fefebbd724 John Stultz     2019-12-03  486         sys_heap =3D dma_=
heap_add(&exp_info);
> efa04fefebbd724 John Stultz     2019-12-03  487         if (IS_ERR(sys_he=
ap))
> a2e10cdd2e4d12a John Stultz     2020-10-03  488                 return PT=
R_ERR(sys_heap);
> efa04fefebbd724 John Stultz     2019-12-03  489
> 553f4e0fafc5b3b John Stultz     2020-10-03  490         exp_info.name =3D=
 "system-uncached";
> 553f4e0fafc5b3b John Stultz     2020-10-03  491         exp_info.ops =3D =
&system_uncached_heap_ops;
> 553f4e0fafc5b3b John Stultz     2020-10-03  492         exp_info.priv =3D=
 NULL;
> 553f4e0fafc5b3b John Stultz     2020-10-03  493
> 553f4e0fafc5b3b John Stultz     2020-10-03  494         sys_uncached_heap=
 =3D dma_heap_add(&exp_info);
> 553f4e0fafc5b3b John Stultz     2020-10-03  495         if (IS_ERR(sys_un=
cached_heap))
> 553f4e0fafc5b3b John Stultz     2020-10-03 @496                 return PT=
R_ERR(sys_heap);
>                                                                        ^^=
^^^^^^^^^^^^^^^
> This should be return PTR_ERR(sys_uncached_heap);

Oh nice! Very impressed that the tool caught that!
Thanks so much for the report! I'll fix it up here shortly.
-john
--===============8143247145588216854==--

