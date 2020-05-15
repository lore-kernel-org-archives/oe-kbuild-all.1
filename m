Content-Type: multipart/mixed; boundary="===============2418441723095596324=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Fri, 15 May 2020 17:27:19 +0300
Message-ID: <CAHp75VdUWaEAuStEQZD4yOWcxBT0EkxiX90u1_9vppFb5JniGQ@mail.gmail.com>
In-Reply-To: <CAHp75Ven9q-6dDYtP_uXigeS_r2uvpUZVR5Mh0RdEd36MbTG+Q@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2418441723095596324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2020 at 5:25 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wrote:

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

And perhaps it should use lo_hi_writeq() or something like that.

-- =

With Best Regards,
Andy Shevchenko
--===============2418441723095596324==--

