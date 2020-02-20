Content-Type: multipart/mixed; boundary="===============8335231755221249548=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC v2 4/4] X86: Use KVM CR pin MSRs
Date: Fri, 21 Feb 2020 04:36:33 +0800
Message-ID: <202002210411.iAlre3aF%lkp@intel.com>
In-Reply-To: <20200218215902.5655-5-john.s.andersen@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8335231755221249548==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi John,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on kvm/linux-next]
[also build test WARNING on v5.6-rc2 next-20200220]
[cannot apply to tip/x86/core tip/auto-latest]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/John-Andersen/Paravirtuali=
zed-Control-Register-pinning/20200220-155307
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git linux-next
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-166-g7e4a5b6f-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/kvm.c:867:42: sparse: sparse: non-ANSI function declarat=
ion of function 'kvm_paravirt_cr_pinning_init'

vim +/kvm_paravirt_cr_pinning_init +867 arch/x86/kernel/kvm.c

   866	=

 > 867	void __init kvm_paravirt_cr_pinning_init()
   868	{
   869	#ifdef CONFIG_KEXEC_CORE
   870		if (!cmdline_find_option_bool(boot_command_line, "pv_cr_pin"))
   871			return;
   872	=

   873		/* Paravirtualized CR pinning is currently incompatible with kexec =
*/
   874		kexec_load_disabled =3D 1;
   875	#endif
   876	=

   877		kvm_paravirt_cr_pinning_enabled =3D 1;
   878	}
   879	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8335231755221249548==--

