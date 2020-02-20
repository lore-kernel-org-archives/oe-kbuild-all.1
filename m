Content-Type: multipart/mixed; boundary="===============8357857260175373907=="
MIME-Version: 1.0
From: Andrew F. Davis <afd@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Date: Thu, 20 Feb 2020 11:03:50 -0500
Message-ID: <55ddcd29-ed8b-529e-dd54-cbac5cf74e42@ti.com>
In-Reply-To: <20200220155429.GH37466@atomide.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8357857260175373907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/20/20 10:54 AM, Tony Lindgren wrote:
> Andrew,
> =

> * kbuild test robot <lkp@intel.com> [200213 10:27]:
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it master
>> head:   0bf999f9c5e74c7ecf9dafb527146601e5c848b9
>> commit: c37baa06f8a970e4a533d41f7d33e5e57de5ad25 ARM: OMAP2+: Fix undefi=
ned reference to omap_secure_init
>> date:   3 weeks ago
>> config: arm-randconfig-a001-20200213 (attached as .config)
>> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sb=
in/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout c37baa06f8a970e4a533d41f7d33e5e57de5ad25
>>         # save the attached .config to linux build tree
>>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =

>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    arch/arm/mach-omap2/omap-secure.o: In function `omap_smccc_smc':
>>>> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc_smc'
> =

> Have you looked at this one? Looks like there's still an unhandled
> randconfig build case.
> =



I've had a quick look, all the ARM config does:

select HAVE_ARM_SMCCC if CPU_V7

so I don't think this will happen in any real config, but if we want to
prevent randconfig issue this we could force ARCH_OMAP2PLUS to "depend"
on it.

Andrew


> Regards,
> =

> Tony
>=20
--===============8357857260175373907==--

