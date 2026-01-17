Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1D82C11DB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768650479; cv=none; b=AoaI+Bm7buUYMYzyzYfi4TMVNvYU0xGhUkUJgqvrq2IivvLaLsSoE4wPZzL3b/o0konwxUN9dk2cepd0A8jQhug3rDMI+mztigFiwvBfVYu08yqQ2HDf7QkMEBcotSQqFsuzH6kyttRh4u3e9/m8oSiDZ89Jf+7PVLWwPNgCCwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768650479; c=relaxed/simple;
	bh=1pzNZlrfrv9ChI4QyIJTy76eTXjk80uXLyZtThquOBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cRIRihSiwrs6LY9IpWy7rlkwysPcZyS55cOFSL4K9fGZzNHPKMRLL9MOGkFWfixaEe5gWtuJmMb+DjRSQsJgENVsBIyIIvpGRwBxiffn3+HJmKsGuL3JuhQteFrLcvot8Vfawv7T6FyNGaZpD6vTm6loLQjKUwSZ5p0cfVf5bO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4p+Ygsm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4p+Ygsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768650477; x=1800186477;
  h=date:from:to:cc:subject:message-id;
  bh=1pzNZlrfrv9ChI4QyIJTy76eTXjk80uXLyZtThquOBU=;
  b=N4p+YgsmRa4NP8yPEQkGd0EZW3pue+ec9GlIc1cNwg+CYu2ZLBHoDxkz
   wkB9OCTKwTecTd/1InedRpNvjv3xMs3X90yP8w3iGmMF7D6iCmn2Wkq4j
   FCaV291GdXKsAW0fimNQw4p+4YveaEBoheO7SY6fq6Y9iXrjKMU7iBxyu
   j/OXgmjasMKxP2+5UmhkSl6x9aX8qLqVjt2tbcZcAm8i9RNFgzCXni1M3
   hV+8RhezcG9AD+LACs0NedfVDXMOgG/SI0IsPbrtrEOxxX8GxD9sfsyQh
   /YGfe6hc3Bydpcuv7j1pjmqx+rTDGj48yxqua/kER+D4mxEwvpO80ftPT
   A==;
X-CSE-ConnectionGUID: OPWBwx9YQ5+o2ap1202jHw==
X-CSE-MsgGUID: 5Qls6vF7TZ2huXzUhZMk0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73797928"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="73797928"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 03:47:56 -0800
X-CSE-ConnectionGUID: 4RHVx7GPQGGdssDRIN+r0Q==
X-CSE-MsgGUID: mIm+S4bPS5ewpCPP/2udog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; 
   d="scan'208";a="204612610"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2026 03:47:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh4mW-00000000Loi-05Sr;
	Sat, 17 Jan 2026 11:47:52 +0000
Date: Sat, 17 Jan 2026 19:47:11 +0800
From: kernel test robot <lkp@intel.com>
To: Harry Yoo <harry.yoo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>
Subject: [linux-next:master 5478/6849] mm/slub.c:2340:37: error:
 'MEMCG_DATA_OBJEXTS' undeclared
Message-ID: <202601171913.LHy2uylm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: aeb88c8de3688638632d5867c352676d334e6531 [5478/6849] mm/slab: save memory by allocating slabobj_ext array from leftover
config: openrisc-randconfig-r064-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171913.LHy2uylm-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171913.LHy2uylm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171913.LHy2uylm-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/slub.c: In function 'alloc_slab_obj_exts_early':
>> mm/slub.c:2340:37: error: 'MEMCG_DATA_OBJEXTS' undeclared (first use in this function)
    2340 |                         obj_exts |= MEMCG_DATA_OBJEXTS;
         |                                     ^~~~~~~~~~~~~~~~~~
   mm/slub.c:2340:37: note: each undeclared identifier is reported only once for each function it appears in


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
