Content-Type: multipart/mixed; boundary="===============6454434989471499016=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Fri, 15 May 2020 16:30:24 +0200
Message-ID: <CAK8P3a3RKJo-C5=19oAppx212s7T8NdnKJVmkj+h=34a8aKMNA@mail.gmail.com>
In-Reply-To: <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6454434989471499016==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:
>
> > sparse warnings: (new ones prefixed by >>)
> >
> > >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@    expected unsigne=
d int val @@    got restricted __be32 [assignedunsigned int val @@
> > >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expe=
cted unsigned int val
> > >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got =
restricted __be32 [assigned] [usertype] reg
> >    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse:=
 incorrect type in argument 1 (different base types) @@    expected unsigne=
d int val @@    got restricted __be32 [assignedunsigned int val @@
> >    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    expe=
cted unsigned int val
> >    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got =
restricted __be32 [assigned] [usertype] reg
> >
> >    440                  reg =3D cpu_to_be32(*pdata++);
> >  > 441                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
> >    442
> >    443                  reg =3D cpu_to_be32(*pdata);
> >    444                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);
>
> On BE:
> cpu_to_be32 -> no-op
> writel() -> converts reg to LE
>
> On LE:
> cpu_to_be32 -> converts to BE
> writel() -> no-op (in terms of conversion)
>
> Seems to me that the proper API (if above is intended) should be swab32().
> But something tells me that above is broken (or my understanding is wrong=
).

iowrite_be32() is the correct way to store word into a big-endian mmio regi=
ster,
if that is the intention here.

      Arnd
--===============6454434989471499016==--

