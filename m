Content-Type: multipart/mixed; boundary="===============3238676128192487157=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 11713/12912] drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type in initializer (different address spaces)
Date: Thu, 28 May 2020 15:17:25 +0200
Message-ID: <CAMuHMdUx3BiXSfyWhkp5oox8pav8VQrPY=sFCF6sC7AncU7S=w@mail.gmail.com>
In-Reply-To: <202005282050.C2IW7VDT%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3238676128192487157==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 2:54 PM kbuild test robot <lkp@intel.com> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   b0523c7b1c9d0edcd6c0fe6d2cb558a9ad5c60a8
> commit: 2941a4731fd24d5e43ef437cca90818f87fd4851 [11713/12912] m68k: Add =
missing __user annotation in get_user()
> config: m68k-randconfig-s032-20200528 (attached as .config)
> compiler: m68k-linux-gcc (GCC) 9.3.0
> reproduce:
>         # apt-get install sparse
>         # sparse version: v0.6.1-240-gf0fe1cd9-dirty
>         git checkout 2941a4731fd24d5e43ef437cca90818f87fd4851
>         # save the attached .config to linux build tree
>         make W=3D1 C=3D1 ARCH=3Dm68k CF=3D'-fdiagnostic-prefix -D__CHECK_=
ENDIAN__'
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
>
> sparse warnings: (new ones prefixed by >>)
>
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] <asn:1> * @@     got char *buf @@
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected void const=
 volatile [noderef] <asn:1> *
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse: sparse: incorrect type =
in initializer (different address spaces) @@     expected void const [noder=
ef] <asn:1> *__pu_ptr @@     got char *buf @@
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     expected void const=
 [noderef] <asn:1> *__pu_ptr
>    drivers/w1/slaves/w1_ds28e04.c:342:13: sparse:     got char *buf
>    drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type =
in argument 1 (different address spaces) @@     expected void const volatil=
e [noderef] <asn:1> * @@     got char const *buf @@
>    drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected void const=
 volatile [noderef] <asn:1> *
>    drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf
> >> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse: sparse: incorrect type =
in initializer (different address spaces) @@     expected void const [noder=
ef] <asn:1> *__gu_ptr @@     got char const *buf @@
> >> drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     expected void const=
 [noderef] <asn:1> *__gu_ptr
>    drivers/w1/slaves/w1_ds28e04.c:356:13: sparse:     got char const *buf
>
> vim +356 drivers/w1/slaves/w1_ds28e04.c
>
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  347
> fa33a65a9cf7e2 Greg Kroah-Hartman 2013-08-21  348  static ssize_t crcchec=
k_store(struct device *dev, struct device_attribute *attr,
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  349                        =
     const char *buf, size_t count)

"buf" is not a __user pointer (and it shouldn't be).

> fbf7f7b4e2ae40 Markus Franke      2012-05-26  350  {
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  351       char val;
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  352
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  353       if (count !=3D 1 =
|| !buf)
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  354               return -E=
INVAL;
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  355
> fbf7f7b4e2ae40 Markus Franke      2012-05-26 @356       if (get_user(val,=
 buf))

Hence this causes a warning rightfully.
This should just use "val =3D *buf;".

> fbf7f7b4e2ae40 Markus Franke      2012-05-26  357               return -E=
FAULT;
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  358
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  359       /* convert to dec=
imal */
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  360       val =3D val - 0x3=
0;
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  361       if (val !=3D 0 &&=
 val !=3D 1)
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  362               return -E=
INVAL;
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  363
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  364       /* set the new va=
lue */
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  365       w1_enable_crcchec=
k =3D val;
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  366
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  367       return sizeof(w1_=
enable_crccheck);
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  368  }
> fbf7f7b4e2ae40 Markus Franke      2012-05-26  369

Gr{oetje,eeting}s,

                        Geert

-- =

Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============3238676128192487157==--

