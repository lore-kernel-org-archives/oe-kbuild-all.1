Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E7025C6F9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Mar 2025 15:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742915285; cv=none; b=r9QnhtMdSz6nRZhr5gdhB02Q/2L7wVf4bU0JuYkilzjtJ/xYk0Hi58GyaYN9EzG8f9DNzzjEHfmffhC3Vby5FZTGK9vAa/va2VbYxkF+RzFi8sifMu631VNCR4KdxS09YaLaIMsDfrbbV9QdZ4myLhGtBNjP85ruTvdxJiLR55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742915285; c=relaxed/simple;
	bh=KcOJTzYtr/yo5uSk21u8Mv9SWTlyBBnjJsZY61ssp/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cMqDrXhgVCid4g/Rg1a5UrHSyTpqcuHw3rpZpGy8pmp1GL74Jz4PsUUJN4dtk6SISjzGj0UE0TQ/U6iEkUwlfo9h3NtU89giAnYyjXw+9Z8L+M7ynDnOzbJ/L2xUofYlfx9KtByhFmWJxU57fkLWDjpse+q5Q1lGoFK4QbKk5NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=na48KE3c; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="na48KE3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742915284; x=1774451284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KcOJTzYtr/yo5uSk21u8Mv9SWTlyBBnjJsZY61ssp/M=;
  b=na48KE3cY/KBYnZmEqHVb6WTPoA3UywGv+6uj1Kg0/8RXMTuxgkb46v8
   Tnf9CFSLJlTDzATi5JjPBI/77lZGOuUIW2WOEktx8S1m2Z90/jxaIlIpf
   DYtb+/PB4mb940qxH12WCAkFCbphwXD1sjFE1Pit/MZjB/ZOwje8bSOCV
   /LrPsHXAaI/mGrt5i21mWRPfR6TTR5gMn2+Cgy4UQi03p1lhWIDC6UyeT
   3RY24k0He6mdjYwJbe4UToWuQQBuWL6g/XSXR6FpntdnvDDcX6zrz6/YA
   UeLtKe5nlMAaPQDhLK18NDQydH+GtMzJ8NLO/qVxumj4+9eXtyzAiyksl
   A==;
X-CSE-ConnectionGUID: qbmuvyxtQTWlq+YrXVr1jA==
X-CSE-MsgGUID: cfvA6Cj0Qpa0RkSmopKlew==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="44290666"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="44290666"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 08:08:03 -0700
X-CSE-ConnectionGUID: czaOtzESTl6f/tpb2rKDdA==
X-CSE-MsgGUID: YSoMxYZQQ22F8NQNomS3kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; 
   d="scan'208";a="128558509"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 25 Mar 2025 08:08:02 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tx5sl-0004xz-2q;
	Tue, 25 Mar 2025 15:07:59 +0000
Date: Tue, 25 Mar 2025 23:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1514/1514] mm/memory.c:4489:43: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202503252231.BsBQmABZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a0f7a942ef42e73c8748687d469ed61f380bf0cf
commit: ae0cd4d46ced733c522f2cc6da2d380d69123fc4 [1514/1514] mm: parallelize clear_gigantic_page
config: x86_64-randconfig-121-20250325 (https://download.01.org/0day-ci/archive/20250325/202503252231.BsBQmABZ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503252231.BsBQmABZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503252231.BsBQmABZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memory.c:4489:43: sparse: sparse: Using plain integer as NULL pointer
   mm/memory.c:4560:22: sparse: sparse: cast removes address space '__user' of expression
   mm/memory.c:833:17: sparse: sparse: context imbalance in 'copy_pte_range' - different lock contexts for basic block
   mm/memory.c:1436:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   mm/memory.c:1478:9: sparse: sparse: context imbalance in 'insert_page' - different lock contexts for basic block
   mm/memory.c:1579:9: sparse: sparse: context imbalance in 'insert_pfn' - different lock contexts for basic block
   mm/memory.c:1746:17: sparse: sparse: context imbalance in 'remap_pte_range' - different lock contexts for basic block
   mm/memory.c:1975:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   mm/memory.c:2422:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:2484:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   mm/memory.c:3055:19: sparse: sparse: context imbalance in 'pte_alloc_one_map' - different lock contexts for basic block
   mm/memory.c:3295:17: sparse: sparse: context imbalance in 'finish_fault' - unexpected unlock
   mm/memory.c:3409:9: sparse: sparse: context imbalance in 'do_fault_around' - unexpected unlock
   mm/memory.c:4062:12: sparse: sparse: context imbalance in '__follow_pte_pmd' - different lock contexts for basic block
   mm/memory.c:4146:16: sparse: sparse: context imbalance in 'follow_pte_pmd' - different lock contexts for basic block
   mm/memory.c:4206:9: sparse: sparse: context imbalance in 'follow_phys' - unexpected unlock
   In file included from mm/memory.c:72:
   mm/memory.c: In function 'clear_huge_page':
   include/linux/ktask.h:123:35: warning: cast between incompatible function types from 'int (*)(long unsigned int,  long unsigned int,  struct cgp_args *)' to 'int (*)(void *, void *, void *)' [-Wcast-function-type]
     123 |                 .kc_thread_func = (ktask_thread_func)(thread_func),          22-      |                                   ^
   include/linux/ktask.h:139:17: note: in expansion of macro 'KTASK_CTL_INITIALIZER'
     139 |                 KTASK_CTL_INITIALIZER(thread_func, func_arg, min_chunk_size) 25-      |                 ^~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4491:17: note: in expansion of macro 'DEFINE_KTASK_CTL'
    4491 |                 DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
         |                 ^~~~~~~~~~~~~~~~

vim +4489 mm/memory.c

  4480	
  4481	void clear_huge_page(struct page *page,
  4482			     unsigned long addr_hint, unsigned int pages_per_huge_page)
  4483	{
  4484		unsigned long addr = addr_hint &
  4485			~(((unsigned long)pages_per_huge_page << PAGE_SHIFT) - 1);
  4486	
  4487		if (unlikely(pages_per_huge_page > MAX_ORDER_NR_PAGES)) {
  4488			struct cgp_args args = {page, addr};
> 4489			struct ktask_node node = {0, pages_per_huge_page,
  4490						  page_to_nid(page)};
  4491			DEFINE_KTASK_CTL(ctl, clear_gigantic_page_chunk, &args,
  4492					 KTASK_MEM_CHUNK);
  4493	
  4494			ktask_run_numa(&node, 1, &ctl);
  4495			return;
  4496		}
  4497	
  4498		process_huge_page(addr_hint, pages_per_huge_page, clear_subpage, page);
  4499	}
  4500	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
