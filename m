Content-Type: multipart/mixed; boundary="===============0706233248164259498=="
MIME-Version: 1.0
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 2/2] mtd: rawnand: Add NAND controller support on Intel LGM SoC
Date: Mon, 18 May 2020 14:43:42 +0300
Message-ID: <CAHp75Ve_XjvvGBEQyhy=qVVJMFS+18j3aKxNxSQpGK5qJmzfBg@mail.gmail.com>
In-Reply-To: <5180e734-ff56-db5a-ab49-8a55cfa2f2c0@linux.intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0706233248164259498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2020 at 2:39 PM Ramuthevar, Vadivel MuruganX
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:
> On 15/5/2020 10:30 pm, Arnd Bergmann wrote:
> > On Fri, May 15, 2020 at 4:25 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> >> On Fri, May 15, 2020 at 4:48 PM kbuild test robot <lkp@intel.com> wr=
ote:

> > iowrite_be32() is the correct way to store word into a big-endian mmio =
register,
> > if that is the intention here.
> Thank you for suggestions to use iowrite32be(), it suits exactly.

Can you before doing this comment what is the real intention here?

And note, if you are going to use iowrite*() / ioread*() in one place,
you will probably need to replace all of the read*() / write*() to
respective io* API.

-- =

With Best Regards,
Andy Shevchenko
--===============0706233248164259498==--

