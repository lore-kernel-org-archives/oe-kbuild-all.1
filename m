Content-Type: multipart/mixed; boundary="===============2785109573295780740=="
MIME-Version: 1.0
From: Randy Dunlap <rdunlap@infradead.org>
To: kbuild-all@lists.01.org
Subject: Re: ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefined!
Date: Mon, 31 May 2021 08:12:21 -0700
Message-ID: <9db68758-1bf0-cec9-4914-ccb8439e2d1f@infradead.org>
In-Reply-To: <CAMuHMdW+e8qvKsf4Ub1zNnBgBX6TKGmUKHSDK0jy05H5gmrh+g@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2785109573295780740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 5/31/21 12:32 AM, Geert Uytterhoeven wrote:
> CC David (original author, asked by driver location change)
> =

> On Mon, May 31, 2021 at 9:29 AM Geert Uytterhoeven <geert@linux-m68k.or=
g> wrote:
>>
>> On Mon, May 31, 2021 at 2:05 AM Randy Dunlap <rdunlap@infradead.org> w=
rote:
>>> On 5/29/21 4:25 PM, kernel test robot wrote:
>>>> First bad commit (maybe !=3D root cause):
>>>>
>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux=
.git master
>>>> head:   df8c66c4cfb91f2372d138b9b714f6df6f506966
>>>> commit: a9770eac511ad82390b9f4a3c1728e078c387ac7 net: mdio: Move MDIO =
drivers into a new subdirectory
>>>> date:   9 months ago
>>>> config: sh-allmodconfig (attached as .config)
>>>> compiler: sh4-linux-gcc (GCC) 9.3.0
>>>> reproduce (this is a W=3D1 build):
>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/=
sbin/make.cross -O ~/bin/make.cross
>>>>         chmod +x ~/bin/make.cross
>>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git/commit/?id=3Da9770eac511ad82390b9f4a3c1728e078c387ac7
>>>>         git remote add linus https://git.kernel.org/pub/scm/linux/kern=
el/git/torvalds/linux.git
>>>>         git fetch --no-tags linus master
>>>>         git checkout a9770eac511ad82390b9f4a3c1728e078c387ac7
>>>>         # save the attached .config to linux build tree
>>>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.c=
ross ARCH=3Dsh
>>>>
>>>> If you fix the issue, kindly add following tag as appropriate
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>
>>>> All errors (new ones prefixed by >>, old ones prefixed by <<):
>>>>
>>>>>> ERROR: modpost: "__delay" [drivers/net/mdio/mdio-cavium.ko] undefine=
d!
>>>
>>> Just a comment here.  kernel test robot has reported this issue
>>> 5 times in 2021 that I know of -- and I could have missed some.
>>>
>>> I see that Geert recently (June 2020) reverted the
>>> EXPORT_SYMBOL(__delay) in arch/sh/lib/delay.c, with this comment:
>>>
>>>     __delay() is an internal implementation detail on several architect=
ures.
>>>     Drivers should not call __delay() directly, as it has non-standardi=
zed
>>>     semantics, or may not even exist.
>>>     Hence there is no need to export __delay() to modules.
>>>
>>>     See also include/asm-generic/delay.h:
>>>
>>>         /* Undefined functions to get compile-time errors */
>>>         ...
>>>         extern void __delay(unsigned long loops);
>>>
>>> However, s/several architectures/all but one architecture: SH/.
>>> All architectures except for SH provide either an exported function,
>>> an inline function, or a macro for __delay(). Yeah, they probably
>>> don't all do the same delay.
>>
>> Hence it must not be used by drivers, as it might give the false assumpt=
ion
>> of working everywhere.  While drivers/net/mdio/mdio-cavium is
>> platform-specific, code might be copied in a new driver, less restricted
>> to a specific platform.

Geert, should all (15) of the other arch EXPORT_SYMBOL(__delay); exports
be removed?  (in theory?  I'm not planning to remove them.)

-- =

~Randy

--===============2785109573295780740==--

