Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547B1E7C01
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 20:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743799266; cv=none; b=nsh8HVmyUUqd0flsv7eHvEJuPBphEoa90qr/5aKNhonV/FemPmTodfOaYnfeNs2U/VKN31SHGT25fH242B1/O9wJ2wgc1LB4Sla5fo6B/7hPk1NSWGRrUcXj31LRMh+boXNCDQ952iRQlHVzNOmhWsyHPXBR30IjXZURLjf9c5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743799266; c=relaxed/simple;
	bh=5TZlQF9gVUSkf7SAIdM+gBLCyFopJbxI354GtS3GYkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEZ9TH/oQQXwFpZDqPjh23kQLiAj+ef09NUC+qWUG8btVpe7y0stdmh2BQ5X29A1SNEBVvuQxJfZB6ugCiN6Q60yM1EK1cPlPLOZm/zLEdKoRU46iWyei2t0aIjeNOgxR68a9cQUt0/9I67vyJasd5RhrqinEIrp1DKgNkx4u5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8wTbryq; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8wTbryq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743799263; x=1775335263;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5TZlQF9gVUSkf7SAIdM+gBLCyFopJbxI354GtS3GYkg=;
  b=Q8wTbryqtuiuZeKJjig2n4TJdd4lmq3UZz7uZM3bj34MgXmWhPbWgkuj
   I4CifFEiMz4GkRLgtdGnYt8b2aCJY+FtlLXeNKhGZFe/KPslTAQ0eWQk/
   QJBvcW+6Pg7bpcK5gokbSwHSvjqeWnmlwZe/4TQnqlNBVpIeQsNaIFleb
   ZmWu8qTP+UnzD1c6sCqeUS/dMjnaipGYABh0Ro3hvBI1GGlFufH2UirCq
   peaXvwVyoE14TQpaWKnQTktCN0ouunMlefJoe7Tnx7YTbNsG/l42yolAy
   BQ5SANyS5ZVMc3OHXH1yWE9Jd9O9eMtyaPDXndPdyrGTbiiLaetqB74YS
   w==;
X-CSE-ConnectionGUID: 02X7EXNVQ7Oww9s4dAuiiA==
X-CSE-MsgGUID: NN7lkjuaRDuTUBas5j6Mdw==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62789473"
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="62789473"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 13:41:03 -0700
X-CSE-ConnectionGUID: dHSG3PRwQOetYLcuUqnmvA==
X-CSE-MsgGUID: WXzk82FAQ8K8ie5R4uiRlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,189,1739865600"; 
   d="scan'208";a="127925464"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Apr 2025 13:41:02 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0nqV-0001XD-1g;
	Fri, 04 Apr 2025 20:40:59 +0000
Date: Sat, 5 Apr 2025 04:40:35 +0800
From: kernel test robot <lkp@intel.com>
To: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 01/14] kasan: sw_tags: Use arithmetic shift for shadow
 computation
Message-ID: <202504050400.l3CsXnZ7-lkp@intel.com>
References: <d411f0b3f3fe3b6e96773e704e83cd08092db042.1743772053.git.maciej.wieczor-retman@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d411f0b3f3fe3b6e96773e704e83cd08092db042.1743772053.git.maciej.wieczor-retman@intel.com>

Hi Maciej,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/core]
[also build test WARNING on arm64/for-next/core akpm-mm/mm-everything tip/x86/mm linus/master v6.14 next-20250404]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Maciej-Wieczor-Retman/kasan-sw_tags-Use-arithmetic-shift-for-shadow-computation/20250404-211854
base:   tip/x86/core
patch link:    https://lore.kernel.org/r/d411f0b3f3fe3b6e96773e704e83cd08092db042.1743772053.git.maciej.wieczor-retman%40intel.com
patch subject: [PATCH v3 01/14] kasan: sw_tags: Use arithmetic shift for shadow computation
config: xtensa-randconfig-001-20250404 (https://download.01.org/0day-ci/archive/20250405/202504050400.l3CsXnZ7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504050400.l3CsXnZ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504050400.l3CsXnZ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/kasan/report.c: In function 'kasan_non_canonical_hook':
>> mm/kasan/report.c:691:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     691 |                 if (addr < (u64)kasan_mem_to_shadow((void *)(0UL)) ||
         |                            ^
   mm/kasan/report.c:692:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     692 |                     addr > (u64)kasan_mem_to_shadow((void *)(~0UL)))
         |                            ^
>> mm/kasan/report.c:713:69: warning: left shift count >= width of type [-Wshift-count-overflow]
     713 |                 if (addr < (u64)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||
         |                                                                     ^~
   mm/kasan/report.c:713:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     713 |                 if (addr < (u64)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||
         |                            ^
   mm/kasan/report.c:714:28: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
     714 |                     addr > (u64)kasan_mem_to_shadow((void *)(~0UL)))
         |                            ^


vim +691 mm/kasan/report.c

   669	
   670	#if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
   671	/*
   672	 * With compiler-based KASAN modes, accesses to bogus pointers (outside of the
   673	 * mapped kernel address space regions) cause faults when KASAN tries to check
   674	 * the shadow memory before the actual memory access. This results in cryptic
   675	 * GPF reports, which are hard for users to interpret. This hook helps users to
   676	 * figure out what the original bogus pointer was.
   677	 */
   678	void kasan_non_canonical_hook(unsigned long addr)
   679	{
   680		unsigned long orig_addr;
   681		const char *bug_type;
   682	
   683		/*
   684		 * For Generic KASAN, kasan_mem_to_shadow() uses the logical right shift
   685		 * and never overflows with the chosen KASAN_SHADOW_OFFSET values (on
   686		 * both x86 and arm64). Thus, the possible shadow addresses (even for
   687		 * bogus pointers) belong to a single contiguous region that is the
   688		 * result of kasan_mem_to_shadow() applied to the whole address space.
   689		 */
   690		if (IS_ENABLED(CONFIG_KASAN_GENERIC)) {
 > 691			if (addr < (u64)kasan_mem_to_shadow((void *)(0UL)) ||
   692			    addr > (u64)kasan_mem_to_shadow((void *)(~0UL)))
   693				return;
   694		}
   695	
   696		/*
   697		 * For Software Tag-Based KASAN, kasan_mem_to_shadow() uses the
   698		 * arithmetic shift. Normally, this would make checking for a possible
   699		 * shadow address complicated, as the shadow address computation
   700		 * operation would overflow only for some memory addresses. However, due
   701		 * to the chosen KASAN_SHADOW_OFFSET values and the fact the
   702		 * kasan_mem_to_shadow() only operates on pointers with the tag reset,
   703		 * the overflow always happens.
   704		 *
   705		 * For arm64, the top byte of the pointer gets reset to 0xFF. Thus, the
   706		 * possible shadow addresses belong to a region that is the result of
   707		 * kasan_mem_to_shadow() applied to the memory range
   708		 * [0xFF000000000000, 0xFFFFFFFFFFFFFFFF]. Despite the overflow, the
   709		 * resulting possible shadow region is contiguous, as the overflow
   710		 * happens for both 0xFF000000000000 and 0xFFFFFFFFFFFFFFFF.
   711		 */
   712		if (IS_ENABLED(CONFIG_KASAN_SW_TAGS) && IS_ENABLED(CONFIG_ARM64)) {
 > 713			if (addr < (u64)kasan_mem_to_shadow((void *)(0xFFUL << 56)) ||

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
