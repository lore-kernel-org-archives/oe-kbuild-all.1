Content-Type: multipart/mixed; boundary="===============4587570385782387911=="
MIME-Version: 1.0
From: Andrew F. Davis <afd@ti.com>
To: kbuild-all@lists.01.org
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Date: Thu, 20 Feb 2020 13:22:27 -0500
Message-ID: <333dd36f-e760-64b3-9e0f-3a316df9ad10@ti.com>
In-Reply-To: <20200220181141.GR37466@atomide.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4587570385782387911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2/20/20 1:11 PM, Tony Lindgren wrote:
> * Tony Lindgren <tony@atomide.com> [200220 17:58]:
>> * Andrew F. Davis <afd@ti.com> [200220 17:39]:
>>> On 2/20/20 12:13 PM, Tony Lindgren wrote:
>>>> * Tony Lindgren <tony@atomide.com> [200220 16:37]:
>>>>> * Andrew F. Davis <afd@ti.com> [200220 16:24]:
>>>>>> On 2/20/20 11:20 AM, Tony Lindgren wrote:
>>>>>>> * Andrew F. Davis <afd@ti.com> [200220 16:04]:
>>>>>>>> On 2/20/20 10:54 AM, Tony Lindgren wrote:
>>>>>>>>> Andrew,
>>>>>>>>>
>>>>>>>>> * kbuild test robot <lkp@intel.com> [200213 10:27]:
>>>>>>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds=
/linux.git master
>>>>>>>>>> head:   0bf999f9c5e74c7ecf9dafb527146601e5c848b9
>>>>>>>>>> commit: c37baa06f8a970e4a533d41f7d33e5e57de5ad25 ARM: OMAP2+: Fi=
x undefined reference to omap_secure_init
>>>>>>>>>> date:   3 weeks ago
>>>>>>>>>> config: arm-randconfig-a001-20200213 (attached as .config)
>>>>>>>>>> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
>>>>>>>>>> reproduce:
>>>>>>>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/m=
aster/sbin/make.cross -O ~/bin/make.cross
>>>>>>>>>>         chmod +x ~/bin/make.cross
>>>>>>>>>>         git checkout c37baa06f8a970e4a533d41f7d33e5e57de5ad25
>>>>>>>>>>         # save the attached .config to linux build tree
>>>>>>>>>>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =

>>>>>>>>>>
>>>>>>>>>> If you fix the issue, kindly add following tag
>>>>>>>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>>>>>>>>
>>>>>>>>>> All errors (new ones prefixed by >>):
>>>>>>>>>>
>>>>>>>>>>    arch/arm/mach-omap2/omap-secure.o: In function `omap_smccc_sm=
c':
>>>>>>>>>>>> omap-secure.c:(.text+0x94): undefined reference to `__arm_smcc=
c_smc'
>>>>>>>>>
>>>>>>>>> Have you looked at this one? Looks like there's still an unhandled
>>>>>>>>> randconfig build case.
>>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> I've had a quick look, all the ARM config does:
>>>>>>>>
>>>>>>>> select HAVE_ARM_SMCCC if CPU_V7
>>>>>>>>
>>>>>>>> so I don't think this will happen in any real config, but if we wa=
nt to
>>>>>>>> prevent randconfig issue this we could force ARCH_OMAP2PLUS to "de=
pend"
>>>>>>>> on it.
>>>>>>>
>>>>>>> Seems to happen at least with omap2 only config where we don't have
>>>>>>> CPU_V7. Something like below seems to fix it.
>>>>>>>
>>>>>>> If that looks OK to you, I'll send out a proper fix.
>>>>>>>
>>>>>>
>>>>>>
>>>>>> This looks fine to me.
>>>>>>
>>>>>> A better later fix might be to later stub out the actual __arm_smccc=
_smc
>>>>>> in common code if CONFIG_HAVE_ARM_SMCCC is not set, so any platform =
will
>>>>>> get the fix.
>>>>>
>>>>> Yeah seems that might be better. Adding Aaro and Marc to Cc.
>>>>
>>>> But if we can in theory have some arm11 machine with smccc, then this
>>>> local ifdef below is probably the way to go.
>>>>
>>>
>>> If the machine has SMCCC then it will also have the
>>> CONFIG_HAVE_ARM_SMCCC set and so nothing would change.
>>
>> Hmm yeah good point.
> =

> So the patch below seems like the way to go then. Anybody have issues
> with the patch below?
> =

> Regards,
> =

> Tony
> =

> 8< -------------------------
> diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
> --- a/include/linux/arm-smccc.h
> +++ b/include/linux/arm-smccc.h
> @@ -121,6 +121,7 @@ struct arm_smccc_quirk {
>  	} state;
>  };
>  =

> +#ifdef CONFIG_HAVE_ARM_SMCCC
>  /**
>   * __arm_smccc_smc() - make SMC calls
>   * @a0-a7: arguments passed in registers 0 to 7
> @@ -137,6 +138,14 @@ asmlinkage void __arm_smccc_smc(unsigned long a0, un=
signed long a1,
>  			unsigned long a2, unsigned long a3, unsigned long a4,
>  			unsigned long a5, unsigned long a6, unsigned long a7,
>  			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk);
> +#else
> +static inline void __arm_smccc_smc(unsigned long a0, unsigned long a1,
> +			unsigned long a2, unsigned long a3, unsigned long a4,
> +			unsigned long a5, unsigned long a6, unsigned long a7,
> +			struct arm_smccc_res *res, struct arm_smccc_quirk *quirk)
> +{


Maybe a warning? If you do not have SMC on your platform but are still
making SMC calls then something is broken and it looks like it would
fail silently here.

Andrew


> +}
> +#endif
>  =

>  /**
>   * __arm_smccc_hvc() - make HVC calls
>=20
--===============4587570385782387911==--

