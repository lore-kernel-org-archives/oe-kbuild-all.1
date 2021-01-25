Content-Type: multipart/mixed; boundary="===============3064157657939132939=="
MIME-Version: 1.0
From: Helge Deller <deller@gmx.de>
To: kbuild-all@lists.01.org
Subject: Re: hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
Date: Mon, 25 Jan 2021 22:37:42 +0100
Message-ID: <2d1df226-275a-26f5-2f32-d2c3e591dbc6@gmx.de>
In-Reply-To: <428d571c-1f68-7a59-3232-9bb362b51a5b@bell.net>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3064157657939132939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/25/21 10:17 PM, John David Anglin wrote:
> On 2021-01-25 4:13 p.m., Helge Deller wrote:
>> On 1/25/21 10:08 PM, John David Anglin wrote:
>>> I would suggest the following for this hunk:
>>>
>>> +=C2=A0=C2=A0=C2=A0 ldil=C2=A0=C2=A0=C2=A0 L%intr_restore, %r2
>>> +=C2=A0=C2=A0=C2=A0 BL=C2=A0=C2=A0=C2=A0 preempt_schedule_irq
>>> +=C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0=C2=A0 R%intr_restore(%r2), %r2
>>>
>>> =C2=A0=C2=A0=C2=A0 ldil=C2=A0=C2=A0=C2=A0 L%intr_restore, %r1
>>> =C2=A0=C2=A0=C2=A0 b,l=C2=A0=C2=A0=C2=A0 preempt_schedule_irq,%r2
>>> =C2=A0=C2=A0=C2=A0 ldo=C2=A0=C2=A0=C2=A0=C2=A0 R%intr_restore(%r1), %r2
>>>
>>> On PA 2.0 hardware that gives a 22-bit call.
>> "BL" is already using "b,l", see #define in arch/parisc/include/asm/asse=
mbly.h
>>
>> The 22-bit weren't sufficient, that's why I changed it too.
> Okay but "b,l" only provides a 22-bit branch with %r2 as link register.=
=C2=A0

Argh. Yes. Didn't know.
We have BL,%r25 in the same file.

> You also need to use %r1 in the ldil and ldo instructions.

Ok, will fix.

Helge
--===============3064157657939132939==--

