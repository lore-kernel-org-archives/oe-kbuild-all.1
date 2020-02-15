Content-Type: multipart/mixed; boundary="===============0421608045337773516=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [zen-kernel-zen-kernel:5.5/futex-multiple-wait-v3 1/6] include/linux/compat.h:968:39: error: unknown type name 'compat_uptr_t'; did you mean 'compat_time_t'?
Date: Sat, 15 Feb 2020 22:02:29 +0800
Message-ID: <202002152227.cm0T1wU4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0421608045337773516==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/zen-kernel/zen-kernel 5.5/futex-multiple-wait-v3
head:   3bb79d6c1f8aa069845b5ba9b0edd59b830b95ff
commit: 67546a636d14df7648e926382caef66fd29aca85 [1/6] compat: provide comp=
at_ptr() on all architectures
config: arm64-allnoconfig (attached as .config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 67546a636d14df7648e926382caef66fd29aca85
        # save the attached .config to linux build tree
        GCC_VERSION=3D7.5.0 make.cross ARCH=3Darm64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/ftrace.h:42:0,
                    from include/linux/ftrace.h:21,
                    from include/linux/perf_event.h:49,
                    from include/kvm/arm_pmu.h:10,
                    from arch/arm64/include/asm/kvm_host.h:37,
                    from include/linux/kvm_host.h:36,
                    from arch/arm64/kernel/asm-offsets.c:14:
>> include/linux/compat.h:968:39: error: unknown type name 'compat_uptr_t';=
 did you mean 'compat_time_t'?
    static inline void __user *compat_ptr(compat_uptr_t uptr)
                                          ^~~~~~~~~~~~~
                                          compat_time_t
>> include/linux/compat.h:974:15: error: unknown type name 'compat_uptr_t'
    static inline compat_uptr_t ptr_to_compat(void __user *uptr)
                  ^~~~~~~~~~~~~
   make[2]: *** [scripts/Makefile.build:99: arch/arm64/kernel/asm-offsets.s=
] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1113: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:179: sub-make] Error 2
   7 real  3 user  3 sys  86.54% cpu 	make prepare

vim +968 include/linux/compat.h

   960	=

   961	/*
   962	 * A pointer passed in from user mode. This should not
   963	 * be used for syscall parameters, just declare them
   964	 * as pointers because the syscall entry code will have
   965	 * appropriately converted them already.
   966	 */
   967	#ifndef compat_ptr
 > 968	static inline void __user *compat_ptr(compat_uptr_t uptr)
   969	{
   970		return (void __user *)(unsigned long)uptr;
   971	}
   972	#endif
   973	=

 > 974	static inline compat_uptr_t ptr_to_compat(void __user *uptr)
   975	{
   976		return (u32)(unsigned long)uptr;
   977	}
   978	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0421608045337773516==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============0421608045337773516==--

