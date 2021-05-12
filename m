Content-Type: multipart/mixed; boundary="===============6113686891599758561=="
MIME-Version: 1.0
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] um: add 2 missing libs to fix various build errors
Date: Wed, 12 May 2021 08:46:45 +0100
Message-ID: <2f1283d0-64bc-a225-cff3-71893fdf3330@cambridgegreys.com>
In-Reply-To: <2a2ddf5b-3d08-1a13-94c8-ae2ca0e6444b@infradead.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6113686891599758561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 12/05/2021 02:56, Randy Dunlap wrote:
> On 4/9/21 10:28 PM, Anton Ivanov wrote:
>> On 10/04/2021 05:13, Randy Dunlap wrote:
>>> On 4/4/21 11:20 AM, Randy Dunlap wrote:
> =

> =

> [snip]
> =

>>>
>>> There are still some build errors in 2 object files:
>>>
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x8): undefined reference to `X86_=
FEATURE_XMM2'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x15): undefined reference to `X86=
_FEATURE_XMM2'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x22): undefined reference to `X86=
_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x2f): undefined reference to `X86=
_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x3c): undefined reference to `X86=
_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x49): undefined reference to `X86=
_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x56): undefined reference to `X86=
_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: ker=
nel/irq/generic-chip.o:(.altinstructions+0x63): more undefined references t=
o `X86_FEATURE_XMM' follow
>>>
>>> and
>>>
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x8): undefined reference t=
o `X86_FEATURE_XMM2'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x15): undefined reference =
to `X86_FEATURE_XMM2'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x22): undefined reference =
to `X86_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x2f): undefined reference =
to `X86_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x3c): undefined reference =
to `X86_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x49): undefined reference =
to `X86_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x56): undefined reference =
to `X86_FEATURE_XMM'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x63): undefined reference =
to `X86_FEATURE_XMM2'
>>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: dri=
vers/fpga/altera-pr-ip-core.o:(.altinstructions+0x70): undefined reference =
to `X86_FEATURE_XMM2'
>>>
>>> I don't know what to do about these or what is causing them (other than
>>> "alternatives").
>>
>> I have a patch in the queue which should fix these - it "steals" the bug=
/feature definitions from the x86 tree.
>>
>> A
> =

> Hi Anton,
> =

> Can you post (repost) the patch for these or point me to it
> on a mailing list, please?
> =

> =

> thanks.

They are in patchwork:

It is the first patch in these series:

https://patchwork.ozlabs.org/project/linux-um/patch/20210312151609.24745-2-=
anton.ivanov(a)cambridgegreys.com/
https://patchwork.ozlabs.org/project/linux-um/patch/20210312151609.24745-3-=
anton.ivanov(a)cambridgegreys.com/
https://patchwork.ozlabs.org/project/linux-um/patch/20210312151609.24745-4-=
anton.ivanov(a)cambridgegreys.com/

Best Regards,

> =


-- =

Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/
--===============6113686891599758561==--

