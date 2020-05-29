Content-Type: multipart/mixed; boundary="===============7274446251199976748=="
MIME-Version: 1.0
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v7 1/4] bitops: Introduce the the for_each_set_clump macro
Date: Fri, 29 May 2020 21:38:24 +0300
Message-ID: <20200529183824.GW1634618@smile.fi.intel.com>
In-Reply-To: <CACG_h5oOsThkSfdN_adWHxHfAWfg=W72o5RM6JwHGVT=Zq9MiQ@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7274446251199976748==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 29, 2020 at 11:38:18PM +0530, Syed Nayyar Waris wrote:
> On Sun, May 24, 2020 at 8:15 PM kbuild test robot <lkp@intel.com> wrote:

...

> >    579  static inline unsigned long bitmap_get_value(const unsigned lon=
g *map,
> >    580                                                unsigned long sta=
rt,
> >    581                                                unsigned long nbi=
ts)
> >    582  {
> >    583          const size_t index =3D BIT_WORD(start);
> >    584          const unsigned long offset =3D start % BITS_PER_LONG;
> >    585          const unsigned long ceiling =3D roundup(start + 1, BITS=
_PER_LONG);
> >    586          const unsigned long space =3D ceiling - start;
> >    587          unsigned long value_low, value_high;
> >    588
> >    589          if (space >=3D nbits)
> >  > 590                  return (map[index] >> offset) & GENMASK(nbits -=
 1, 0);
> >    591          else {
> >    592                  value_low =3D map[index] & BITMAP_FIRST_WORD_MA=
SK(start);
> >    593                  value_high =3D map[index + 1] & BITMAP_LAST_WOR=
D_MASK(start + nbits);
> >    594                  return (value_low >> offset) | (value_high << s=
pace);
> >    595          }
> >    596  }

> Regarding the above compilation warnings. All the warnings are because
> of GENMASK usage in my patch.
> The warnings are coming because of sanity checks present for 'GENMASK'
> macro in include/linux/bits.h.
> =

> Taking the example statement (in my patch) where compilation warning
> is getting reported:
> return (map[index] >> offset) & GENMASK(nbits - 1, 0);
> =

> 'nbits' is of type 'unsigned long'.
> In above, the sanity check is comparing '0' with unsigned value. And
> unsigned value can't be less than '0' ever, hence the warning.
> But this warning will occur whenever there will be '0' as one of the
> 'argument' and an unsigned variable as another 'argument' for GENMASK.
> =

> This warning is getting cleared if I cast the 'nbits' to 'long'.
> =

> Let me know if I should submit a next patch with the casts applied.
> What do you guys think?

Proper fix is to fix GENMASK(), but allowed workaround is to use
	(BIT(nbits) - 1)
instead.

-- =

With Best Regards,
Andy Shevchenko


--===============7274446251199976748==--

