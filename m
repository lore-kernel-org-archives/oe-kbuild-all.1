Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C291F5EA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 01:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773363975; cv=none; b=Xcef7eWhxJp1HwuCYeq+UDx9i7OJOl2SQ65tJU9nrFsZCcDdeqx63o8Jwsb4LK4sreYo64ySDuAh83LL9Zqz6q8rg9pv8Zj1XUymJojVhu0gpzhGgsg+EQknoo23DaoqugG5JN2E6mZw6nWWNqXRKVydsqjMNmYUH/SIpjGH6oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773363975; c=relaxed/simple;
	bh=JT47JKcdmI9+PCKDTO19VEf/tdIYd8XwmAJuq+k+GGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tZ4puhAyLL+sHzMafWDVV5nytERleyYg1VFH90+DbxZEDoQ22HoGJOBGbJPpJG4kXKsvuzPfVuJEi6kqAS3eqBNDFwpng+Ld6LrBl2/s01/SjXC38/Bkrma+QXL2XJ6xiVA3M4pEvVJQTkm2AJ5uxi0cYXnbGmE3PIq1BChr8Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAXT0RKQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAXT0RKQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773363972; x=1804899972;
  h=date:from:to:cc:subject:message-id;
  bh=JT47JKcdmI9+PCKDTO19VEf/tdIYd8XwmAJuq+k+GGU=;
  b=gAXT0RKQEaaf8LJLuEwfqJ/217gCXxKHni8tmjXyp+4rW/cOc7fgzllx
   ceN6O97rEAMdu4LJVWKXdb7m9Wp3ldxAaet4NPwk7b/sylcKRmzsVy69Z
   QQMf/LEdaxWgnYuJiNPSY0YqBcWYgIxDIw4EPgsDtjZmQR2azchncYMtA
   K+Gu9hTBcd473C29yeCdzq3dl+kHexTo+H8+JhISvWrhW4bfzuO9rzYgD
   WxMOfnjDL30LJ1njveqhKVoXbhYjyLvza8A2hoJbrZQxGfg2LSJ0roseY
   JO9F4qxA099P90N52yAi8zb8nqvPHxdZaxHz4UB6Sb1A4Z5gRYTEmK+x/
   A==;
X-CSE-ConnectionGUID: SAawZCf7QHO8mW+YbukAag==
X-CSE-MsgGUID: 0qUnlrNWRzeG356yJ+aAMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="85100073"
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="85100073"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 18:06:11 -0700
X-CSE-ConnectionGUID: 1Tj768ZQR5215hEwAAn8kA==
X-CSE-MsgGUID: sfExxO79TUemUbUwqrKr2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,117,1770624000"; 
   d="scan'208";a="221073393"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Mar 2026 18:06:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0qyd-000000003bt-20nZ;
	Fri, 13 Mar 2026 01:06:07 +0000
Date: Fri, 13 Mar 2026 02:05:43 +0100
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 7/13] kernel/fork.c:260:49: error: 'THREAD_PREALLOC_PAGES' undeclared
Message-ID: <202603130237.Cnbprgwp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   3ea8b0381a0759fa0c71abae5274db2414b58e78
commit: d2ee0928bdd182aed09a1eabb9c008eef73bb442 [7/13] fork: Dynamic Kernel Stacks
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260313/202603130237.Cnbprgwp-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260313/202603130237.Cnbprgwp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603130237.Cnbprgwp-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/fork.c: In function 'try_release_thread_stack_to_cache':
>> kernel/fork.c:260:49: error: 'THREAD_PREALLOC_PAGES' undeclared (first use in this function)
     260 |                         if (vm_area->nr_pages > THREAD_PREALLOC_PAGES)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/fork.c:260:49: note: each undeclared identifier is reported only once for each function it appears in


vim +/THREAD_PREALLOC_PAGES +260 kernel/fork.c

   238	
   239	static bool try_release_thread_stack_to_cache(struct vm_struct *vm_area)
   240	{
   241		unsigned int i;
   242		int nid;
   243	
   244		/*
   245		 * Don't cache stacks if any of the pages don't match the local domain, unless
   246		 * there is no local memory to begin with.
   247		 *
   248		 * Note that lack of local memory does not automatically mean it makes no difference
   249		 * performance-wise which other domain backs the stack. In this case we are merely
   250		 * trying to avoid constantly going to vmalloc.
   251		 */
   252		scoped_guard(preempt) {
   253			if (IS_ENABLED(CONFIG_DYNAMIC_STACK)) {
   254				/*
   255				 * If we have faulted in more than the default number of
   256				 * stack pages to a stack, don't re-use it. This makes sure
   257				 * a process never use more than THREAD_PREALLOC_PAGES
   258				 * at the outset.
   259				 */
 > 260				if (vm_area->nr_pages > THREAD_PREALLOC_PAGES)
   261					return false;
   262			}
   263			nid = numa_node_id();
   264			if (node_state(nid, N_MEMORY)) {
   265				for (i = 0; i < vm_area->nr_pages; i++) {
   266					struct page *page = vm_area->pages[i];
   267					if (page_to_nid(page) != nid)
   268						return false;
   269				}
   270			}
   271	
   272			for (i = 0; i < NR_CACHED_STACKS; i++) {
   273				struct vm_struct *tmp = NULL;
   274	
   275				if (this_cpu_try_cmpxchg(cached_stacks[i], &tmp, vm_area))
   276					return true;
   277			}
   278		}
   279		return false;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
