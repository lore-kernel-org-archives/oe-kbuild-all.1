Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217B17F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 01:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688606174; x=1720142174;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yvVnh7mlesIoCHadbFNP9SSb6IN3SImvUC8q0BCpqzA=;
  b=i1dNgK/SHS7OGEsWaDFiCR7etxy0oVNAPWGqXVGn7Ek2T4wyBE9HAeLh
   CHObWVisU7UCmtsfjPNmUCCKS9zyT4i3mwRyOGo+EUA6j3+wxfbNs4GNV
   H/KufdZ4cX6mzYzsUrIQo73+0+MqgitRyTJPOzOuXaQTH5+aGouVHBXA7
   elCqDjWZ0/EicGGFsbra8byp100oMcwVsBZdLd3+y9q4AaEF9WiLuV3LL
   QanHi1iE+31sFydC9JRM+E539UsF1tGDDxNfQHVQA9zsBRnJeeHVMf/8Q
   ML7HBWGbmnw/RTQd1ORPtNTvpLSrz/9Fr8VudjxOIE6xXyI7q10RUGH4K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429519706"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="429519706"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 18:16:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="843484110"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="843484110"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 05 Jul 2023 18:16:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHDbO-0000vo-0c;
	Thu, 06 Jul 2023 01:16:10 +0000
Date: Thu, 6 Jul 2023 09:15:40 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 9/19]
 arch/arm/include/asm/cmpxchg.h:119:21: error: invalid type argument of unary
 '*' (have 'int')
Message-ID: <202307060915.VgX6V8cC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   dafc95d811f426078ef86cbbbb995055280e415e
commit: e92bee18ff7a05e2f59f4135d10067dcefb3e861 [9/19] arm/kexec: refactor for kernel/Kconfig.kexec
config: arm-randconfig-r003-20230706 (https://download.01.org/0day-ci/archive/20230706/202307060915.VgX6V8cC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060915.VgX6V8cC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060915.VgX6V8cC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/kexec.c:45:21: error: invalid use of undefined type 'struct kimage'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                     ^~
   include/linux/fortify-string.h:639:40: note: in definition of macro '__fortify_memcpy_chk'
     639 |         const size_t __p_size_field = (p_size_field);                   \
         |                                        ^~~~~~~~~~~~
   include/linux/fortify-string.h:695:17: note: in expansion of macro '__member_size'
     695 |                 __member_size(p), __member_size(q),                     \
         |                 ^~~~~~~~~~~~~
   kernel/kexec.c:45:9: note: in expansion of macro 'memcpy'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |         ^~~~~~
   kernel/kexec.c:45:21: error: invalid use of undefined type 'struct kimage'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                     ^~
   include/linux/fortify-string.h:648:27: note: in definition of macro '__fortify_memcpy_chk'
     648 |         __underlying_##op(p, q, __fortify_size);                        \
         |                           ^
   kernel/kexec.c:45:9: note: in expansion of macro 'memcpy'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |         ^~~~~~
   kernel/kexec.c:49:22: error: invalid use of undefined type 'struct kimage'
      49 |                 image->control_page = crashk_res.start;
         |                      ^~
   kernel/kexec.c:50:22: error: invalid use of undefined type 'struct kimage'
      50 |                 image->type = KEXEC_TYPE_CRASH;
         |                      ^~
   kernel/kexec.c:50:31: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
      50 |                 image->type = KEXEC_TYPE_CRASH;
         |                               ^~~~~~~~~~~~~~~~
         |                               KEXEC_ON_CRASH
   kernel/kexec.c:50:31: note: each undeclared identifier is reported only once for each function it appears in
   kernel/kexec.c:63:14: error: invalid use of undefined type 'struct kimage'
      63 |         image->control_code_page = kimage_alloc_control_pages(image,
         |              ^~
   kernel/kexec.c:63:36: error: implicit declaration of function 'kimage_alloc_control_pages' [-Werror=implicit-function-declaration]
      63 |         image->control_code_page = kimage_alloc_control_pages(image,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c:64:54: error: 'KEXEC_CONTROL_PAGE_SIZE' undeclared (first use in this function)
      64 |                                            get_order(KEXEC_CONTROL_PAGE_SIZE));
         |                                                      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c:65:19: error: invalid use of undefined type 'struct kimage'
      65 |         if (!image->control_code_page) {
         |                   ^~
   kernel/kexec.c:71:22: error: invalid use of undefined type 'struct kimage'
      71 |                 image->swap_page = kimage_alloc_control_pages(image, 0);
         |                      ^~
   kernel/kexec.c:72:27: error: invalid use of undefined type 'struct kimage'
      72 |                 if (!image->swap_page) {
         |                           ^~
   kernel/kexec.c:81:37: error: invalid use of undefined type 'struct kimage'
      81 |         kimage_free_page_list(&image->control_pages);
         |                                     ^~
   kernel/kexec.c: In function 'do_kexec_load':
   kernel/kexec.c:103:31: error: 'kexec_crash_image' undeclared (first use in this function); did you mean 'kexec_crash_loaded'?
     103 |                 dest_image = &kexec_crash_image;
         |                               ^~~~~~~~~~~~~~~~~
         |                               kexec_crash_loaded
   kernel/kexec.c:105:25: error: implicit declaration of function 'arch_kexec_unprotect_crashkres' [-Werror=implicit-function-declaration]
     105 |                         arch_kexec_unprotect_crashkres();
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c:107:31: error: 'kexec_image' undeclared (first use in this function)
     107 |                 dest_image = &kexec_image;
         |                               ^~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arm/include/asm/bitops.h:245,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time64.h:5,
                    from include/linux/restart_block.h:10,
                    from include/linux/thread_info.h:14,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arm/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56:
   include/linux/atomic/atomic-instrumented.h:4715:55: error: invalid type argument of unary '*' (have 'int')
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   include/linux/atomic/atomic-instrumented.h:4715:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                      ^~~~~~~~
         |                                      |
         |                                      int
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   In file included from include/linux/atomic/atomic-instrumented.h:17:
   include/linux/instrumented.h:94:79: note: expected 'const volatile void *' but argument is of type 'int'
      94 | static __always_inline void instrument_atomic_read_write(const volatile void *v, size_t size)
         |                                                          ~~~~~~~~~~~~~~~~~~~~~^
   In file included from arch/arm/include/asm/atomic.h:16,
                    from include/linux/atomic.h:7:
>> arch/arm/include/asm/cmpxchg.h:119:21: error: invalid type argument of unary '*' (have 'int')
     119 |         (__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),      \
         |                     ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_xchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/arm/include/asm/cmpxchg.h:120:48: error: invalid type argument of unary '*' (have 'int')
     120 |                                         sizeof(*(ptr)));                \
         |                                                ^~~~~~
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_xchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
>> arch/arm/include/asm/cmpxchg.h:119:61: warning: passing argument 2 of '__arch_xchg' makes pointer from integer without a cast [-Wint-conversion]
     119 |         (__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),      \
         |                                                             ^~~~~
         |                                                             |
         |                                                             int
   include/linux/atomic.h:73:16: note: in expansion of macro 'arch_xchg_relaxed'
      73 |         typeof(op##_relaxed(args)) __ret;                               \
         |                ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/arm/include/asm/cmpxchg.h:29:45: note: expected 'volatile void *' but argument is of type 'int'
      29 | __arch_xchg(unsigned long x, volatile void *ptr, int size)
         |                              ~~~~~~~~~~~~~~~^~~
>> arch/arm/include/asm/cmpxchg.h:119:21: error: invalid type argument of unary '*' (have 'int')
     119 |         (__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),      \
         |                     ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/arm/include/asm/cmpxchg.h:120:48: error: invalid type argument of unary '*' (have 'int')
     120 |                                         sizeof(*(ptr)));                \
         |                                                ^~~~~~
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
>> arch/arm/include/asm/cmpxchg.h:119:61: warning: passing argument 2 of '__arch_xchg' makes pointer from integer without a cast [-Wint-conversion]
     119 |         (__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),      \
         |                                                             ^~~~~
         |                                                             |
         |                                                             int
   include/linux/atomic.h:75:17: note: in expansion of macro 'arch_xchg_relaxed'
      75 |         __ret = op##_relaxed(args);                                     \
         |                 ^~
   include/linux/atomic/atomic-arch-fallback.h:15:9: note: in expansion of macro '__atomic_op_fence'
      15 |         __atomic_op_fence(arch_xchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/arm/include/asm/cmpxchg.h:29:45: note: expected 'volatile void *' but argument is of type 'int'
      29 | __arch_xchg(unsigned long x, volatile void *ptr, int size)
         |                              ~~~~~~~~~~~~~~~^~~
>> include/linux/atomic/atomic-instrumented.h:4712:2: warning: passing argument 1 of 'kimage_free' makes pointer from integer without a cast [-Wint-conversion]
    4712 | ({ \
         | ~^~~
         |  |
         |  int
    4713 |         typeof(ptr) __ai_ptr = (ptr); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4714 |         kcsan_mb(); \
         |         ~~~~~~~~~~~~~
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    4717 | })
         | ~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   In file included from kernel/kexec.c:20:
   kernel/kexec_internal.h:10:33: note: expected 'struct kimage *' but argument is of type 'int'
      10 | void kimage_free(struct kimage *image);
         |                  ~~~~~~~~~~~~~~~^~~~~
   kernel/kexec.c:130:22: error: invalid use of undefined type 'struct kimage'
     130 |                 image->preserve_context = 1;
         |                      ^~
   kernel/kexec.c:132:15: error: implicit declaration of function 'machine_kexec_prepare' [-Werror=implicit-function-declaration]
     132 |         ret = machine_kexec_prepare(image);
         |               ^~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c:140:15: error: implicit declaration of function 'kimage_crash_copy_vmcoreinfo'; did you mean 'arch_crash_save_vmcoreinfo'? [-Werror=implicit-function-declaration]
     140 |         ret = kimage_crash_copy_vmcoreinfo(image);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               arch_crash_save_vmcoreinfo
   kernel/kexec.c:145:56: error: invalid use of undefined type 'struct kimage'
     145 |                 ret = kimage_load_segment(image, &image->segment[i]);
         |                                                        ^~
   kernel/kexec.c:152:15: error: implicit declaration of function 'machine_kexec_post_load' [-Werror=implicit-function-declaration]
     152 |         ret = machine_kexec_post_load(image);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c:161:17: error: implicit declaration of function 'arch_kexec_protect_crashkres' [-Werror=implicit-function-declaration]
     161 |                 arch_kexec_protect_crashkres();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c: In function 'kexec_load_check':
   kernel/kexec.c:194:26: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
     194 |                          KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
         |                          ^~~~~~~~~~~~~~~~
         |                          KEXEC_ON_CRASH
   kernel/kexec.c:194:45: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'KEXEC_ARCH_DEFAULT'?
     194 |                          KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
         |                                             ^~~~~~~~~~~~~~~~~~
         |                                             KEXEC_ARCH_DEFAULT
   kernel/kexec.c:198:14: error: implicit declaration of function 'kexec_load_permitted' [-Werror=implicit-function-declaration]
     198 |         if (!kexec_load_permitted(image_type))
         |              ^~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c:218:22: error: 'KEXEC_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
     218 |         if ((flags & KEXEC_FLAGS) != (flags & ~KEXEC_ARCH_MASK))
         |                      ^~~~~~~~~~~
         |                      QC_FLAGS
   kernel/kexec.c: In function '__do_sys_kexec_load':
   kernel/kexec.c:241:43: error: 'KEXEC_ARCH' undeclared (first use in this function); did you mean 'KEXEC_ARCH_SH'?
     241 |         if (((flags & KEXEC_ARCH_MASK) != KEXEC_ARCH) &&
         |                                           ^~~~~~~~~~
         |                                           KEXEC_ARCH_SH
   kernel/kexec.c:245:73: error: invalid use of undefined type 'struct kexec_segment'
     245 |         ksegments = memdup_user(segments, nr_segments * sizeof(ksegments[0]));
         |                                                                         ^
   kernel/kexec.c:245:63: error: invalid application of 'sizeof' to incomplete type 'struct kexec_segment'
     245 |         ksegments = memdup_user(segments, nr_segments * sizeof(ksegments[0]));
         |                                                               ^
   cc1: some warnings being treated as errors
--
   arch/arm/kernel/setup.c: In function 'reserve_crashkernel':
>> arch/arm/kernel/setup.c:1034:63: error: 'SECTION_SIZE' undeclared (first use in this function); did you mean 'SUBSECTION_SIZE'?
    1034 |                 start = memblock_phys_alloc_range(crash_size, SECTION_SIZE,
         |                                                               ^~~~~~~~~~~~
         |                                                               SUBSECTION_SIZE
   arch/arm/kernel/setup.c:1034:63: note: each undeclared identifier is reported only once for each function it appears in
   In file included from arch/arm/include/asm/efi.h:12,
                    from arch/arm/kernel/setup.c:37:
   arch/arm/include/asm/fixmap.h: At top level:
   arch/arm/include/asm/fixmap.h:39:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
      39 | static const enum fixed_addresses __end_of_fixed_addresses =
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/kernel/machine_kexec.c:33:34: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
      33 | int machine_kexec_prepare(struct kimage *image)
         |                                  ^~~~~~
>> arch/arm/kernel/machine_kexec.c:33:5: warning: no previous prototype for 'machine_kexec_prepare' [-Wmissing-prototypes]
      33 | int machine_kexec_prepare(struct kimage *image)
         |     ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/machine_kexec.c: In function 'machine_kexec_prepare':
>> arch/arm/kernel/machine_kexec.c:39:14: error: invalid use of undefined type 'struct kimage'
      39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
         |              ^~
   arch/arm/kernel/machine_kexec.c:39:38: error: invalid use of undefined type 'struct kimage'
      39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
         |                                      ^~
>> arch/arm/kernel/machine_kexec.c:39:48: error: 'KEXEC_ARM_ZIMAGE_OFFSET' undeclared (first use in this function)
      39 |         image->arch.kernel_r2 = image->start - KEXEC_ARM_ZIMAGE_OFFSET
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/machine_kexec.c:39:48: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm/kernel/machine_kexec.c:40:40: error: 'KEXEC_ARM_ATAGS_OFFSET' undeclared (first use in this function)
      40 |                                      + KEXEC_ARM_ATAGS_OFFSET;
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/machine_kexec.c:55:30: error: invalid use of undefined type 'struct kimage'
      55 |         for (i = 0; i < image->nr_segments; i++) {
         |                              ^~
   arch/arm/kernel/machine_kexec.c:56:41: error: invalid use of undefined type 'struct kimage'
      56 |                 current_segment = &image->segment[i];
         |                                         ^~
>> arch/arm/kernel/machine_kexec.c:58:77: error: invalid use of undefined type 'struct kexec_segment'
      58 |                 if (!memblock_is_region_memory(idmap_to_phys(current_segment->mem),
         |                                                                             ^~
   arch/arm/kernel/machine_kexec.c:59:63: error: invalid use of undefined type 'struct kexec_segment'
      59 |                                                current_segment->memsz))
         |                                                               ^~
   In file included from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:988,
                    from arch/arm/kernel/machine_kexec.c:6:
   arch/arm/kernel/machine_kexec.c:62:64: error: invalid use of undefined type 'struct kexec_segment'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                                                                ^~
   arch/arm/include/asm/uaccess.h:264:51: note: in definition of macro '__get_user_err'
     264 |         unsigned long __gu_addr = (unsigned long)(ptr);                 \
         |                                                   ^~~
   arch/arm/include/asm/uaccess.h:229:25: note: in expansion of macro '__get_user'
     229 | #define get_user(x, p)  __get_user(x, p)
         |                         ^~~~~~~~~~
   arch/arm/kernel/machine_kexec.c:62:23: note: in expansion of macro 'get_user'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                       ^~~~~~~~
   arch/arm/kernel/machine_kexec.c:62:64: error: invalid use of undefined type 'struct kexec_segment'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                                                                ^~
   arch/arm/include/asm/uaccess.h:270:26: note: in definition of macro '__get_user_err'
     270 |         switch (sizeof(*(ptr))) {                                       \
         |                          ^~~
   arch/arm/include/asm/uaccess.h:229:25: note: in expansion of macro '__get_user'
     229 | #define get_user(x, p)  __get_user(x, p)
         |                         ^~~~~~~~~~
   arch/arm/kernel/machine_kexec.c:62:23: note: in expansion of macro 'get_user'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                       ^~~~~~~~
   arch/arm/kernel/machine_kexec.c:62:64: error: invalid use of undefined type 'struct kexec_segment'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                                                                ^~
   arch/arm/include/asm/uaccess.h:277:29: note: in definition of macro '__get_user_err'
     277 |         (x) = (__typeof__(*(ptr)))__gu_val;                             \
         |                             ^~~
   arch/arm/include/asm/uaccess.h:229:25: note: in expansion of macro '__get_user'
     229 | #define get_user(x, p)  __get_user(x, p)
         |                         ^~~~~~~~~~
   arch/arm/kernel/machine_kexec.c:62:23: note: in expansion of macro 'get_user'
      62 |                 err = get_user(header, (__be32*)current_segment->buf);
         |                       ^~~~~~~~
   arch/arm/kernel/machine_kexec.c:67:30: error: invalid use of undefined type 'struct kimage'
      67 |                         image->arch.kernel_r2 = current_segment->mem;
         |                              ^~
   arch/arm/kernel/machine_kexec.c:67:64: error: invalid use of undefined type 'struct kexec_segment'
      67 |                         image->arch.kernel_r2 = current_segment->mem;
         |                                                                ^~
   arch/arm/kernel/machine_kexec.c: At top level:
   arch/arm/kernel/machine_kexec.c:72:35: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
      72 | void machine_kexec_cleanup(struct kimage *image)
         |                                   ^~~~~~
>> arch/arm/kernel/machine_kexec.c:72:6: warning: no previous prototype for 'machine_kexec_cleanup' [-Wmissing-prototypes]
      72 | void machine_kexec_cleanup(struct kimage *image)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/arm/kernel/machine_kexec.c: In function 'machine_crash_nonpanic_core':
>> arch/arm/kernel/machine_kexec.c:82:9: error: implicit declaration of function 'crash_setup_regs' [-Werror=implicit-function-declaration]
      82 |         crash_setup_regs(&regs, get_irq_regs());
         |         ^~~~~~~~~~~~~~~~
>> arch/arm/kernel/machine_kexec.c:85:9: error: implicit declaration of function 'crash_save_cpu' [-Werror=implicit-function-declaration]
      85 |         crash_save_cpu(&regs, smp_processor_id());
         |         ^~~~~~~~~~~~~~
   arch/arm/kernel/machine_kexec.c: At top level:
   arch/arm/kernel/machine_kexec.c:152:27: warning: 'struct kimage' declared inside parameter list will not be visible outside of this definition or declaration
     152 | void machine_kexec(struct kimage *image)
         |                           ^~~~~~
>> arch/arm/kernel/machine_kexec.c:152:6: warning: no previous prototype for 'machine_kexec' [-Wmissing-prototypes]
     152 | void machine_kexec(struct kimage *image)
         |      ^~~~~~~~~~~~~
   arch/arm/kernel/machine_kexec.c: In function 'machine_kexec':
   arch/arm/kernel/machine_kexec.c:167:26: error: invalid use of undefined type 'struct kimage'
     167 |         page_list = image->head & PAGE_MASK;
         |                          ^~
   arch/arm/kernel/machine_kexec.c:169:48: error: invalid use of undefined type 'struct kimage'
     169 |         reboot_code_buffer = page_address(image->control_code_page);
         |                                                ^~
   include/linux/mm.h:2144:48: note: in definition of macro 'page_address'
    2144 | #define page_address(page) lowmem_page_address(page)
         |                                                ^~~~
   arch/arm/kernel/machine_kexec.c:177:42: error: invalid use of undefined type 'struct kimage'
     177 |         data->kexec_start_address = image->start;
         |                                          ^~
   arch/arm/kernel/machine_kexec.c:180:31: error: invalid use of undefined type 'struct kimage'
     180 |         data->kexec_r2 = image->arch.kernel_r2;
         |                               ^~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for KEXEC
   Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
   Selected by [y]:
   - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]


vim +119 arch/arm/include/asm/cmpxchg.h

9f97da78bf0182 David Howells 2012-03-28  117  
fc63a6e08a8c97 Mark Rutland  2021-05-25  118  #define arch_xchg_relaxed(ptr, x) ({					\
068550631fbe0b Andrzej Hajda 2023-01-18 @119  	(__typeof__(*(ptr)))__arch_xchg((unsigned long)(x), (ptr),	\
e001bbae7147b1 Russell King  2015-05-26  120  					sizeof(*(ptr)));		\
e001bbae7147b1 Russell King  2015-05-26  121  })
9f97da78bf0182 David Howells 2012-03-28  122  

:::::: The code at line 119 was first introduced by commit
:::::: 068550631fbe0b7fb41625cea6fb204fdc8cb224 locking/arch: Rename all internal __xchg() names to __arch_xchg()

:::::: TO: Andrzej Hajda <andrzej.hajda@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
