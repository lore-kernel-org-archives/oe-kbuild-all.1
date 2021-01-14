Content-Type: multipart/mixed; boundary="===============5698865617676373000=="
MIME-Version: 1.0
From: Borislav Petkov <bp@alien8.de>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 08/15] x86: add new features for paravirt patching
Date: Thu, 14 Jan 2021 19:40:21 +0100
Message-ID: <20210114184021.GG12284@zn.tnic>
In-Reply-To: <20210114183024.GF12284@zn.tnic>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5698865617676373000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 07:30:24PM +0100, Borislav Petkov wrote:
> On Thu, Dec 17, 2020 at 09:12:57PM +0800, kernel test robot wrote:
> >    ld: arch/x86/kernel/alternative.o: in function `paravirt_set_cap':
> > >> arch/x86/kernel/alternative.c:605: undefined reference to `pv_is_nat=
ive_spin_unlock'
> > >> ld: arch/x86/kernel/alternative.c:608: undefined reference to `pv_is=
_native_vcpu_is_preempted'
> =

> Looks like alternative.c needs #include <asm/paravirt.h>.

Nah, that needs paravirt_set_cap() to be inside
CONFIG_PARAVIRT_SPINLOCKS-enabled ifdeffery.

J=C3=BCrgen, why don't you move it to arch/x86/kernel/paravirt.c? That
should keep the ifdeffery low.

Thx.

-- =

Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
--===============5698865617676373000==--

