Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E610714F90
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4TbwX1W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697709248; x=1729245248;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eWMuEnIoaq2jvsNHZnZBW3L1ASqmPmObE//wk/vcSe0=;
  b=G4TbwX1WCJaV6y0aErQODXBFnPepEtKp7m81BPkimd7g8TLAYnxEXkEo
   kS19rTyF1Z95U37QR3R71lqd1++BOLLNBu5x1pC9WK3DUfirmaE/WI1Z5
   PdzhHfDZ3EMPoNEDSLRxBqixo7SM2buX4X6iicM6zuNV4lRVYb03hmQgE
   +tcs0KfNOMsqYSfChx0fE8H0ROKZHYlrYfXmBdHnixLp4yVmeapdvtsU1
   4qBidO3pkMYAyMlfs4cXz2IVcwFOveNW1w2mkpN7Gj8KCsAJwrO9h2J6+
   7Lf7h0Wkprf62FlSg0ukAdqxo/yn/JWl+XbNZiBL2DY9YypgnUxL0UNev
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365565815"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="365565815"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 02:54:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="900681482"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="900681482"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 19 Oct 2023 02:51:57 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtPj7-0001we-2P;
	Thu, 19 Oct 2023 09:54:01 +0000
Date: Thu, 19 Oct 2023 17:53:11 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/ilb-no-needs-kick 1/3]
 arch/mips/include/asm/cmpxchg.h:179:27: warning: passing argument 1 of
 '__cmpxchg' makes pointer from integer without a cast
Message-ID: <202310191735.mbmfxRrW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/ilb-no-needs-kick
head:   6a27fea4c21f111a2cb84908a209092104ed18fa
commit: 52bc56376f3116e32c1cd4f9e00b9fff380ec0c3 [1/3] sched/nohz: Update nohz.next_balance directly without IPIs (v2)
config: mips-xway_defconfig (https://download.01.org/0day-ci/archive/20231019/202310191735.mbmfxRrW-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310191735.mbmfxRrW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310191735.mbmfxRrW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:191:34: error: initialization of 'int *' from incompatible pointer type 'long unsigned int *' [-Werror=incompatible-pointer-types]
     191 |         typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
         |                                  ^
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   In file included from arch/mips/include/asm/atomic.h:23,
                    from include/linux/atomic.h:7:
   arch/mips/include/asm/cmpxchg.h:186:20: error: invalid type argument of unary '*' (have 'int')
     186 |         __typeof__(*(ptr)) __res;                                       \
         |                    ^~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/mips/include/asm/cmpxchg.h:178:22: error: invalid type argument of unary '*' (have 'int')
     178 |         ((__typeof__(*(ptr)))                                           \
         |                      ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/mips/include/asm/cmpxchg.h:180:54: error: invalid type argument of unary '*' (have 'int')
     180 |                           (unsigned long)(__typeof__(*(ptr)))(old),     \
         |                                                      ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/mips/include/asm/cmpxchg.h:181:54: error: invalid type argument of unary '*' (have 'int')
     181 |                           (unsigned long)(__typeof__(*(ptr)))(new),     \
         |                                                      ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/mips/include/asm/cmpxchg.h:182:34: error: invalid type argument of unary '*' (have 'int')
     182 |                           sizeof(*(ptr))))
         |                                  ^~~~~~
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
>> arch/mips/include/asm/cmpxchg.h:179:27: warning: passing argument 1 of '__cmpxchg' makes pointer from integer without a cast [-Wint-conversion]
     179 |                 __cmpxchg((ptr),                                        \
         |                           ^~~~~
         |                           |
         |                           int
   arch/mips/include/asm/cmpxchg.h:196:17: note: in expansion of macro 'arch_cmpxchg_local'
     196 |         __res = arch_cmpxchg_local((ptr), (old), (new));                \
         |                 ^~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
      55 | #define raw_cmpxchg arch_cmpxchg
         |                     ^~~~~~~~~~~~
   include/linux/atomic/atomic-arch-fallback.h:192:16: note: in expansion of macro 'raw_cmpxchg'
     192 |         ___r = raw_cmpxchg((_ptr), ___o, (_new)); \
         |                ^~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4838:9: note: in expansion of macro 'raw_try_cmpxchg'
    4838 |         raw_try_cmpxchg(__ai_ptr, __ai_oldp, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~
   kernel/sched/fair.c:11307:18: note: in expansion of macro 'try_cmpxchg'
   11307 |         } while(!try_cmpxchg(&nohz.next_balance, &nohz_next_balance,
         |                  ^~~~~~~~~~~
   arch/mips/include/asm/cmpxchg.h:152:40: note: expected 'volatile void *' but argument is of type 'int'
     152 | unsigned long __cmpxchg(volatile void *ptr, unsigned long old,
         |                         ~~~~~~~~~~~~~~~^~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:12831:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12831 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12833:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12833 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12838:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12838 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:12840:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12840 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__cmpxchg +179 arch/mips/include/asm/cmpxchg.h

8263db4d776844 Paul Burton  2017-06-09  176  
c7b5fd6faa1dc6 Mark Rutland 2021-05-25  177  #define arch_cmpxchg_local(ptr, old, new)				\
8263db4d776844 Paul Burton  2017-06-09  178  	((__typeof__(*(ptr)))						\
8263db4d776844 Paul Burton  2017-06-09 @179  		__cmpxchg((ptr),					\
8263db4d776844 Paul Burton  2017-06-09  180  			  (unsigned long)(__typeof__(*(ptr)))(old),	\
8263db4d776844 Paul Burton  2017-06-09  181  			  (unsigned long)(__typeof__(*(ptr)))(new),	\
8263db4d776844 Paul Burton  2017-06-09  182  			  sizeof(*(ptr))))
8263db4d776844 Paul Burton  2017-06-09  183  

:::::: The code at line 179 was first introduced by commit
:::::: 8263db4d7768448cb06adbbdd14c613a1ea09830 MIPS: cmpxchg: Implement __cmpxchg() as a function

:::::: TO: Paul Burton <paul.burton@imgtec.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
