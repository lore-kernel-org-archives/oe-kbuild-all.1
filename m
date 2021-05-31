Content-Type: multipart/mixed; boundary="===============0198433175065362656=="
MIME-Version: 1.0
From: Andrew Lunn <andrew@lunn.ch>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Mon, 31 May 2021 16:46:20 +0200
Message-ID: <YLT2vB0GwC1sJesL@lunn.ch>
In-Reply-To: <0717b3a5-d838-e1ed-a4ac-80cf14f3a6aa@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0198433175065362656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> > No, we should just fix the driver instead.
> > =

> > +               /* Wait 1000 clocks so we don't saturate the RSL bus
> > +                * doing reads.
> > +                */
> > +               __delay(1000);
> > =

> > As this is used only on Cavium Octeon and Thunder SoCs, running
> > at 400-600 MHz resp. 1800-2000 Mhz, what about replacing the __delay()
> > call by a call to udelay(1) or udelay(2)?
> =

> Yeah, I was planning to look into that change this week,
> but it would probably be better for David to do it.

If you look at the bigger picture, using linux/iopoll.h would be a
better solution.

       Andrew
--===============0198433175065362656==--

