Content-Type: multipart/mixed; boundary="===============3448137027316602155=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Mon, 18 May 2020 13:57:13 +0200
Message-ID: <CAK8P3a25GbMwbtvkxgmuGss6nEfAW4_vVbOXPxOYuDOaU_zcjA@mail.gmail.com>
In-Reply-To: <CAHp75Ve_XjvvGBEQyhy=qVVJMFS+18j3aKxNxSQpGK5qJmzfBg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3448137027316602155==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 1:43 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, May 18, 2020 at 2:39 PM Ramuthevar, Vadivel MuruganX
> <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> > > On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> > > <andy.shevchenko@gmail.com> wrote:
> > >> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> =
wrote:
>
> > > iowrite_be32() is the correct way to store word into a big-endian mmi=
o register,
> > > if that is the intention here.
> > Thank you for suggestions to use iowrite32be(), it suits exactly.
>
> Can you before doing this comment what is the real intention here?
>
> And note, if you are going to use iowrite*() / ioread*() in one place,
> you will probably need to replace all of the read*() / write*() to
> respective io* API.

The way that ioread/iowrite are defined, they are required to be a superset
of what readl/writel do and can take __iomem pointers from either
ioremap() or ioport_map()/pci_iomap() style mappings, while readl/writel
are only required to work with ioremap().

There is no technical requirement to stick to one set or the other for
ioremap(), but the overhead of ioread/iowrite is also small enough
that it generally does not hurt.

       Arnd
--===============3448137027316602155==--

