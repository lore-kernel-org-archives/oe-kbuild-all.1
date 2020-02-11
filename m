Content-Type: multipart/mixed; boundary="===============5528528642435494683=="
MIME-Version: 1.0
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page table helpers
Date: Tue, 11 Feb 2020 09:24:48 +0000
Message-ID: <20200211092448.GI25745@shell.armlinux.org.uk>
In-Reply-To: <aa540cd6-93a0-1be4-cdff-c9af43ed7d8e@c-s.fr>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5528528642435494683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2020 at 06:33:47AM +0100, Christophe Leroy wrote:
> =

> =

> Le 11/02/2020 =C3=A0 03:25, Anshuman Khandual a =C3=A9crit=C2=A0:
> > =

> > =

> > On 02/10/2020 04:36 PM, Russell King - ARM Linux admin wrote:
> > > There are good reasons for the way ARM does stuff.  The generic crap =
was
> > > written without regard for the circumstances that ARM has, and thus is
> > > entirely unsuitable for 32-bit ARM.
> > =

> > Since we dont have an agreement here, lets just settle with disabling t=
he
> > test for now on platforms where the build fails. CONFIG_EXPERT is enabl=
ing
> > this test for better adaptability and coverage, hence how about re fram=
ing
> > the config like this ? This at the least conveys the fact that EXPERT o=
nly
> > works when platform is neither IA64 or ARM.
> =

> Agreed
> =

> > =

> > config DEBUG_VM_PGTABLE
> > 	bool "Debug arch page table for semantics compliance"
> > 	depends on MMU
> > 	depends on ARCH_HAS_DEBUG_VM_PGTABLE || (EXPERT &&  !(IA64 || ARM))
> =

> I think it's maybe better to have a dedicated depends line:
> =

> depends on !IA64 && !ARM
> depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
> =

> The day arm and/or ia64 is ready for building the test, we can remove that
> depends.

Never going to happen as its technically infeasible, sorry.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps =
up
According to speedtest.net: 11.9Mbps down 500kbps up
--===============5528528642435494683==--

