Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF377F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 01:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688608034; x=1720144034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9QU1+vIRnwaJPRW3JwNk80RGwreUaAJ+WlklcdAedAQ=;
  b=n6ztciF7abA6keyMByccUqTh1AFuNWi7WX/+3ZpSO1SIPFLSsKOZAX+z
   LHDVgFLw64n/WY9Nf2eQ0/UQ0hYhU7V6+PSmcQLD7a5PN8vS/F9JbJQnZ
   bIkV3Ulppsm5m7m7zlcqxSaYn1SLFY4AVqEVR0A29zjXnupQnYp3F2BVv
   Aupm4eFC5SAxGu3uqLqnXfHYEc1GeZkVr0omMPLYi3vkgFX0Fl344JDnH
   e7DPiZ15qcfMgPb1WEyA/GMCza9V/rIQy19EcJTBcCS/l0vnCqDR8mZn5
   lPn4Tfuxk8Z/R8Hh+RbsZn4UW0PqwrndYhQhDJhZFsdQ4or05EZWSwfQ6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="427164137"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="427164137"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 18:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="789358485"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="789358485"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2023 18:47:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHE5O-0000xG-2m;
	Thu, 06 Jul 2023 01:47:10 +0000
Date: Thu, 6 Jul 2023 09:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 17/19] kernel/kexec.c:33:30: error:
 implicit declaration of function 'phys_to_boot_phys'
Message-ID: <202307060950.2rBIE1wF-lkp@intel.com>
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
commit: e078f8c58a73f6c81ed19398676df3b149160672 [17/19] riscv/kexec: refactor for kernel/Kconfig.kexec
config: riscv-randconfig-r042-20230706 (https://download.01.org/0day-ci/archive/20230706/202307060950.2rBIE1wF-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307060950.2rBIE1wF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307060950.2rBIE1wF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   kernel/kexec.c: In function 'kimage_alloc_init':
>> kernel/kexec.c:33:30: error: implicit declaration of function 'phys_to_boot_phys' [-Werror=implicit-function-declaration]
      33 |                 if ((entry < phys_to_boot_phys(crashk_res.start)) ||
         |                              ^~~~~~~~~~~~~~~~~
>> kernel/kexec.c:43:14: error: invalid use of undefined type 'struct kimage'
      43 |         image->start = entry;
         |              ^~
   kernel/kexec.c:44:14: error: invalid use of undefined type 'struct kimage'
      44 |         image->nr_segments = nr_segments;
         |              ^~
   In file included from include/linux/string.h:254,
                    from include/linux/bitmap.h:11,
                    from include/linux/cpumask.h:12,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from kernel/kexec.c:10:
>> kernel/kexec.c:45:62: error: invalid application of 'sizeof' to incomplete type 'struct kexec_segment'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                                                              ^
   include/linux/fortify-string.h:636:48: note: in definition of macro '__fortify_memcpy_chk'
     636 |         const size_t __fortify_size = (size_t)(size);                   \
         |                                                ^~~~
   kernel/kexec.c:45:9: note: in expansion of macro 'memcpy'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |         ^~~~~~
   kernel/kexec.c:45:21: error: invalid use of undefined type 'struct kimage'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |                     ^~
   include/linux/fortify-string.h:637:34: note: in definition of macro '__fortify_memcpy_chk'
     637 |         const size_t __p_size = (p_size);                               \
         |                                  ^~~~~~
   include/linux/fortify-string.h:694:17: note: in expansion of macro '__struct_size'
     694 |                 __struct_size(p), __struct_size(q),                     \
         |                 ^~~~~~~~~~~~~
   kernel/kexec.c:45:9: note: in expansion of macro 'memcpy'
      45 |         memcpy(image->segment, segments, nr_segments * sizeof(*segments));
         |         ^~~~~~
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
>> kernel/kexec.c:50:31: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
      50 |                 image->type = KEXEC_TYPE_CRASH;
         |                               ^~~~~~~~~~~~~~~~
         |                               KEXEC_ON_CRASH
   kernel/kexec.c:50:31: note: each undeclared identifier is reported only once for each function it appears in
   kernel/kexec.c:63:14: error: invalid use of undefined type 'struct kimage'
      63 |         image->control_code_page = kimage_alloc_control_pages(image,
         |              ^~
>> kernel/kexec.c:63:36: error: implicit declaration of function 'kimage_alloc_control_pages' [-Werror=implicit-function-declaration]
      63 |         image->control_code_page = kimage_alloc_control_pages(image,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kexec.c:64:54: error: 'KEXEC_CONTROL_PAGE_SIZE' undeclared (first use in this function)
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
>> kernel/kexec.c:103:31: error: 'kexec_crash_image' undeclared (first use in this function); did you mean 'kexec_crash_loaded'?
     103 |                 dest_image = &kexec_crash_image;
         |                               ^~~~~~~~~~~~~~~~~
         |                               kexec_crash_loaded
>> kernel/kexec.c:105:25: error: implicit declaration of function 'arch_kexec_unprotect_crashkres' [-Werror=implicit-function-declaration]
     105 |                         arch_kexec_unprotect_crashkres();
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kexec.c:107:31: error: 'kexec_image' undeclared (first use in this function)
     107 |                 dest_image = &kexec_image;
         |                               ^~~~~~~~~~~
   In file included from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:13:
>> include/linux/atomic/atomic-instrumented.h:4715:55: error: invalid type argument of unary '*' (have 'int')
    4715 |         instrument_atomic_read_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                       ^~~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
>> include/linux/atomic/atomic-instrumented.h:4715:38: warning: passing argument 1 of 'instrument_atomic_read_write' makes pointer from integer without a cast [-Wint-conversion]
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
   In file included from arch/riscv/include/asm/atomic.h:19,
                    from include/linux/atomic.h:7:
>> arch/riscv/include/asm/cmpxchg.h:145:20: error: invalid type argument of unary '*' (have 'int')
     145 |         __typeof__(*(ptr)) _x_ = (x);                                   \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
>> arch/riscv/include/asm/cmpxchg.h:145:34: warning: initialization of 'int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     145 |         __typeof__(*(ptr)) _x_ = (x);                                   \
         |                                  ^
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/riscv/include/asm/cmpxchg.h:146:21: error: invalid type argument of unary '*' (have 'int')
     146 |         (__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));   \
         |                     ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/riscv/include/asm/cmpxchg.h:121:20: error: invalid type argument of unary '*' (have 'int')
     121 |         __typeof__(*(ptr)) __ret;                                       \
         |                    ^~~~~~
   arch/riscv/include/asm/cmpxchg.h:146:30: note: in expansion of macro '__arch_xchg'
     146 |         (__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));   \
         |                              ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/riscv/include/asm/cmpxchg.h:146:61: error: invalid type argument of unary '*' (have 'int')
     146 |         (__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));   \
         |                                                             ^~~~~~
   arch/riscv/include/asm/cmpxchg.h:122:17: note: in definition of macro '__arch_xchg'
     122 |         switch (size) {                                                 \
         |                 ^~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/riscv/include/asm/cmpxchg.h:126:47: error: invalid type argument of unary '*' (have 'int')
     126 |                         : "=r" (__ret), "+A" (*__ptr)                   \
         |                                               ^~~~~~
   arch/riscv/include/asm/cmpxchg.h:146:30: note: in expansion of macro '__arch_xchg'
     146 |         (__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));   \
         |                              ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   arch/riscv/include/asm/cmpxchg.h:133:47: error: invalid type argument of unary '*' (have 'int')
     133 |                         : "=r" (__ret), "+A" (*__ptr)                   \
         |                                               ^~~~~~
   arch/riscv/include/asm/cmpxchg.h:146:30: note: in expansion of macro '__arch_xchg'
     146 |         (__typeof__(*(ptr))) __arch_xchg((ptr), _x_, sizeof(*(ptr)));   \
         |                              ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:12:18: note: in expansion of macro 'arch_xchg'
      12 | #define raw_xchg arch_xchg
         |                  ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4716:9: note: in expansion of macro 'raw_xchg'
    4716 |         raw_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~
   kernel/kexec.c:122:29: note: in expansion of macro 'xchg'
     122 |                 kimage_free(xchg(&kexec_crash_image, NULL));
         |                             ^~~~
   kernel/kexec.c:130:22: error: invalid use of undefined type 'struct kimage'
     130 |                 image->preserve_context = 1;
         |                      ^~
>> kernel/kexec.c:132:15: error: implicit declaration of function 'machine_kexec_prepare' [-Werror=implicit-function-declaration]
     132 |         ret = machine_kexec_prepare(image);
         |               ^~~~~~~~~~~~~~~~~~~~~
>> kernel/kexec.c:140:15: error: implicit declaration of function 'kimage_crash_copy_vmcoreinfo'; did you mean 'arch_crash_save_vmcoreinfo'? [-Werror=implicit-function-declaration]
     140 |         ret = kimage_crash_copy_vmcoreinfo(image);
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |               arch_crash_save_vmcoreinfo
   kernel/kexec.c:145:56: error: invalid use of undefined type 'struct kimage'
     145 |                 ret = kimage_load_segment(image, &image->segment[i]);
         |                                                        ^~
>> kernel/kexec.c:152:15: error: implicit declaration of function 'machine_kexec_post_load' [-Werror=implicit-function-declaration]
     152 |         ret = machine_kexec_post_load(image);
         |               ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/kexec.c:161:17: error: implicit declaration of function 'arch_kexec_protect_crashkres' [-Werror=implicit-function-declaration]
     161 |                 arch_kexec_protect_crashkres();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/kexec.c: In function 'kexec_load_check':
   kernel/kexec.c:194:26: error: 'KEXEC_TYPE_CRASH' undeclared (first use in this function); did you mean 'KEXEC_ON_CRASH'?
     194 |                          KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
         |                          ^~~~~~~~~~~~~~~~
         |                          KEXEC_ON_CRASH
>> kernel/kexec.c:194:45: error: 'KEXEC_TYPE_DEFAULT' undeclared (first use in this function); did you mean 'KEXEC_ARCH_DEFAULT'?
     194 |                          KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
         |                                             ^~~~~~~~~~~~~~~~~~
         |                                             KEXEC_ARCH_DEFAULT
>> kernel/kexec.c:198:14: error: implicit declaration of function 'kexec_load_permitted' [-Werror=implicit-function-declaration]
     198 |         if (!kexec_load_permitted(image_type))
         |              ^~~~~~~~~~~~~~~~~~~~
>> kernel/kexec.c:218:22: error: 'KEXEC_FLAGS' undeclared (first use in this function); did you mean 'QC_FLAGS'?
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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for KEXEC
   Depends on [n]: ARCH_SUPPORTS_KEXEC [=n]
   Selected by [y]:
   - CRASH_DUMP [=y] && ARCH_SUPPORTS_CRASH_DUMP [=y]


vim +/phys_to_boot_phys +33 kernel/kexec.c

de90a6bcaede81 Minfei Huang       2015-11-06    8  
c59ede7b78db32 Randy Dunlap       2006-01-11    9  #include <linux/capability.h>
dc009d92435f99 Eric W. Biederman  2005-06-25  @10  #include <linux/mm.h>
dc009d92435f99 Eric W. Biederman  2005-06-25   11  #include <linux/file.h>
a210fd32a46bae Mimi Zohar         2018-07-13   12  #include <linux/security.h>
dc009d92435f99 Eric W. Biederman  2005-06-25   13  #include <linux/kexec.h>
8c5a1cf0ad3ac5 Andrew Morton      2008-08-15   14  #include <linux/mutex.h>
dc009d92435f99 Eric W. Biederman  2005-06-25   15  #include <linux/list.h>
dc009d92435f99 Eric W. Biederman  2005-06-25   16  #include <linux/syscalls.h>
a43cac0d9dc207 Dave Young         2015-09-09   17  #include <linux/vmalloc.h>
2965faa5e03d1e Dave Young         2015-09-09   18  #include <linux/slab.h>
dc009d92435f99 Eric W. Biederman  2005-06-25   19  
a43cac0d9dc207 Dave Young         2015-09-09   20  #include "kexec_internal.h"
a43cac0d9dc207 Dave Young         2015-09-09   21  
255aedd90e3e80 Vivek Goyal        2014-08-08   22  static int kimage_alloc_init(struct kimage **rimage, unsigned long entry,
72414d3f1d22fc Maneesh Soni       2005-06-25   23  			     unsigned long nr_segments,
5d700a0fd71ded Arnd Bergmann      2021-09-08   24  			     struct kexec_segment *segments,
255aedd90e3e80 Vivek Goyal        2014-08-08   25  			     unsigned long flags)
dc009d92435f99 Eric W. Biederman  2005-06-25   26  {
255aedd90e3e80 Vivek Goyal        2014-08-08   27  	int ret;
dc009d92435f99 Eric W. Biederman  2005-06-25   28  	struct kimage *image;
255aedd90e3e80 Vivek Goyal        2014-08-08   29  	bool kexec_on_panic = flags & KEXEC_ON_CRASH;
255aedd90e3e80 Vivek Goyal        2014-08-08   30  
255aedd90e3e80 Vivek Goyal        2014-08-08   31  	if (kexec_on_panic) {
255aedd90e3e80 Vivek Goyal        2014-08-08   32  		/* Verify we have a valid entry point */
43546d8669d62d Russell King       2016-08-02  @33  		if ((entry < phys_to_boot_phys(crashk_res.start)) ||
43546d8669d62d Russell King       2016-08-02   34  		    (entry > phys_to_boot_phys(crashk_res.end)))
255aedd90e3e80 Vivek Goyal        2014-08-08   35  			return -EADDRNOTAVAIL;
255aedd90e3e80 Vivek Goyal        2014-08-08   36  	}
dc009d92435f99 Eric W. Biederman  2005-06-25   37  
dc009d92435f99 Eric W. Biederman  2005-06-25   38  	/* Allocate and initialize a controlling structure */
dabe78628dd886 Vivek Goyal        2014-08-08   39  	image = do_kimage_alloc_init();
dabe78628dd886 Vivek Goyal        2014-08-08   40  	if (!image)
dabe78628dd886 Vivek Goyal        2014-08-08   41  		return -ENOMEM;
dabe78628dd886 Vivek Goyal        2014-08-08   42  
dabe78628dd886 Vivek Goyal        2014-08-08  @43  	image->start = entry;
5d700a0fd71ded Arnd Bergmann      2021-09-08   44  	image->nr_segments = nr_segments;
5d700a0fd71ded Arnd Bergmann      2021-09-08  @45  	memcpy(image->segment, segments, nr_segments * sizeof(*segments));
dabe78628dd886 Vivek Goyal        2014-08-08   46  
255aedd90e3e80 Vivek Goyal        2014-08-08   47  	if (kexec_on_panic) {
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   48  		/* Enable special crash kernel control page alloc policy. */
255aedd90e3e80 Vivek Goyal        2014-08-08   49  		image->control_page = crashk_res.start;
255aedd90e3e80 Vivek Goyal        2014-08-08  @50  		image->type = KEXEC_TYPE_CRASH;
255aedd90e3e80 Vivek Goyal        2014-08-08   51  	}
255aedd90e3e80 Vivek Goyal        2014-08-08   52  
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   53  	ret = sanity_check_segment_list(image);
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   54  	if (ret)
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   55  		goto out_free_image;
cdf4b3fa03bab1 Xunlei Pang        2016-01-20   56  
dc009d92435f99 Eric W. Biederman  2005-06-25   57  	/*
dc009d92435f99 Eric W. Biederman  2005-06-25   58  	 * Find a location for the control code buffer, and add it
dc009d92435f99 Eric W. Biederman  2005-06-25   59  	 * the vector of segments so that it's pages will also be
dc009d92435f99 Eric W. Biederman  2005-06-25   60  	 * counted as destination pages.
dc009d92435f99 Eric W. Biederman  2005-06-25   61  	 */
255aedd90e3e80 Vivek Goyal        2014-08-08   62  	ret = -ENOMEM;
dc009d92435f99 Eric W. Biederman  2005-06-25  @63  	image->control_code_page = kimage_alloc_control_pages(image,
163f6876f5c3ff Huang Ying         2008-08-15  @64  					   get_order(KEXEC_CONTROL_PAGE_SIZE));
dc009d92435f99 Eric W. Biederman  2005-06-25   65  	if (!image->control_code_page) {
e1bebcf41ed0aa Fabian Frederick   2014-06-06   66  		pr_err("Could not allocate control_code_buffer\n");
2965faa5e03d1e Dave Young         2015-09-09   67  		goto out_free_image;
dc009d92435f99 Eric W. Biederman  2005-06-25   68  	}
dd5f726076cc76 Vivek Goyal        2014-08-08   69  
2965faa5e03d1e Dave Young         2015-09-09   70  	if (!kexec_on_panic) {
2965faa5e03d1e Dave Young         2015-09-09   71  		image->swap_page = kimage_alloc_control_pages(image, 0);
2965faa5e03d1e Dave Young         2015-09-09  @72  		if (!image->swap_page) {
2965faa5e03d1e Dave Young         2015-09-09   73  			pr_err("Could not allocate swap buffer\n");
2965faa5e03d1e Dave Young         2015-09-09   74  			goto out_free_control_pages;
dc009d92435f99 Eric W. Biederman  2005-06-25   75  		}
dc009d92435f99 Eric W. Biederman  2005-06-25   76  	}
72414d3f1d22fc Maneesh Soni       2005-06-25   77  
2965faa5e03d1e Dave Young         2015-09-09   78  	*rimage = image;
2965faa5e03d1e Dave Young         2015-09-09   79  	return 0;
2965faa5e03d1e Dave Young         2015-09-09   80  out_free_control_pages:
2965faa5e03d1e Dave Young         2015-09-09  @81  	kimage_free_page_list(&image->control_pages);
2965faa5e03d1e Dave Young         2015-09-09   82  out_free_image:
2965faa5e03d1e Dave Young         2015-09-09   83  	kfree(image);
2965faa5e03d1e Dave Young         2015-09-09   84  	return ret;
dc009d92435f99 Eric W. Biederman  2005-06-25   85  }
dc009d92435f99 Eric W. Biederman  2005-06-25   86  
0eea08678ebe9f Minfei Huang       2016-05-23   87  static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
5d700a0fd71ded Arnd Bergmann      2021-09-08   88  		struct kexec_segment *segments, unsigned long flags)
0eea08678ebe9f Minfei Huang       2016-05-23   89  {
0eea08678ebe9f Minfei Huang       2016-05-23   90  	struct kimage **dest_image, *image;
0eea08678ebe9f Minfei Huang       2016-05-23   91  	unsigned long i;
0eea08678ebe9f Minfei Huang       2016-05-23   92  	int ret;
0eea08678ebe9f Minfei Huang       2016-05-23   93  
4b692e86161935 Arnd Bergmann      2021-09-08   94  	/*
4b692e86161935 Arnd Bergmann      2021-09-08   95  	 * Because we write directly to the reserved memory region when loading
05c6257433b721 Valentin Schneider 2022-06-30   96  	 * crash kernels we need a serialization here to prevent multiple crash
05c6257433b721 Valentin Schneider 2022-06-30   97  	 * kernels from attempting to load simultaneously.
4b692e86161935 Arnd Bergmann      2021-09-08   98  	 */
05c6257433b721 Valentin Schneider 2022-06-30   99  	if (!kexec_trylock())
4b692e86161935 Arnd Bergmann      2021-09-08  100  		return -EBUSY;
4b692e86161935 Arnd Bergmann      2021-09-08  101  
0eea08678ebe9f Minfei Huang       2016-05-23  102  	if (flags & KEXEC_ON_CRASH) {
0eea08678ebe9f Minfei Huang       2016-05-23 @103  		dest_image = &kexec_crash_image;
0eea08678ebe9f Minfei Huang       2016-05-23  104  		if (kexec_crash_image)
0eea08678ebe9f Minfei Huang       2016-05-23 @105  			arch_kexec_unprotect_crashkres();
0eea08678ebe9f Minfei Huang       2016-05-23  106  	} else {
0eea08678ebe9f Minfei Huang       2016-05-23 @107  		dest_image = &kexec_image;
0eea08678ebe9f Minfei Huang       2016-05-23  108  	}
0eea08678ebe9f Minfei Huang       2016-05-23  109  
0eea08678ebe9f Minfei Huang       2016-05-23  110  	if (nr_segments == 0) {
0eea08678ebe9f Minfei Huang       2016-05-23  111  		/* Uninstall image */
0eea08678ebe9f Minfei Huang       2016-05-23  112  		kimage_free(xchg(dest_image, NULL));
4b692e86161935 Arnd Bergmann      2021-09-08  113  		ret = 0;
4b692e86161935 Arnd Bergmann      2021-09-08  114  		goto out_unlock;
0eea08678ebe9f Minfei Huang       2016-05-23  115  	}
0eea08678ebe9f Minfei Huang       2016-05-23  116  	if (flags & KEXEC_ON_CRASH) {
0eea08678ebe9f Minfei Huang       2016-05-23  117  		/*
0eea08678ebe9f Minfei Huang       2016-05-23  118  		 * Loading another kernel to switch to if this one
0eea08678ebe9f Minfei Huang       2016-05-23  119  		 * crashes.  Free any current crash dump kernel before
0eea08678ebe9f Minfei Huang       2016-05-23  120  		 * we corrupt it.
0eea08678ebe9f Minfei Huang       2016-05-23  121  		 */
0eea08678ebe9f Minfei Huang       2016-05-23 @122  		kimage_free(xchg(&kexec_crash_image, NULL));
0eea08678ebe9f Minfei Huang       2016-05-23  123  	}
0eea08678ebe9f Minfei Huang       2016-05-23  124  
0eea08678ebe9f Minfei Huang       2016-05-23  125  	ret = kimage_alloc_init(&image, entry, nr_segments, segments, flags);
0eea08678ebe9f Minfei Huang       2016-05-23  126  	if (ret)
4b692e86161935 Arnd Bergmann      2021-09-08  127  		goto out_unlock;
0eea08678ebe9f Minfei Huang       2016-05-23  128  
0eea08678ebe9f Minfei Huang       2016-05-23  129  	if (flags & KEXEC_PRESERVE_CONTEXT)
0eea08678ebe9f Minfei Huang       2016-05-23  130  		image->preserve_context = 1;
0eea08678ebe9f Minfei Huang       2016-05-23  131  
0eea08678ebe9f Minfei Huang       2016-05-23 @132  	ret = machine_kexec_prepare(image);
0eea08678ebe9f Minfei Huang       2016-05-23  133  	if (ret)
0eea08678ebe9f Minfei Huang       2016-05-23  134  		goto out;
0eea08678ebe9f Minfei Huang       2016-05-23  135  
1229384f5b856d Xunlei Pang        2017-07-12  136  	/*
1229384f5b856d Xunlei Pang        2017-07-12  137  	 * Some architecture(like S390) may touch the crash memory before
1229384f5b856d Xunlei Pang        2017-07-12  138  	 * machine_kexec_prepare(), we must copy vmcoreinfo data after it.
1229384f5b856d Xunlei Pang        2017-07-12  139  	 */
1229384f5b856d Xunlei Pang        2017-07-12 @140  	ret = kimage_crash_copy_vmcoreinfo(image);
1229384f5b856d Xunlei Pang        2017-07-12  141  	if (ret)
1229384f5b856d Xunlei Pang        2017-07-12  142  		goto out;
1229384f5b856d Xunlei Pang        2017-07-12  143  
0eea08678ebe9f Minfei Huang       2016-05-23  144  	for (i = 0; i < nr_segments; i++) {
0eea08678ebe9f Minfei Huang       2016-05-23 @145  		ret = kimage_load_segment(image, &image->segment[i]);
0eea08678ebe9f Minfei Huang       2016-05-23  146  		if (ret)
0eea08678ebe9f Minfei Huang       2016-05-23  147  			goto out;
0eea08678ebe9f Minfei Huang       2016-05-23  148  	}
0eea08678ebe9f Minfei Huang       2016-05-23  149  
0eea08678ebe9f Minfei Huang       2016-05-23  150  	kimage_terminate(image);
0eea08678ebe9f Minfei Huang       2016-05-23  151  
de68e4daea9084 Pavel Tatashin     2019-12-04 @152  	ret = machine_kexec_post_load(image);
de68e4daea9084 Pavel Tatashin     2019-12-04  153  	if (ret)
de68e4daea9084 Pavel Tatashin     2019-12-04  154  		goto out;
de68e4daea9084 Pavel Tatashin     2019-12-04  155  
0eea08678ebe9f Minfei Huang       2016-05-23  156  	/* Install the new kernel and uninstall the old */
0eea08678ebe9f Minfei Huang       2016-05-23  157  	image = xchg(dest_image, image);
0eea08678ebe9f Minfei Huang       2016-05-23  158  
0eea08678ebe9f Minfei Huang       2016-05-23  159  out:
0eea08678ebe9f Minfei Huang       2016-05-23  160  	if ((flags & KEXEC_ON_CRASH) && kexec_crash_image)
0eea08678ebe9f Minfei Huang       2016-05-23 @161  		arch_kexec_protect_crashkres();
0eea08678ebe9f Minfei Huang       2016-05-23  162  
0eea08678ebe9f Minfei Huang       2016-05-23  163  	kimage_free(image);
4b692e86161935 Arnd Bergmann      2021-09-08  164  out_unlock:
05c6257433b721 Valentin Schneider 2022-06-30  165  	kexec_unlock();
0eea08678ebe9f Minfei Huang       2016-05-23  166  	return ret;
0eea08678ebe9f Minfei Huang       2016-05-23  167  }
0eea08678ebe9f Minfei Huang       2016-05-23  168  
dc009d92435f99 Eric W. Biederman  2005-06-25  169  /*
dc009d92435f99 Eric W. Biederman  2005-06-25  170   * Exec Kernel system call: for obvious reasons only root may call it.
dc009d92435f99 Eric W. Biederman  2005-06-25  171   *
dc009d92435f99 Eric W. Biederman  2005-06-25  172   * This call breaks up into three pieces.
dc009d92435f99 Eric W. Biederman  2005-06-25  173   * - A generic part which loads the new kernel from the current
dc009d92435f99 Eric W. Biederman  2005-06-25  174   *   address space, and very carefully places the data in the
dc009d92435f99 Eric W. Biederman  2005-06-25  175   *   allocated pages.
dc009d92435f99 Eric W. Biederman  2005-06-25  176   *
dc009d92435f99 Eric W. Biederman  2005-06-25  177   * - A generic part that interacts with the kernel and tells all of
dc009d92435f99 Eric W. Biederman  2005-06-25  178   *   the devices to shut down.  Preventing on-going dmas, and placing
dc009d92435f99 Eric W. Biederman  2005-06-25  179   *   the devices in a consistent state so a later kernel can
dc009d92435f99 Eric W. Biederman  2005-06-25  180   *   reinitialize them.
dc009d92435f99 Eric W. Biederman  2005-06-25  181   *
dc009d92435f99 Eric W. Biederman  2005-06-25  182   * - A machine specific part that includes the syscall number
002ace782cc8ee Geert Uytterhoeven 2013-09-15  183   *   and then copies the image to it's final destination.  And
dc009d92435f99 Eric W. Biederman  2005-06-25  184   *   jumps into the image at entry.
dc009d92435f99 Eric W. Biederman  2005-06-25  185   *
dc009d92435f99 Eric W. Biederman  2005-06-25  186   * kexec does not sync, or unmount filesystems so if you need
dc009d92435f99 Eric W. Biederman  2005-06-25  187   * that to happen you need to do that yourself.
dc009d92435f99 Eric W. Biederman  2005-06-25  188   */
8c5a1cf0ad3ac5 Andrew Morton      2008-08-15  189  
6b27aef09fea32 Dominik Brodowski  2018-03-17  190  static inline int kexec_load_check(unsigned long nr_segments,
6b27aef09fea32 Dominik Brodowski  2018-03-17  191  				   unsigned long flags)
dc009d92435f99 Eric W. Biederman  2005-06-25  192  {
a42aaad2e47b23 Ricardo Ribalda    2023-01-04  193  	int image_type = (flags & KEXEC_ON_CRASH) ?
a42aaad2e47b23 Ricardo Ribalda    2023-01-04 @194  			 KEXEC_TYPE_CRASH : KEXEC_TYPE_DEFAULT;
a210fd32a46bae Mimi Zohar         2018-07-13  195  	int result;
a210fd32a46bae Mimi Zohar         2018-07-13  196  
dc009d92435f99 Eric W. Biederman  2005-06-25  197  	/* We only trust the superuser with rebooting the system. */
a42aaad2e47b23 Ricardo Ribalda    2023-01-04 @198  	if (!kexec_load_permitted(image_type))
dc009d92435f99 Eric W. Biederman  2005-06-25  199  		return -EPERM;
dc009d92435f99 Eric W. Biederman  2005-06-25  200  
a210fd32a46bae Mimi Zohar         2018-07-13  201  	/* Permit LSMs and IMA to fail the kexec */
b64fcae74b6d69 Kees Cook          2020-10-02  202  	result = security_kernel_load_data(LOADING_KEXEC_IMAGE, false);
a210fd32a46bae Mimi Zohar         2018-07-13  203  	if (result < 0)
a210fd32a46bae Mimi Zohar         2018-07-13  204  		return result;
a210fd32a46bae Mimi Zohar         2018-07-13  205  
7d31f4602f8d36 Matthew Garrett    2019-08-19  206  	/*
7d31f4602f8d36 Matthew Garrett    2019-08-19  207  	 * kexec can be used to circumvent module loading restrictions, so
7d31f4602f8d36 Matthew Garrett    2019-08-19  208  	 * prevent loading in that case
7d31f4602f8d36 Matthew Garrett    2019-08-19  209  	 */
7d31f4602f8d36 Matthew Garrett    2019-08-19  210  	result = security_locked_down(LOCKDOWN_KEXEC);
7d31f4602f8d36 Matthew Garrett    2019-08-19  211  	if (result)
7d31f4602f8d36 Matthew Garrett    2019-08-19  212  		return result;
7d31f4602f8d36 Matthew Garrett    2019-08-19  213  
dc009d92435f99 Eric W. Biederman  2005-06-25  214  	/*
dc009d92435f99 Eric W. Biederman  2005-06-25  215  	 * Verify we have a legal set of flags
dc009d92435f99 Eric W. Biederman  2005-06-25  216  	 * This leaves us room for future extensions.
dc009d92435f99 Eric W. Biederman  2005-06-25  217  	 */
dc009d92435f99 Eric W. Biederman  2005-06-25 @218  	if ((flags & KEXEC_FLAGS) != (flags & ~KEXEC_ARCH_MASK))
dc009d92435f99 Eric W. Biederman  2005-06-25  219  		return -EINVAL;
dc009d92435f99 Eric W. Biederman  2005-06-25  220  
dc009d92435f99 Eric W. Biederman  2005-06-25  221  	/* Put an artificial cap on the number
dc009d92435f99 Eric W. Biederman  2005-06-25  222  	 * of segments passed to kexec_load.
dc009d92435f99 Eric W. Biederman  2005-06-25  223  	 */
dc009d92435f99 Eric W. Biederman  2005-06-25  224  	if (nr_segments > KEXEC_SEGMENT_MAX)
dc009d92435f99 Eric W. Biederman  2005-06-25  225  		return -EINVAL;
dc009d92435f99 Eric W. Biederman  2005-06-25  226  
6b27aef09fea32 Dominik Brodowski  2018-03-17  227  	return 0;
6b27aef09fea32 Dominik Brodowski  2018-03-17  228  }
6b27aef09fea32 Dominik Brodowski  2018-03-17  229  

:::::: The code at line 33 was first introduced by commit
:::::: 43546d8669d62d75fa69ca9a45d2f586665f56bd kexec: allow architectures to override boot mapping

:::::: TO: Russell King <rmk+kernel@arm.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
