Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341992836F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 13:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768656243; cv=none; b=dk1/J5aqMi1mzHTK6jrkV5hlFjo84P1bJW917uV+YbziT1NoWxmIzKxN/PNYowbJAMzSVLLVt0ioGhl7+nZSocdU47ttw7DALS3zhTAG0AR0xVnqs2hwHEZk5GB4K8JYSbYLjTDFnxf9c+qcWducRZXSOiLKjZ98sVfBzvgc4+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768656243; c=relaxed/simple;
	bh=uERr11ru3AVa1xk6czUSnv2F5xYuPNTaYWUG5CXatPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qeZhqDBWpUYZTpm4db/fWT6cxbNoBUb4pn9j5+jaFsODFTE2gUZPsoM2tWkTwOkXFYgJ3AqXnIAUSihj7fsPMei7Slu2niywK7nKhqoEO2aehV+QUxkwpxwEf4yhwBBVMFrSz4keanRJHBeNL1I7oUnpUFrN1S1VkLj91qPmKdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E2DKTXY9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E2DKTXY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768656240; x=1800192240;
  h=date:from:to:cc:subject:message-id;
  bh=uERr11ru3AVa1xk6czUSnv2F5xYuPNTaYWUG5CXatPw=;
  b=E2DKTXY9FVFTtiIIsF/YyXFpnY0JojHGCRpfMYWqTusYRotYpsX6N5J+
   g6Ma31Ff0BlijyD10CscAJRvgdZEshsh+D7Y2cXJ86ZfgSep+v/MZjLX4
   TjDSZevCT0CFKD35Pi4qFKHn0S4nvJdo4Y4jvwSCQcGhjr8sXMc2clhcp
   XpVvTdDVzidB5sD3p3KKm+zp+uenxz9FBssKWg4Ets7Ur9oriSwBY7yX0
   ASOnyyt+tXmh3kmG/BMwrf1ym4ZwTk+XCLs24wxaZd/H6xoWrhsK+5LD5
   Z8aDREp1jOEKkCp1zwxbbovM7HZAkPCkdD50lfCuuTXy+w/ajDi5cH2ql
   Q==;
X-CSE-ConnectionGUID: fi/b1Pz8RPGTeGh9m1BW3Q==
X-CSE-MsgGUID: mDNoh+wTSX+dXXL5aIw+Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="87361445"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="87361445"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 05:23:59 -0800
X-CSE-ConnectionGUID: 99uaTHBASQ6Ip4b8s4nwnA==
X-CSE-MsgGUID: jqnaAtwvSWu+r8zWaTD3EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="204623799"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2026 05:23:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh6HT-00000000LsK-2NKP;
	Sat, 17 Jan 2026 13:23:55 +0000
Date: Sat, 17 Jan 2026 21:23:02 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [linux-next:master 5478/6849] mm/slub.c:2340:16: error: use
 of undeclared identifier 'MEMCG_DATA_OBJEXTS'
Message-ID: <202601172108.4M7RmCaj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: aeb88c8de3688638632d5867c352676d334e6531 [5478/6849] mm/slab: save memory by allocating slabobj_ext array from leftover
config: mips-randconfig-r062-20260117 (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601172108.4M7RmCaj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601172108.4M7RmCaj-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c:2154:33: error: passing 'union codetag_ref' to parameter of incompatible type 'union codetag_ref *'; take the address with &
    2154 |                 if (unlikely(is_codetag_empty(ext->ref))) {
         |                                               ^~~~~~~~
         |                                               &
   include/linux/compiler.h:77:42: note: expanded from macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/alloc_tag.h:52:56: note: passing argument to parameter 'ref' here
      52 | static inline bool is_codetag_empty(union codetag_ref *ref)
         |                                                        ^
>> mm/slub.c:2340:16: error: use of undeclared identifier 'MEMCG_DATA_OBJEXTS'
    2340 |                         obj_exts |= MEMCG_DATA_OBJEXTS;
         |                                     ^
   2 errors generated.


vim +/MEMCG_DATA_OBJEXTS +2340 mm/slub.c

  2316	
  2317	/*
  2318	 * Try to allocate slabobj_ext array from unused space.
  2319	 * This function must be called on a freshly allocated slab to prevent
  2320	 * concurrency problems.
  2321	 */
  2322	static void alloc_slab_obj_exts_early(struct kmem_cache *s, struct slab *slab)
  2323	{
  2324		void *addr;
  2325		unsigned long obj_exts;
  2326	
  2327		if (!need_slab_obj_exts(s))
  2328			return;
  2329	
  2330		if (obj_exts_fit_within_slab_leftover(s, slab)) {
  2331			addr = slab_address(slab) + obj_exts_offset_in_slab(s, slab);
  2332			addr = kasan_reset_tag(addr);
  2333			obj_exts = (unsigned long)addr;
  2334	
  2335			get_slab_obj_exts(obj_exts);
  2336			memset(addr, 0, obj_exts_size_in_slab(slab));
  2337			put_slab_obj_exts(obj_exts);
  2338	
  2339			if (IS_ENABLED(CONFIG_MEMCG))
> 2340				obj_exts |= MEMCG_DATA_OBJEXTS;
  2341			slab->obj_exts = obj_exts;
  2342			slab_set_stride(slab, sizeof(struct slabobj_ext));
  2343		}
  2344	}
  2345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
