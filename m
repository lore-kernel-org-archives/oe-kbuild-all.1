Content-Type: multipart/mixed; boundary="===============0362127402207966134=="
MIME-Version: 1.0
From: John David Anglin <dave.anglin@bell.net>
To: kbuild-all@lists.01.org
Subject: Re: hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
Date: Mon, 25 Jan 2021 16:17:50 -0500
Message-ID: <428d571c-1f68-7a59-3232-9bb362b51a5b@bell.net>
In-Reply-To: <3564bcea-5781-123f-564e-53289967e9e4@gmx.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0362127402207966134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-25 4:13 p.m., Helge Deller wrote:
> On 1/25/21 10:08 PM, John David Anglin wrote:
>> I would suggest the following for this hunk:
>>
>> +=C2=A0=C2=A0=C2=A0 ldil=C2=A0=C2=A0=C2=A0 L%intr_restore, %r2
>> +=C2=A0=C2=A0=C2=A0 BL=C2=A0=C2=A0=C2=A0 preempt_schedule_irq
>> +=C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0=C2=A0 R%intr_restore(%r2), %r2
>>
>> =C2=A0=C2=A0=C2=A0 ldil=C2=A0=C2=A0=C2=A0 L%intr_restore, %r1
>> =C2=A0=C2=A0=C2=A0 b,l=C2=A0=C2=A0=C2=A0 preempt_schedule_irq,%r2
>> =C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0=C2=A0 R%intr_restore(%r1), %r2
>>
>> On PA 2.0 hardware that gives a 22-bit call.
> "BL" is already using "b,l", see #define in arch/parisc/include/asm/assem=
bly.h
>
> The 22-bit weren't sufficient, that's why I changed it too.
Okay but "b,l" only provides a 22-bit branch with %r2 as link register.=C2=
=A0 You also need to use %r1 in the ldil and ldo instructions.

Dave

-- =

John David Anglin  dave.anglin(a)bell.net

--===============0362127402207966134==--

