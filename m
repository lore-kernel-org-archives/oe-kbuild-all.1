Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A873B6BF1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 21:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785791659; cv=none; b=pBMtzzSYzj7LMygFROkQewGfgOPN9bYscF0RkLncYMzeIcUGUvEK5kXCAkNjljbKhnBig/8J/F+v/0ojfehv/fjlj5ReCaOtpcjUQInKVmoql/DZqhwD3VrcH2BApUPHO3KXtfS2FaPGBImy0bwZXe/y5oRiZXnAt+Gr7t2aGz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785791659; c=relaxed/simple;
	bh=/RRAIYi5gdJAE6MjxyMsJMfJEVplFnBmQkFdJ+33GNo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C+rcdv3F/JF24yNO64rthpIO5la2eTDmufJWomeabW92NYnOMU8Zd9FMSZKNrgwGv+WcpubVsVweu6mzfFP8lziFDc9bMZleEPyo86P21lk1NJ2+gemKOOvcmjX1v+aUJKBF9MB82BZuJkTbVnr2gsR9vdEl1l7XPsh1oHWjUj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ei6ReDT5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ei6ReDT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785791657; x=1817327657;
  h=date:from:to:cc:subject:message-id;
  bh=/RRAIYi5gdJAE6MjxyMsJMfJEVplFnBmQkFdJ+33GNo=;
  b=ei6ReDT5XcoQS7F0fJ+yrGSZmgzuZDMWFYGp3wz6y1LIC30WnYqyBfY5
   yuHw+Kn9ewE04HwUktuOz2mtR4sNQztyx1YNB8ufWXpN7surzyaOqOJC+
   wBPUpmZ+ym7RgoaN37bH3rzIdJoWIY9j+flzpObCr/gFbp2jilpO4cINH
   gTdCEjPD4/7h++E1bkLTgnmbS1uR3NyGqZIvMVdfZjoEu3QqJnPpvyz2l
   sfAXu/w9GNYYy9ZHivNP7rc5B8Y9q1ACdXqWDvgf//1ro7OtBnr8wUKbS
   JdEW8F1FTH7jOFkYq00vyAmLGg037s3LCMZ+uo1WegDQhr3MUOuuXnCHP
   A==;
X-CSE-ConnectionGUID: QWcb5geFQd+w7+QF3ITJgg==
X-CSE-MsgGUID: 3H9iBDD4TDCC1amKqx7HEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="96988867"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="96988867"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 14:14:16 -0700
X-CSE-ConnectionGUID: mOI0ulVKQFOI975n1Pig1Q==
X-CSE-MsgGUID: lx7z2mMITX2IySiPzrdCqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="291266052"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Aug 2026 14:14:15 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqzzA-00000000800-3YqU;
	Mon, 03 Aug 2026 21:14:12 +0000
Date: Tue, 04 Aug 2026 05:13:27 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Subject: [vbabka:objext_split-v3-bench 7/20] mm/slub.c:9389:72:
 warning: parameter 'si' set but not used
Message-ID: <202608040412.uHCMpAwJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git objext_split-v3-bench
head:   00a963c6f8935eea26a26878ee6ddeedb456d5ba
commit: bef53663aa280f0a087ff3e10344c5734cf357da [7/20] slub_kunit: sheaves microbenchmark
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20260804/202608040412.uHCMpAwJ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608040412.uHCMpAwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608040412.uHCMpAwJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/percpu.h:9,
                    from arch/alpha/include/asm/percpu.h:16,
                    from include/linux/irqflags.h:19,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from mm/slub.c:15:
   mm/slub.c: In function 'get_stat_sum':
   mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
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
   mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
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
   mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
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
   mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
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
   mm/slub.c:9395:40: error: 'struct kmem_cache' has no member named 'cpu_slab'; did you mean 'cpu_stats'?
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
>> mm/slub.c:9389:72: warning: parameter 'si' set but not used [-Wunused-but-set-parameter=]
    9389 | static unsigned long get_stat_sum(struct kmem_cache *s, enum stat_item si)
         |                                                         ~~~~~~~~~~~~~~~^~
--
   lib/tests/slub_kunit.c: In function 'test_bench':
>> lib/tests/slub_kunit.c:457:28: warning: variable 'base' set but not used [-Wunused-but-set-variable=]
     457 |         unsigned long long base;
         |                            ^~~~


vim +/si +9389 mm/slub.c

  9388	
> 9389	static unsigned long get_stat_sum(struct kmem_cache *s, enum stat_item si)
  9390	{
  9391		unsigned long sum = 0;
  9392		int cpu;
  9393	
  9394		for_each_online_cpu(cpu) {
  9395			sum +=  per_cpu_ptr(s->cpu_slab, cpu)->stat[si];
  9396		}
  9397	
  9398		return sum;
  9399	}
  9400	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
