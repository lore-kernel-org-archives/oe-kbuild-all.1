Content-Type: multipart/mixed; boundary="===============6230807211471276428=="
MIME-Version: 1.0
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Mon, 31 May 2021 17:09:22 +0200
Message-ID: <CAMuHMdVVGVdtzbnZUNTe1qGCb8nq+6jvNNWw8U3_A=KcXmO3mA@mail.gmail.com>
In-Reply-To: <YLT2vB0GwC1sJesL@lunn.ch>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6230807211471276428==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

On Mon, May 31, 2021 at 4:46 PM Andrew Lunn <andrew@lunn.ch> wrote:
> > > No, we should just fix the driver instead.
> > >
> > > +               /* Wait 1000 clocks so we don't saturate the RSL bus
> > > +                * doing reads.
> > > +                */
> > > +               __delay(1000);
> > >
> > > As this is used only on Cavium Octeon and Thunder SoCs, running
> > > at 400-600 MHz resp. 1800-2000 Mhz, what about replacing the __delay()
> > > call by a call to udelay(1) or udelay(2)?
> >
> > Yeah, I was planning to look into that change this week,
> > but it would probably be better for David to do it.
>
> If you look at the bigger picture, using linux/iopoll.h would be a
> better solution.

Sure, but doing that conversion[*] needs even more involvement from
the original author (who has been quiet w.r.t. to this issue ever
since the first time it was reported ca. 18 months ago), or someone
with access to the hardware.

[*] The driver doesn't use plain readq(), but a custom
    oct_mdio_readq().  Hence it cannot be used with readq_*poll*()
   as-is.



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert(a)linux-m6=
8k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
--===============6230807211471276428==--

