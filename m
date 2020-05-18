Content-Type: multipart/mixed; boundary="===============5408762768782148112=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Mon, 18 May 2020 16:20:10 +0300
Message-ID: <CAHp75VfFsdjAT0P4m3O=VQ1e_L7cVyQx6HB7MCN+G_XcFisqZQ@mail.gmail.com>
In-Reply-To: <CAK8P3a25GbMwbtvkxgmuGss6nEfAW4_vVbOXPxOYuDOaU_zcjA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5408762768782148112==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 2:57 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, May 18, 2020 at 1:43 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, May 18, 2020 at 2:39 PM Ramuthevar, Vadivel MuruganX
> > <vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> > > On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> > > > On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > >> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com=
> wrote:
> >
> > > > iowrite_be32() is the correct way to store word into a big-endian m=
mio register,
> > > > if that is the intention here.
> > > Thank you for suggestions to use iowrite32be(), it suits exactly.
> >
> > Can you before doing this comment what is the real intention here?
> >
> > And note, if you are going to use iowrite*() / ioread*() in one place,
> > you will probably need to replace all of the read*() / write*() to
> > respective io* API.
>
> The way that ioread/iowrite are defined, they are required to be a supers=
et
> of what readl/writel do and can take __iomem pointers from either
> ioremap() or ioport_map()/pci_iomap() style mappings, while readl/writel
> are only required to work with ioremap().
>
> There is no technical requirement to stick to one set or the other for
> ioremap(), but the overhead of ioread/iowrite is also small enough
> that it generally does not hurt.

Right, my suggestion is solely for consistency. It would be a bit
weird to see readl() along with ioread32() in the same driver (in case
there are no differentiated callbacks specifically for different type
of IP).

-- =

With Best Regards,
Andy Shevchenko
--===============5408762768782148112==--

