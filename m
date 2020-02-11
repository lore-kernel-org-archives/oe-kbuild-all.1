Content-Type: multipart/mixed; boundary="===============0182223976973593692=="
MIME-Version: 1.0
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page table helpers
Date: Tue, 11 Feb 2020 06:33:47 +0100
Message-ID: <aa540cd6-93a0-1be4-cdff-c9af43ed7d8e@c-s.fr>
In-Reply-To: <82317d50-57a2-ce84-7557-21635d57448e@arm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0182223976973593692==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Le 11/02/2020 =C3=A0 03:25, Anshuman Khandual a =C3=A9crit=C2=A0:
> =

> =

> On 02/10/2020 04:36 PM, Russell King - ARM Linux admin wrote:
>> There are good reasons for the way ARM does stuff.  The generic crap was
>> written without regard for the circumstances that ARM has, and thus is
>> entirely unsuitable for 32-bit ARM.
> =

> Since we dont have an agreement here, lets just settle with disabling the
> test for now on platforms where the build fails. CONFIG_EXPERT is enabling
> this test for better adaptability and coverage, hence how about re framing
> the config like this ? This at the least conveys the fact that EXPERT only
> works when platform is neither IA64 or ARM.

Agreed

> =

> config DEBUG_VM_PGTABLE
> 	bool "Debug arch page table for semantics compliance"
> 	depends on MMU
> 	depends on ARCH_HAS_DEBUG_VM_PGTABLE || (EXPERT &&  !(IA64 || ARM))

I think it's maybe better to have a dedicated depends line:

depends on !IA64 && !ARM
depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT

The day arm and/or ia64 is ready for building the test, we can remove =

that depends.

> 	default n if !ARCH_HAS_DEBUG_VM_PGTABLE
> 	default y if DEBUG_VM
> =


Christophe
--===============0182223976973593692==--

