Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6661F941
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743842224; cv=none; b=RhZLh+3e84x0t/dPO2tE7/V9YX/iM0d0Dz4yMH9h4CSwhIT2QJBuAinHRHg/6zL937gBkvs18yjkADZFL386CnLM8fNX18nJWCCKNxqJJEiLwb623MwqXnS+qSL21W0WOkY5NBL7GIBfCjPMm7iPafMOVs5R7+AiJMrt0NPoTFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743842224; c=relaxed/simple;
	bh=aIJpkOMxbogkaJt90TEWivYu4u2nyAIzJiNPk+8aIRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hjkiv73MpUwdOM38boS4xELmc7jvkKDJjL34uDCYMfaN/akJE9Hi+MPIS8wM5PQ2d0ttgOnIby8L9FztkgXyGCkpot90SfKi1ptCYFiWq1/ONXnicSq09xAN99vsjWVrzOIKHwPOjMt5e/OdNfk8EowDQ79K6wrH6hxg5Mfi2SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R7kWz1i3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R7kWz1i3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743842221; x=1775378221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aIJpkOMxbogkaJt90TEWivYu4u2nyAIzJiNPk+8aIRM=;
  b=R7kWz1i3/+lQXVjidnSpW8Fcs8Zsptbc/uw+oZ0/LB2iUQ+llQPeZ7hH
   0IulLMu5qVyCLQykQcMxFCedU2LlLVg49A/EJTIlU5fDBi1gyh0lPNb2X
   YBrRUvG+1GQDQxomArYMueUWEGDm3NtPJc1bjR5Z6xrZlFLDCsm3kfMqu
   CKL+ufUUUoQ0S6pRycUjt+tTNIgKVzKHzAQiXjtnaP8Om7/qlYOV0KsZu
   /5F7HCgLMs9uKurm7tDAa5CicnlvwsZylMVzPMAluCLfnO83cBLUd6lm8
   Jl+kz5B2lmvkYr3G9ptdPhAXS440/BPL7f1YcSRiLghtr8Awq2wHUV9/j
   Q==;
X-CSE-ConnectionGUID: hzEtBzm8RhiumTQya0SaCg==
X-CSE-MsgGUID: eBvLH30QQI2qBr0hfQ58WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="44529399"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="44529399"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 01:37:00 -0700
X-CSE-ConnectionGUID: LpknAgmERPS5msJC2AcJgQ==
X-CSE-MsgGUID: eEd28gbqSYqU0m3Ngd8olQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="131652603"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 Apr 2025 01:37:00 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0z1N-0001u7-1B;
	Sat, 05 Apr 2025 08:36:57 +0000
Date: Sat, 5 Apr 2025 16:36:51 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 11/11] mm/slub.c:4115:16: error: too few arguments
 to function 'get_partial'
Message-ID: <202504051839.ExpJDPAS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   a8b51ec33155e2a633ff561d09e3ac44faaa3117
commit: a8b51ec33155e2a633ff561d09e3ac44faaa3117 [11/11] kmalloc
config: arc-randconfig-002-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051839.ExpJDPAS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051839.ExpJDPAS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051839.ExpJDPAS-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function '__slab_alloc_node':
>> mm/slub.c:4115:16: error: too few arguments to function 'get_partial'
    4115 |         slab = get_partial(s, node, &pc);
         |                ^~~~~~~~~~~
   mm/slub.c:3000:21: note: declared here
    3000 | static struct slab *get_partial(struct kmem_cache *s, int node,
         |                     ^~~~~~~~~~~


vim +/get_partial +4115 mm/slub.c

f7c80fad6c2b64 Christoph Lameter   2024-10-01  4074  
1f04b07d976da0 Thomas Gleixner     2022-08-25  4075  	if (!USE_LOCKLESS_FAST_PATH() ||
bb192ed9aa7191 Vlastimil Babka     2021-11-03  4076  	    unlikely(!object || !slab || !node_match(slab, node))) {
6edf2576a6cc46 Feng Tang           2022-09-13  4077  		object = __slab_alloc(s, gfpflags, node, addr, c, orig_size);
8eae1492675d0f Dave Hansen         2014-06-04  4078  	} else {
0ad9500e16fe24 Eric Dumazet        2011-12-16  4079  		void *next_object = get_freepointer_safe(s, object);
0ad9500e16fe24 Eric Dumazet        2011-12-16  4080  
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4081  		/*
25985edcedea63 Lucas De Marchi     2011-03-30  4082  		 * The cmpxchg will only match if there was no additional
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4083  		 * operation and if we are on the right processor.
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4084  		 *
d0e0ac9772f8ec Chen Gang           2013-07-15  4085  		 * The cmpxchg does the following atomically (without lock
d0e0ac9772f8ec Chen Gang           2013-07-15  4086  		 * semantics!)
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4087  		 * 1. Relocate first pointer to the current per cpu area.
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4088  		 * 2. Verify that tid and freelist have not been changed
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4089  		 * 3. If they were not changed replace tid and freelist
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4090  		 *
d0e0ac9772f8ec Chen Gang           2013-07-15  4091  		 * Since this is without lock semantics the protection is only
d0e0ac9772f8ec Chen Gang           2013-07-15  4092  		 * against code executing on this cpu *not* from access by
d0e0ac9772f8ec Chen Gang           2013-07-15  4093  		 * other cpus.
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4094  		 */
6801be4f2653e5 Peter Zijlstra      2023-05-31  4095  		if (unlikely(!__update_cpu_freelist_fast(s, object, next_object, tid))) {
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4096  			note_cmpxchg_failure("slab_alloc", s, tid);
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4097  			goto redo;
8a5ec0ba42c491 Christoph Lameter   2011-02-25  4098  		}
0ad9500e16fe24 Eric Dumazet        2011-12-16  4099  		prefetch_freepointer(s, next_object);
84e554e6865c4f Christoph Lameter   2009-12-18  4100  		stat(s, ALLOC_FASTPATH);
894b8788d7f265 Christoph Lameter   2007-05-10  4101  	}
0f181f9fbea8bc Alexander Potapenko 2019-10-14  4102  
56d5a2b9ba85a3 Vlastimil Babka     2022-11-21  4103  	return object;
56d5a2b9ba85a3 Vlastimil Babka     2022-11-21  4104  }
0af8489b0216fa Vlastimil Babka     2022-11-15  4105  #else /* CONFIG_SLUB_TINY */
0af8489b0216fa Vlastimil Babka     2022-11-15  4106  static void *__slab_alloc_node(struct kmem_cache *s,
0af8489b0216fa Vlastimil Babka     2022-11-15  4107  		gfp_t gfpflags, int node, unsigned long addr, size_t orig_size)
0af8489b0216fa Vlastimil Babka     2022-11-15  4108  {
0af8489b0216fa Vlastimil Babka     2022-11-15  4109  	struct partial_context pc;
0af8489b0216fa Vlastimil Babka     2022-11-15  4110  	struct slab *slab;
0af8489b0216fa Vlastimil Babka     2022-11-15  4111  	void *object;
0af8489b0216fa Vlastimil Babka     2022-11-15  4112  
0af8489b0216fa Vlastimil Babka     2022-11-15  4113  	pc.flags = gfpflags;
0af8489b0216fa Vlastimil Babka     2022-11-15  4114  	pc.orig_size = orig_size;
43c4c349149c77 Chengming Zhou      2023-11-02 @4115  	slab = get_partial(s, node, &pc);
0af8489b0216fa Vlastimil Babka     2022-11-15  4116  
43c4c349149c77 Chengming Zhou      2023-11-02  4117  	if (slab)
43c4c349149c77 Chengming Zhou      2023-11-02  4118  		return pc.object;
0af8489b0216fa Vlastimil Babka     2022-11-15  4119  
0af8489b0216fa Vlastimil Babka     2022-11-15  4120  	slab = new_slab(s, gfpflags, node);
0af8489b0216fa Vlastimil Babka     2022-11-15  4121  	if (unlikely(!slab)) {
0af8489b0216fa Vlastimil Babka     2022-11-15  4122  		slab_out_of_memory(s, gfpflags, node);
0af8489b0216fa Vlastimil Babka     2022-11-15  4123  		return NULL;
0af8489b0216fa Vlastimil Babka     2022-11-15  4124  	}
0af8489b0216fa Vlastimil Babka     2022-11-15  4125  
0af8489b0216fa Vlastimil Babka     2022-11-15  4126  	object = alloc_single_from_new_slab(s, slab, orig_size);
0af8489b0216fa Vlastimil Babka     2022-11-15  4127  
0af8489b0216fa Vlastimil Babka     2022-11-15  4128  	return object;
0af8489b0216fa Vlastimil Babka     2022-11-15  4129  }
0af8489b0216fa Vlastimil Babka     2022-11-15  4130  #endif /* CONFIG_SLUB_TINY */
56d5a2b9ba85a3 Vlastimil Babka     2022-11-21  4131  

:::::: The code at line 4115 was first introduced by commit
:::::: 43c4c349149c77f27c8e5801755a7b8883a70ebe slub: Change get_partial() interfaces to return slab

:::::: TO: Chengming Zhou <zhouchengming@bytedance.com>
:::::: CC: Vlastimil Babka <vbabka@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
