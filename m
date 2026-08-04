Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9643ACF1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832528; cv=none; b=pvO8KLv9W6EB8mm7gz73GeiBoZF40acxINK9TUobiAlK7zw/PPyvY6VkpdHGBeKdBbepSaXVzzO+BTbYrDnlTu4Wq51Y58Yz3zSrO26R6jcxL2iJhaH/rx7MEfOqASgYIu5FMiXLYbmZB7K1oot3B/47cgMNbX9MWHu0L1HSo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832528; c=relaxed/simple;
	bh=zZ76Vhq0FngAb7GLKLtr3xN22ldD0kgYOPTfoMjVOMA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CqvnNDeqbafHs6EzQRHFxNUWiBXuY40Ise5fDk61ixXrjeD0ZCdzmJP2/O0Gtt65ykQW/DanocCTh620GlzB0jVS+x+IrS47zLxiTRvc3A4lHfkjXnF7Fh3VBOxmWOh5qwoYoqGg5EiaNK5z4RasJT75GW0tt/Nv1zhTzi+l8ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQy2EYoo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQy2EYoo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785832527; x=1817368527;
  h=date:from:to:cc:subject:message-id;
  bh=zZ76Vhq0FngAb7GLKLtr3xN22ldD0kgYOPTfoMjVOMA=;
  b=PQy2EYoom+WhC2tL49aIpp036MOjHJBJfB7DeY8M4zt7kjGrpa/FhvDY
   lj/XzVRGObTtG7bON2vahr4umFlAXG4hfed03jU4ARl4NmWCz/aH1Hw4X
   aknlabdi3vg+qTYdzjyeW1WQGMOIkZ5zmqEr7fm4rAyvVOMCURJvrsdJ0
   ZORJ3XGti2W5jitfKH4DkZvR4ACL+dTTlt98foW9i54Q8fTMsRJlOMEUC
   eWQTogD8W96jV6p+0vsNFgwWJxAjNEZC/dLgZQKQaFgFBiZdzycc/vOvy
   xKNBsJpA7Q5eFVTz0ujPKQMhCsCc3HhhBhEpOa0RXi75ccjqSWOdgJVOT
   A==;
X-CSE-ConnectionGUID: uP7pl7sjSLG3AEKN5Aq8zQ==
X-CSE-MsgGUID: 7GZd2kUbSAincB6U/HJ1Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97029688"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97029688"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 01:35:26 -0700
X-CSE-ConnectionGUID: /ZFNBsRsQnOlPkrIZba7bQ==
X-CSE-MsgGUID: vOvTrJ9VSHqM6CbL3E32GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="260845608"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Aug 2026 01:35:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrAcM-000000009Qc-2pF1;
	Tue, 04 Aug 2026 08:35:22 +0000
Date: Tue, 04 Aug 2026 16:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [vbabka:objext_split-v3-bench 7/20] mm/slub.c:9395:40:
 error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean
 'cpu_stats'?
Message-ID: <202608041612.hwLn0CQD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split-v3-bench
head:   00a963c6f8935eea26a26878ee6ddeedb456d5ba
commit: bef53663aa280f0a087ff3e10344c5734cf357da [7/20] slub_kunit: sheaves microbenchmark
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260804/202608041612.hwLn0CQD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041612.hwLn0CQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041612.hwLn0CQD-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:9,
                    from arch/alpha/include/asm/percpu.h:16,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from mm/slub.c:15:
   mm/slub.c: In function 'get_stat_sum':
>> mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                                        ^~~~~~~~
   include/linux/percpu-defs.h:221:54: note: in definition of macro '__verify_pcpu_ptr'
     221 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   mm/slub.c:9395:25: note: in expansion of macro 'per_cpu_ptr'
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                         ^~~~~~~~~~~
   In file included from include/linux/compiler_types.h:173,
                    from <command-line>:
>> mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                                        ^~~~~~~~
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   mm/slub.c:9395:25: note: in expansion of macro 'per_cpu_ptr'
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                         ^~~~~~~~~~~
>> mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                                        ^~~~~~~~
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   mm/slub.c:9395:25: note: in expansion of macro 'per_cpu_ptr'
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                         ^~~~~~~~~~~
>> mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                                        ^~~~~~~~
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:226:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     226 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   mm/slub.c:9395:25: note: in expansion of macro 'per_cpu_ptr'
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                         ^~~~~~~~~~~
>> mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                                        ^~~~~~~~
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:235:20: note: in expansion of macro 'PERCPU_PTR'
     235 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:240:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     240 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   mm/slub.c:9395:25: note: in expansion of macro 'per_cpu_ptr'
    9395 |                 sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
         |                         ^~~~~~~~~~~
   mm/slub.c:9389:72: warning: parameter 'si' set but not used [-Wunused-but-set-parameter=]
    9389 | static unsigned long get_stat_sum(struct kmem_cache *s, enum stat_item si)
         |                                                         ~~~~~~~~~~~~~~~^~


vim +9395 mm/slub.c

  9388	
  9389	static unsigned long get_stat_sum(struct kmem_cache *s, enum stat_item si)
  9390	{
  9391		unsigned long sum = 0;
  9392		int cpu;
  9393	
  9394		for_each_online_cpu(cpu) {
> 9395			sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
  9396		}
  9397	
  9398		return sum;
  9399	}
  9400	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
