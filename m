Content-Type: multipart/mixed; boundary="===============3055258528934036755=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: arceb-elf-ld: include/linux/leds.h:193: undefined reference to `devm_led_classdev_register_ext'
Date: Sat, 10 Oct 2020 09:59:06 -0700
Message-ID: <47922c0f-ba68-3c24-50e7-777783901fe2@infradead.org>
In-Reply-To: <61365b1a-5e73-14c9-ab90-4eaaf456eda8@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3055258528934036755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/10/20 12:13 AM, Rong Chen wrote:
> =

> =

> On 10/10/20 11:49 AM, Randy Dunlap wrote:
>> On 10/9/20 8:19 PM, Rong Chen wrote:
>>>
>>> On 10/8/20 3:15 PM, Pavel Machek wrote:
>>>> Hi!
>>>>
>>>>> tree:=C2=A0=C2=A0 https://git.kernel.org/pub/scm/linux/kernel/git/tor=
valds/linux.git master
>>>>> head:=C2=A0=C2=A0 c85fb28b6f999db9928b841f63f1beeb3074eeca
>>>>> commit: 92a81562e695628086acb92f95090ab09d9b9ec0 leds: lp55xx: Add mu=
lticolor framework support to lp55xx
>>>>> date:=C2=A0=C2=A0 3 months ago
>>>>> config: arc-randconfig-r035-20201008 (attached as .config)
>>>>> compiler: arceb-elf-gcc (GCC) 9.3.0
>>>>> reproduce (this is a W=3D1 build):
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wget https://r=
aw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/ma=
ke.cross
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chmod +x ~/bin=
/make.cross
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # https://git.=
kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D92a8156=
2e695628086acb92f95090ab09d9b9ec0
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git remote add=
 linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git fetch --no=
-tags linus master
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git checkout 9=
2a81562e695628086acb92f95090ab09d9b9ec0
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # save the att=
ached .config to linux build tree
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPILER_INSTA=
LL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross ARCH=3Darc
>>>>>
>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Hi robot. Do you have human around to talk to?
>>>>
>>>>> All errors (new ones prefixed by >>):
>>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.o: in function =
`filter_irq_stacks':
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 lib/stackdepot.c:331: undefined reference to=
 `__irqentry_text_start'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:331: undefine=
d reference to `__irqentry_text_start'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.o: in function =
`in_irqentry_text':
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 lib/stackdepot.c:323: undefined reference to=
 `__irqentry_text_end'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:323: undefine=
d reference to `__irqentry_text_end'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:324: undefine=
d reference to `__softirqentry_text_start'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:324: undefine=
d reference to `__softirqentry_text_start'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:325: undefine=
d reference to `__softirqentry_text_end'
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0 arceb-elf-ld: lib/stackdepot.c:325: undefine=
d reference to
>>>> What is going on here? Did you just start testing arc? The commit
>>>> is... really old.
>>>>
>>> Hi Pavel,
>>>
>>> Only this error "arceb-elf-ld: include/linux/leds.h:193: undefined refe=
rence to `devm_led_classdev_register_ext'" was found in this commit,
>>> other errors are for reference only, and the test config is a rand conf=
ig, so it's discovered by chance.
>> Hi,
>> Just for the record, I could not reproduce the build error
>> with the config file that was provided.
>>
> =

> Hi Randy,
> =

> I can reproduce it with the above reproduce steps:
> =

> =E2=9E=9C=C2=A0 linux git:(92a81562e695) =E2=9C=97 make CROSS_COMPILE=3D/=
home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf- ARCH=3Darc
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/checksyscalls.sh
> =C2=A0 CALL=C2=A0=C2=A0=C2=A0 scripts/atomic/check-atomics.sh
> =C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/compile.h
> =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 .version
> =C2=A0 CHK=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/compile.h
> =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/compile.h
> =C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init/version.o
> =C2=A0 AR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 init/built-in.a
> =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmlinux.o
> =C2=A0 MODPOST vmlinux.symvers
> =C2=A0 MODINFO modules.builtin.modinfo
> =C2=A0 GEN=C2=A0=C2=A0=C2=A0=C2=A0 modules.builtin
> =C2=A0 LD=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .tmp_vmlinux.kallsyms1
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: lib/stackdepo=
t.o: in function `filter_irq_stacks':
> /home/nfs/linux/lib/stackdepot.c:331: undefined reference to `__irqentry_=
text_start'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/lib/stackdepot.c:331: undefined reference to `__irqentry_text_start'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: lib/stackdepo=
t.o: in function `in_irqentry_text':
> /home/nfs/linux/lib/stackdepot.c:323: undefined reference to `__irqentry_=
text_end'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/lib/stackdepot.c:323: undefined reference to `__irqentry_text_end'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/lib/stackdepot.c:324: undefined reference to `__softirqentry_text_start'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/lib/stackdepot.c:324: undefined reference to `__softirqentry_text_start'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/lib/stackdepot.c:325: undefined reference to `__softirqentry_text_end'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/lib/stackdepot.c:325: undefined reference to `__softirqentry_text_end'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: drivers/leds/=
leds-lp55xx-common.o: in function `devm_led_classdev_register':
> /home/nfs/linux/./include/linux/leds.h:193: undefined reference to `devm_=
led_classdev_register_ext'
> /home/nfs/0day/gcc-9.3.0-nolibc/arceb-elf/bin/arceb-elf-ld: /home/nfs/lin=
ux/./include/linux/leds.h:193: undefined reference to `devm_led_classdev_re=
gister_ext'
> make: *** [Makefile:1139: vmlinux] Error 1

Oh, I guess I see the difference. The bot is checking out a commit
that is 3 months old:

        git fetch --no-tags linus master
        git checkout 92a81562e695628086acb92f95090ab09d9b9ec0


So it's a bit like Pavel said, that commit is old. I can't say that I care
as long as current mainline builds, and I have already verified that it doe=
s.


cheers.
-- =

~Randy

--===============3055258528934036755==--

