Content-Type: multipart/mixed; boundary="===============8677161027913066605=="
MIME-Version: 1.0
From: Vitaly Kuznetsov <vkuznets@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [tip:x86/entry 4/80] drivers/xen/events/events_base.c:1664:6: warning: no previous prototype for 'xen_setup_callback_vector'
Date: Wed, 20 May 2020 12:50:40 +0200
Message-ID: <87d06yubgf.fsf@vitty.brq.redhat.com>
In-Reply-To: <202005201858.UeplJGzF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8677161027913066605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kbuild test robot <lkp@intel.com> writes:

> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/e=
ntry
> head:   095b7a3e7745e6fb7cf0a1c09967c4f43e76f8f4
> commit: fad1940a6a856f59b073e8650e02052ce531154c [4/80] x86/xen: Split HV=
M vector callback setup and interrupt gate allocation
> config: arm-randconfig-r013-20200519 (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout fad1940a6a856f59b073e8650e02052ce531154c
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
>>> drivers/xen/events/events_base.c:1664:6: warning: no previous prototype=
 for 'xen_setup_callback_vector' [-Wmissing-prototypes]
> 1664 | void xen_setup_callback_vector(void) {}
> |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> vim +/xen_setup_callback_vector +1664 drivers/xen/events/events_base.c
>
>   1654	=

>   1655	static __init void xen_alloc_callback_vector(void)
>   1656	{
>   1657		if (!xen_have_vector_callback)
>   1658			return;
>   1659	=

>   1660		pr_info("Xen HVM callback vector for event delivery is enabled\n"=
);
>   1661		alloc_intr_gate(HYPERVISOR_CALLBACK_VECTOR, xen_hvm_callback_vect=
or);
>   1662	}
>   1663	#else
>> 1664	void xen_setup_callback_vector(void) {}

This isn't new in the patch as it just renames 'xen_callback_vector()'
to 'xen_setup_callback_vector()' but we likely need to add 'static'
here. I'll send a patch.


>   1665	static inline void xen_alloc_callback_vector(void) {}
>   1666	#endif
>   1667	=

>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

-- =

Vitaly

--===============8677161027913066605==--

