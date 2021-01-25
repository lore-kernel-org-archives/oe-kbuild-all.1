Content-Type: multipart/mixed; boundary="===============0934450009806606691=="
MIME-Version: 1.0
From: Helge Deller <deller@gmx.de>
To: kbuild-all@lists.01.org
Subject: Re: hppa64-linux-ld: mm/hugetlb.o(.text+0x50dc): cannot reach printk
Date: Mon, 25 Jan 2021 22:05:23 +0100
Message-ID: <ec7d8302-1040-2161-efaa-4b148caabe3e@gmx.de>
In-Reply-To: <CAKwvOd=RHb5yQj5kKuvt9BnywNUmRtivPu_qebLG8XXDyr8cCA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0934450009806606691==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/25/21 9:58 PM, Nick Desaulniers wrote:
> On Mon, Jan 25, 2021 at 12:47 PM Helge Deller <deller@gmx.de> wrote:
>>
>>>>> On Sat, Jan 16, 2021 at 6:37 AM kernel test robot <lkp@intel.com> w=
rote:
>>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/lin=
ux.git master
>>>>>> head:   1d94330a437a573cfdf848f6743b1ed169242c8a
>>>>>> commit: eff8728fe69880d3f7983bec3fb6cea4c306261f vmlinux.lds.h: Add =
PGO and AutoFDO input sections
>>>>>> date:   5 months ago
>>>>>> config: parisc-randconfig-r032-20210116 (attached as .config)
>>>>>> compiler: hppa64-linux-gcc (GCC) 9.3.0
>>>>>> reproduce (this is a W=3D1 build):
>>>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/maste=
r/sbin/make.cross -O ~/bin/make.cross
>>>>>>         chmod +x ~/bin/make.cross
>>>>>>         # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/commit/?id=3Deff8728fe69880d3f7983bec3fb6cea4c306261f
>>>>>>         git remote add linus https://git.kernel.org/pub/scm/linux/ke=
rnel/git/torvalds/linux.git
>>>>>>         git fetch --no-tags linus master
>>>>>>         git checkout eff8728fe69880d3f7983bec3fb6cea4c306261f
>>>>>>         # save the attached .config to linux build tree
>>>>>>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make=
.cross ARCH=3Dparisc
>>>>>>
>>>>>> If you fix the issue, kindly add following tag as appropriate
>>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>>>
>>>>>> All errors (new ones prefixed by >>):
>>>>>>
>>>>>>    hppa64-linux-ld: mm/page_alloc.o(.ref.text+0x110): cannot reach u=
nknown
>>>>>>    hppa64-linux-ld: mm/memblock.o(.text+0x27c): cannot reach __warn_=
printk
>>>>>>    hppa64-linux-ld: mm/memblock.o(.meminit.text+0xc4): cannot reach =
printk
>> ....
>>
>> The problem with this .config is, that both CONFIG_MODULES and
>> CONFIG_MLONGCALLS are set to "n".
>> The Kconfig autodetection needs fixing to enable CONFIG_MLONGCALLS in
>> this case.
>>
>>
>> This patch fixes it for me:
>>
>> [PATCH] Require -mlong-calls gcc option for !CONFIG_MODULES
>>
>> When building a kernel without module support, the CONFIG_MLONGCALL
>> option needs to be enabled. This patch fixes the autodetection in the
>> Kconfig script and uses a far call to preempt_schedule_irq() in
>> intr_do_preempt().
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> ---
>>
>> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
>> index 78b17621ee4a..278462186ac4 100644
>> --- a/arch/parisc/Kconfig
>> +++ b/arch/parisc/Kconfig
>> @@ -202,9 +202,8 @@ config PREFETCH
>>         depends on PA8X00 || PA7200
>>
>>  config MLONGCALLS
>> -       bool "Enable the -mlong-calls compiler option for big kernels"
>> -       default y if !MODULES || UBSAN || FTRACE
>> -       default n
>> +       def_bool y if !MODULES || UBSAN || FTRACE
>> +       bool "Enable the -mlong-calls compiler option for big kernels" i=
f MODULES && !UBSAN && !FTRACE
>
> ^ this looks like the same constraints specified twice?  Am I
> understanding that correctly? (I don't understand why this isn't
> specified _once_).

The logic is:
- if (!MODULES || UBSAN || FTRACE) then don't ask and always set to Y,
- otherwise show menu entry but leave default as N.

If this can be done in one line I'm happy to correct it.

Helge
--===============0934450009806606691==--

