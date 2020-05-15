Content-Type: multipart/mixed; boundary="===============2686202910299942556=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Fri, 15 May 2020 17:25:32 +0300
Message-ID: <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
In-Reply-To: <202005152142.AWvx4xc5%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2686202910299942556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:

> sparse warnings: (new ones prefixed by >>)
>
> >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse: sparse: i=
ncorrect type in argument 1 (different base types) @@    expected unsigned =
int val @@    got restricted __be32 [assignedunsigned int val @@
> >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    expect=
ed unsigned int val
> >> drivers/mtd/nand/raw/intel-nand-controller.c:441:24: sparse:    got re=
stricted __be32 [assigned] [usertype] reg
>    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse: sparse: i=
ncorrect type in argument 1 (different base types) @@    expected unsigned =
int val @@    got restricted __be32 [assignedunsigned int val @@
>    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    expect=
ed unsigned int val
>    drivers/mtd/nand/raw/intel-nand-controller.c:444:24: sparse:    got re=
stricted __be32 [assigned] [usertype] reg
>
>    440                  reg =3D cpu_to_be32(*pdata++);
>  > 441                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_0);
>    442
>    443                  reg =3D cpu_to_be32(*pdata);
>    444                  writel(reg, ebu_host->hsnand + HSNAND_CMSG_1);

On BE:
cpu_to_be32 -> no-op
writel() -> converts reg to LE

On LE:
cpu_to_be32 -> converts to BE
writel() -> no-op (in terms of conversion)

Seems to me that the proper API (if above is intended) should be swab32().
But something tells me that above is broken (or my understanding is wrong).

-- =

With Best Regards,
Andy Shevchenko
--===============2686202910299942556==--

