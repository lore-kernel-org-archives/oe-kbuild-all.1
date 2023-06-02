Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED40ED5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jun 2023 04:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685680569; x=1717216569;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DNSwYoJ8ng4VrpZ9ppD50mx2oOZS5MgcwaO0B9VBqCk=;
  b=icF08C/TgzX+5AGYCyrGyM6rWb9LXEJ3lAhxppzDJ28bopZT1TWWTVYY
   wCo9GcvuM1dD+I6iE5LgMirSlrCe1VlZbB0WwpckOcwM1HqZ8zgrchbbm
   aq08+R5DtXS2DzX7PyqCPGCxMdVhzEjPatB/BDhAJfsPqql8E8sGxhMRB
   aQkuY/PyqW+pEKfcIRZhPAshbcqnyKXKrzQuJxPE7PppA1u4orJVLHsoc
   7rvXvpBYxhG2aHYeAfqx807hjGTLGyxOGm8Tiog7k+pYn6QYqjXEEeR7J
   LAlHzYtuBXNw0ebDXLemsruJAszVVtIJDinWKkvzqVLQWRX7G0n9I1wOc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="442142066"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="442142066"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 21:36:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="740642064"
X-IronPort-AV: E=Sophos;i="6.00,211,1681196400"; 
   d="scan'208";a="740642064"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 01 Jun 2023 21:36:07 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4wWE-00004U-1s;
	Fri, 02 Jun 2023 04:36:06 +0000
Date: Fri, 2 Jun 2023 12:35:41 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:mm/mremap-pmd-warning-3 6/6]
 include/linux/atomic/atomic-instrumented.h:1885:33: warning: passing
 argument 1 of 'instrument_atomic_write' makes pointer from integer without a
 cast
Message-ID: <202306021222.mN7f9j2K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git mm/mremap-pmd-warning-3
head:   37d3506ee4cd098f2c741051cbab4328f95ae4b7
commit: 37d3506ee4cd098f2c741051cbab4328f95ae4b7 [6/6] debug: prints in code and tests
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230602/202306021222.mN7f9j2K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=37d3506ee4cd098f2c741051cbab4328f95ae4b7
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern mm/mremap-pmd-warning-3
        git checkout 37d3506ee4cd098f2c741051cbab4328f95ae4b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306021222.mN7f9j2K-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                     ^~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:360:38: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     360 | static inline pte_t pte_mkhuge(pte_t pte)
         |                                      ^~~
   arch/x86/include/asm/pgtable.h:360:21: error: return type defaults to 'int' [-Werror=implicit-int]
     360 | static inline pte_t pte_mkhuge(pte_t pte)
         |                     ^~~~~~~~~~
   arch/x86/include/asm/pgtable.h:365:39: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     365 | static inline pte_t pte_clrhuge(pte_t pte)
         |                                       ^~~
   arch/x86/include/asm/pgtable.h:365:21: error: return type defaults to 'int' [-Werror=implicit-int]
     365 | static inline pte_t pte_clrhuge(pte_t pte)
         |                     ^~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:370:40: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     370 | static inline pte_t pte_mkglobal(pte_t pte)
         |                                        ^~~
   arch/x86/include/asm/pgtable.h:370:21: error: return type defaults to 'int' [-Werror=implicit-int]
     370 | static inline pte_t pte_mkglobal(pte_t pte)
         |                     ^~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:375:41: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     375 | static inline pte_t pte_clrglobal(pte_t pte)
         |                                         ^~~
   arch/x86/include/asm/pgtable.h:375:21: error: return type defaults to 'int' [-Werror=implicit-int]
     375 | static inline pte_t pte_clrglobal(pte_t pte)
         |                     ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:380:41: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     380 | static inline pte_t pte_mkspecial(pte_t pte)
         |                                         ^~~
   arch/x86/include/asm/pgtable.h:380:21: error: return type defaults to 'int' [-Werror=implicit-int]
     380 | static inline pte_t pte_mkspecial(pte_t pte)
         |                     ^~~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:385:40: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     385 | static inline pte_t pte_mkdevmap(pte_t pte)
         |                                        ^~~
   arch/x86/include/asm/pgtable.h:385:21: error: return type defaults to 'int' [-Werror=implicit-int]
     385 | static inline pte_t pte_mkdevmap(pte_t pte)
         |                     ^~~~~~~~~~~~
   arch/x86/include/asm/pgtable.h:594:21: error: return type defaults to 'int' [-Werror=implicit-int]
     594 | static inline pte_t pfn_pte(unsigned long page_nr, pgprot_t pgprot)
         |                     ^~~~~~~
   arch/x86/include/asm/pgtable.h:626:38: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
     626 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                      ^~~
   arch/x86/include/asm/pgtable.h:626:21: error: return type defaults to 'int' [-Werror=implicit-int]
     626 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                     ^~~~~~~~~~
   arch/x86/include/asm/pgtable.h:702:8: error: type defaults to 'int' in declaration of 'populate_extra_pte' [-Werror=implicit-int]
     702 | pte_t *populate_extra_pte(unsigned long vaddr);
         |        ^~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/pgtable_32.h:38,
                    from arch/x86/include/asm/pgtable.h:729:
   arch/x86/include/asm/pgtable-2level.h:15:42: error: type defaults to 'int' in declaration of 'ptep' [-Werror=implicit-int]
      15 | static inline void native_set_pte(pte_t *ptep , pte_t pte)
         |                                          ^~~~
   arch/x86/include/asm/pgtable-2level.h:15:55: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
      15 | static inline void native_set_pte(pte_t *ptep , pte_t pte)
         |                                                       ^~~
   arch/x86/include/asm/pgtable-2level.h:29:49: error: type defaults to 'int' in declaration of 'ptep' [-Werror=implicit-int]
      29 | static inline void native_set_pte_atomic(pte_t *ptep, pte_t pte)
         |                                                 ^~~~
   arch/x86/include/asm/pgtable-2level.h:29:61: error: type defaults to 'int' in declaration of 'pte' [-Werror=implicit-int]
      29 | static inline void native_set_pte_atomic(pte_t *ptep, pte_t pte)
         |                                                             ^~~
   arch/x86/include/asm/pgtable-2level.h:44:64: error: type defaults to 'int' in declaration of 'xp' [-Werror=implicit-int]
      44 |                                     unsigned long addr, pte_t *xp)
         |                                                                ^~
   arch/x86/include/asm/pgtable-2level.h:50:54: error: type defaults to 'int' in declaration of 'xp' [-Werror=implicit-int]
      50 | static inline pte_t native_ptep_get_and_clear(pte_t *xp)
         |                                                      ^~
   arch/x86/include/asm/pgtable-2level.h:50:21: error: return type defaults to 'int' [-Werror=implicit-int]
      50 | static inline pte_t native_ptep_get_and_clear(pte_t *xp)
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h: In function 'native_ptep_get_and_clear':
   arch/x86/include/asm/pgtable-2level.h:52:30: error: request for member 'pte_low' in something not a structure or union
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                              ^~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   arch/x86/include/asm/pgtable-2level.h:52:30: error: request for member 'pte_low' in something not a structure or union
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                              ^~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   include/linux/atomic/atomic-instrumented.h:1885:50: error: invalid type argument of unary '*' (have 'int')
    1885 |         instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                                  ^~~~~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
>> include/linux/atomic/atomic-instrumented.h:1885:33: warning: passing argument 1 of 'instrument_atomic_write' makes pointer from integer without a cast [-Wint-conversion]
    1885 |         instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
         |                                 ^~~~~~~~
         |                                 |
         |                                 int
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   In file included from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/x86/include/asm/bitops.h:424,
                    from include/linux/bitops.h:68,
                    from include/linux/kernel.h:22,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6:
   include/linux/instrumented.h:85:74: note: expected 'const volatile void *' but argument is of type 'int'
      85 | static __always_inline void instrument_atomic_write(const volatile void *v, size_t size)
         |                                                     ~~~~~~~~~~~~~~~~~~~~~^
   arch/x86/include/asm/cmpxchg.h:44:29: error: invalid type argument of unary '*' (have 'int')
      44 |                 __typeof__ (*(ptr)) __ret = (arg);                      \
         |                             ^~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   arch/x86/include/asm/cmpxchg.h:45:32: error: invalid type argument of unary '*' (have 'int')
      45 |                 switch (sizeof(*(ptr))) {                               \
         |                                ^~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   arch/x86/include/asm/cmpxchg.h:48:61: error: invalid type argument of unary '*' (have 'int')
      48 |                                       : "+q" (__ret), "+m" (*(ptr))     \
         |                                                             ^~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   arch/x86/include/asm/cmpxchg.h:53:61: error: invalid type argument of unary '*' (have 'int')
      53 |                                       : "+r" (__ret), "+m" (*(ptr))     \
         |                                                             ^~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   arch/x86/include/asm/cmpxchg.h:58:61: error: invalid type argument of unary '*' (have 'int')
      58 |                                       : "+r" (__ret), "+m" (*(ptr))     \
         |                                                             ^~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^
   arch/x86/include/asm/cmpxchg.h:78:33: note: in expansion of macro '__xchg_op'
      78 | #define arch_xchg(ptr, v)       __xchg_op((ptr), (v), xchg, "")
         |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:1886:9: note: in expansion of macro 'arch_xchg'
    1886 |         arch_xchg(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~
   arch/x86/include/asm/pgtable-2level.h:52:22: note: in expansion of macro 'xchg'
      52 |         return __pte(xchg(&xp->pte_low, 0));
         |                      ^~~~
   arch/x86/include/asm/cmpxchg.h:63:61: error: invalid type argument of unary '*' (have 'int')
      63 |                                       : "+r" (__ret), "+m" (*(ptr))     \
         |                                                             ^~~~~~
   arch/x86/include/asm/pgtable.h:118:41: note: in definition of macro '__pte'
     118 | #define __pte(x)        native_make_pte(x)
         |                                         ^


vim +/instrument_atomic_write +1885 include/linux/atomic/atomic-instrumented.h

67d1b0de258ad0 include/linux/atomic/atomic-instrumented.h Mark Rutland 2021-07-13  1880  
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  1881  #define xchg(ptr, ...) \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  1882  ({ \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  1883  	typeof(ptr) __ai_ptr = (ptr); \
e87c4f6642f496 include/linux/atomic/atomic-instrumented.h Marco Elver  2021-11-30  1884  	kcsan_mb(); \
ed8af2e4d2a71b include/asm-generic/atomic-instrumented.h  Marco Elver  2020-01-21 @1885  	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  1886  	arch_xchg(__ai_ptr, __VA_ARGS__); \
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  1887  })
aa525d063851a9 include/asm-generic/atomic-instrumented.h  Mark Rutland 2018-09-04  1888  

:::::: The code at line 1885 was first introduced by commit
:::::: ed8af2e4d2a71bd58f5776b7e5a477d136e32be4 asm-generic, atomic-instrumented: Use generic instrumented.h

:::::: TO: Marco Elver <elver@google.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
