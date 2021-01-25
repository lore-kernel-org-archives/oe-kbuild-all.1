Content-Type: multipart/mixed; boundary="===============7424789328895535000=="
MIME-Version: 1.0
From: Helge Deller <deller@gmx.de>
To: kbuild-all@lists.01.org
Subject: Re: hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
Date: Mon, 25 Jan 2021 22:13:20 +0100
Message-ID: <3564bcea-5781-123f-564e-53289967e9e4@gmx.de>
In-Reply-To: <627d4b69-79cf-371b-9aa7-d87f26e4f088@bell.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7424789328895535000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/25/21 10:08 PM, John David Anglin wrote:
> I would suggest the following for this hunk:
>
> +=C2=A0=C2=A0=C2=A0 ldil=C2=A0=C2=A0=C2=A0 L%intr_restore, %r2
> +=C2=A0=C2=A0=C2=A0 BL=C2=A0=C2=A0=C2=A0 preempt_schedule_irq
> +=C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0=C2=A0 R%intr_restore(%r2), %r2
>
> =C2=A0=C2=A0=C2=A0 ldil=C2=A0=C2=A0=C2=A0 L%intr_restore, %r1
> =C2=A0=C2=A0=C2=A0 b,l=C2=A0=C2=A0=C2=A0 preempt_schedule_irq,%r2
> =C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0=C2=A0 R%intr_restore(%r1), %r2
>
> On PA 2.0 hardware that gives a 22-bit call.

"BL" is already using "b,l", see #define in arch/parisc/include/asm/assembl=
y.h

The 22-bit weren't sufficient, that's why I changed it too.

Helge
--===============7424789328895535000==--

