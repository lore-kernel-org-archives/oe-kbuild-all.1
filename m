Content-Type: multipart/mixed; boundary="===============2295963048305106808=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] um: add 2 missing libs to fix various build errors
Date: Tue, 11 May 2021 18:56:51 -0700
Message-ID: <2a2ddf5b-3d08-1a13-94c8-ae2ca0e6444b@infradead.org>
In-Reply-To: <74a0ba94-9a22-b7a4-3c1b-596ddbaa856e@cambridgegreys.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2295963048305106808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 4/9/21 10:28 PM, Anton Ivanov wrote:
> On 10/04/2021 05:13, Randy Dunlap wrote:
>> On 4/4/21 11:20 AM, Randy Dunlap wrote:


[snip]

>>
>> There are still some build errors in 2 object files:
>>
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x8): undefined reference to `X86_F=
EATURE_XMM2'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x15): undefined reference to `X86_=
FEATURE_XMM2'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x22): undefined reference to `X86_=
FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x2f): undefined reference to `X86_=
FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x3c): undefined reference to `X86_=
FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x49): undefined reference to `X86_=
FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x56): undefined reference to `X86_=
FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: kern=
el/irq/generic-chip.o:(.altinstructions+0x63): more undefined references to=
 `X86_FEATURE_XMM' follow
>>
>> and
>>
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x8): undefined reference to=
 `X86_FEATURE_XMM2'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x15): undefined reference t=
o `X86_FEATURE_XMM2'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x22): undefined reference t=
o `X86_FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x2f): undefined reference t=
o `X86_FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x3c): undefined reference t=
o `X86_FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x49): undefined reference t=
o `X86_FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x56): undefined reference t=
o `X86_FEATURE_XMM'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x63): undefined reference t=
o `X86_FEATURE_XMM2'
>> /usr/lib/gcc/i586-suse-linux/10/../../../../i586-suse-linux/bin/ld: driv=
ers/fpga/altera-pr-ip-core.o:(.altinstructions+0x70): undefined reference t=
o `X86_FEATURE_XMM2'
>>
>> I don't know what to do about these or what is causing them (other than
>> "alternatives").
> =

> I have a patch in the queue which should fix these - it "steals" the bug/=
feature definitions from the x86 tree.
> =

> A

Hi Anton,

Can you post (repost) the patch for these or point me to it
on a mailing list, please?


thanks.
-- =

~Randy

--===============2295963048305106808==--

