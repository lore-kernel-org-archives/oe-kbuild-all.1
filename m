Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775D213C676
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 21:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723842678; cv=none; b=qjj5cL23/AR4Mxwaz4X0Q9hysZ82CvENPOMtzE9VMjd0UM7Qk2JJIIWlUV40M2Bz6TpL07dMJqdOM35O4Ohb/j0SzDdioFFgjxf108McnT2w/QbbKYCm/bgCOHFXgn7dT5bM13QiEwlOqzfVkCU/icSymXB7t2jYdGKe6n51rxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723842678; c=relaxed/simple;
	bh=WDVhWc56Fak9sXCLn5SO5+Rr+9DTUntt2UiO2cEi5iE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgRKgY2EYZr8PfjT7AZWSQkmrxKr8ceILPL8m3eEzSg8eeikIkVwS2eiCHsgHlgiCMUAJwezw9NhvC3OhqfaftjF1RxaA/MbeZ/iUr/kLRhGCyL/24Cv4WSnDqmLXO3NKHrlG60urM7HDlql9tgXzFWFKnN7CdegEXnD45cwv2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex2Iu7vB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex2Iu7vB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723842676; x=1755378676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WDVhWc56Fak9sXCLn5SO5+Rr+9DTUntt2UiO2cEi5iE=;
  b=Ex2Iu7vBVyWvKQVrgyjNbD/9+t9BZ3O6OWGuNXGj8PdG1Cs573GkzeLa
   AYLeh0A1B9KVhSB9Z91pRB5PiHUUM8AkECdTBXfdBAv1+mjBW9Bx1iy1F
   i0JZ3jb4mXRwEMNsNMfge3ijWwNwSvrMTbXBhcePQ4cSnZu+NLlb3lLPp
   Ez5xsJjWIz32u2xGy4VCuoMdQ1H44N1igfFSqJK1uS/armD9BJWYac4co
   P2UN9N0m2ZYuNwYFxkEHXRQF0WVH4spThHHabTkMrUJEDH3GseJQHiS5v
   n6WJHMFPF9lPkF8qYeYR7sPBvbIO+MXcR+C3dutLhOJozpMGCgJg35Uis
   Q==;
X-CSE-ConnectionGUID: iO2p9pv6S9qgOHVGgtT2Gg==
X-CSE-MsgGUID: aISZutyTSm+pXMG7qHYmUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25947236"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="25947236"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:11:16 -0700
X-CSE-ConnectionGUID: VjWY6V50RgatQ9vjaUBW5A==
X-CSE-MsgGUID: yocJHWGrR/6vMF8Vy4AQUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="97286212"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 14:11:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf4E5-0006vY-0B;
	Fri, 16 Aug 2024 21:11:13 +0000
Date: Sat, 17 Aug 2024 05:10:46 +0800
From: kernel test robot <lkp@intel.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] mm: fix missing TLB flushing
Message-ID: <202408170431.IDxb0aOe-lkp@intel.com>
References: <20240815120715.14516-1-zhengqi.arch@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240815120715.14516-1-zhengqi.arch@bytedance.com>

Hi Qi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.11-rc3 next-20240816]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qi-Zheng/mm-fix-missing-TLB-flushing/20240815-201808
base:   linus/master
patch link:    https://lore.kernel.org/r/20240815120715.14516-1-zhengqi.arch%40bytedance.com
patch subject: [RFC PATCH] mm: fix missing TLB flushing
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240817/202408170431.IDxb0aOe-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170431.IDxb0aOe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170431.IDxb0aOe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/proc/task_mmu.c:3:
   include/linux/mm_inline.h: In function 'cond_flush_tlb_mm_range':
>> include/linux/mm_inline.h:518:17: error: implicit declaration of function 'flush_tlb_mm_range'; did you mean 'cond_flush_tlb_mm_range'? [-Wimplicit-function-declaration]
     518 |                 flush_tlb_mm_range(mm, start, end, PAGE_SHIFT, false);
         |                 ^~~~~~~~~~~~~~~~~~
         |                 cond_flush_tlb_mm_range


vim +518 include/linux/mm_inline.h

   512	
   513	static inline void cond_flush_tlb_mm_range(struct mm_struct *mm,
   514						   unsigned long start,
   515						   unsigned long end)
   516	{
   517		if (atomic_read(&mm->tlb_flush_pending))
 > 518			flush_tlb_mm_range(mm, start, end, PAGE_SHIFT, false);
   519	}
   520	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
