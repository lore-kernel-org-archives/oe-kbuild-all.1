Content-Type: multipart/mixed; boundary="===============6811336633024283706=="
MIME-Version: 1.0
From: Tony Lindgren <tony@atomide.com>
To: kbuild-all@lists.01.org
Subject: Re: omap-secure.c:undefined reference to `__arm_smccc_smc'
Date: Thu, 20 Feb 2020 09:57:44 -0800
Message-ID: <20200220175744.GQ37466@atomide.com>
In-Reply-To: <281e895b-720d-5bab-63cf-8b3e389dc767@ti.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6811336633024283706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

* Andrew F. Davis <afd@ti.com> [200220 17:39]:
> On 2/20/20 12:13 PM, Tony Lindgren wrote:
> > * Tony Lindgren <tony@atomide.com> [200220 16:37]:
> >> * Andrew F. Davis <afd@ti.com> [200220 16:24]:
> >>> On 2/20/20 11:20 AM, Tony Lindgren wrote:
> >>>> * Andrew F. Davis <afd@ti.com> [200220 16:04]:
> >>>>> On 2/20/20 10:54 AM, Tony Lindgren wrote:
> >>>>>> Andrew,
> >>>>>>
> >>>>>> * kbuild test robot <lkp@intel.com> [200213 10:27]:
> >>>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/=
linux.git master
> >>>>>>> head:   0bf999f9c5e74c7ecf9dafb527146601e5c848b9
> >>>>>>> commit: c37baa06f8a970e4a533d41f7d33e5e57de5ad25 ARM: OMAP2+: Fix=
 undefined reference to omap_secure_init
> >>>>>>> date:   3 weeks ago
> >>>>>>> config: arm-randconfig-a001-20200213 (attached as .config)
> >>>>>>> compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
> >>>>>>> reproduce:
> >>>>>>>         wget https://raw.githubusercontent.com/intel/lkp-tests/ma=
ster/sbin/make.cross -O ~/bin/make.cross
> >>>>>>>         chmod +x ~/bin/make.cross
> >>>>>>>         git checkout c37baa06f8a970e4a533d41f7d33e5e57de5ad25
> >>>>>>>         # save the attached .config to linux build tree
> >>>>>>>         GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm =

> >>>>>>>
> >>>>>>> If you fix the issue, kindly add following tag
> >>>>>>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>>>>>
> >>>>>>> All errors (new ones prefixed by >>):
> >>>>>>>
> >>>>>>>    arch/arm/mach-omap2/omap-secure.o: In function `omap_smccc_smc=
':
> >>>>>>>>> omap-secure.c:(.text+0x94): undefined reference to `__arm_smccc=
_smc'
> >>>>>>
> >>>>>> Have you looked at this one? Looks like there's still an unhandled
> >>>>>> randconfig build case.
> >>>>>>
> >>>>>
> >>>>>
> >>>>> I've had a quick look, all the ARM config does:
> >>>>>
> >>>>> select HAVE_ARM_SMCCC if CPU_V7
> >>>>>
> >>>>> so I don't think this will happen in any real config, but if we wan=
t to
> >>>>> prevent randconfig issue this we could force ARCH_OMAP2PLUS to "dep=
end"
> >>>>> on it.
> >>>>
> >>>> Seems to happen at least with omap2 only config where we don't have
> >>>> CPU_V7. Something like below seems to fix it.
> >>>>
> >>>> If that looks OK to you, I'll send out a proper fix.
> >>>>
> >>>
> >>>
> >>> This looks fine to me.
> >>>
> >>> A better later fix might be to later stub out the actual __arm_smccc_=
smc
> >>> in common code if CONFIG_HAVE_ARM_SMCCC is not set, so any platform w=
ill
> >>> get the fix.
> >>
> >> Yeah seems that might be better. Adding Aaro and Marc to Cc.
> > =

> > But if we can in theory have some arm11 machine with smccc, then this
> > local ifdef below is probably the way to go.
> > =

> =

> If the machine has SMCCC then it will also have the
> CONFIG_HAVE_ARM_SMCCC set and so nothing would change.

Hmm yeah good point.

Regards,

Tony


> >>>> 8< -----------------------
> >>>> diff --git a/arch/arm/mach-omap2/omap-secure.c b/arch/arm/mach-omap2=
/omap-secure.c
> >>>> --- a/arch/arm/mach-omap2/omap-secure.c
> >>>> +++ b/arch/arm/mach-omap2/omap-secure.c
> >>>> @@ -77,6 +77,7 @@ u32 omap_secure_dispatcher(u32 idx, u32 flag, u32 =
nargs, u32 arg1, u32 arg2,
> >>>>  	return ret;
> >>>>  }
> >>>>  =

> >>>> +#ifdef CONFIG_HAVE_ARM_SMCCC
> >>>>  void omap_smccc_smc(u32 fn, u32 arg)
> >>>>  {
> >>>>  	struct arm_smccc_res res;
> >>>> @@ -85,6 +86,11 @@ void omap_smccc_smc(u32 fn, u32 arg)
> >>>>  		      0, 0, 0, 0, 0, 0, &res);
> >>>>  	WARN(res.a0, "Secure function call 0x%08x failed\n", fn);
> >>>>  }
> >>>> +#else
> >>>> +void omap_smccc_smc(u32 fn, u32 arg)
> >>>> +{
> >>>> +}
> >>>> +#endif
> >>>>  =

> >>>>  void omap_smc1(u32 fn, u32 arg)
> >>>>  {
> >>>>
--===============6811336633024283706==--

