Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3411435949
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Mar 2026 04:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773636193; cv=none; b=KXKYNyxOIHa5PHNB/PyRmgdcmqKdyRlSsCuHTh2+cdOhJhVCmHO/lh//KtEbGW/8asLxtXPqCILOfZxNL3SMHKc5UVS4/THokAdQFQzp+RqtNkqFMNHT/ynpnsPRdNgJWOzqx4O53qhT/emP5kJtXx62rZxiyNubLviwmoRt8EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773636193; c=relaxed/simple;
	bh=JXr75IZIqNpZmQrxCcAZYaIWtms0zNH/S2JGsFUlgww=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qRsGWHbKujRVZ9t2PHgGA+Dd8wzB2g5JoUORI1qovgta+D3UZCRPXO/nZXK8aEAh+3i4HGkPUUqHIELhisOVBwAA02Q43WO+3V1+2Ptc+Vl+s37F4olOzd4uHLQgmXs+mEGCohDTZuXu92UaKgIiWngOzVFSYS2LWtFeDivZLoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPIaUmwh; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPIaUmwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773636192; x=1805172192;
  h=date:from:to:cc:subject:message-id;
  bh=JXr75IZIqNpZmQrxCcAZYaIWtms0zNH/S2JGsFUlgww=;
  b=cPIaUmwh94ODPQrDpOH29LtKKbBrX1J4OMLZh4n7ByVZpmbgIP7/gYlY
   Rt84heiSpPuvAjCxfIgCD/GVqtj2lAyDuP8q55Ca80K3S63lZ+3WmvNu+
   SdLXHY5SzgRmnUybRKpKAxo3xNqhqJ2c8YB7F+Nxo0S1TAALojukwJn98
   ivNApN5QqzRJGuJAdIZDdSmtnwRuplzDSscDAjsyeBTcfqZZlh7ODTD5h
   Ur51NJb218EaqhKlsuT4U8KMovpBruUIXgRaXJCwScAtQwPjovneRp/HF
   8YtTLPMdXE7PqxcSIM/21qN34JRi6xMc+uZGV6gKi6EDcOn7S5mka45YC
   Q==;
X-CSE-ConnectionGUID: Z1t7XPMvRUW97oYliYUnuA==
X-CSE-MsgGUID: d1Atr9wnQt+l4MK64arw+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74532337"
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="74532337"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2026 21:43:11 -0700
X-CSE-ConnectionGUID: KJUavIYwSdSYMHEklFQlaw==
X-CSE-MsgGUID: e73RklJHTNG+B3I7oza/sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,123,1770624000"; 
   d="scan'208";a="226782808"
Received: from lkp-server01.sh.intel.com (HELO 892944969b78) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Mar 2026 21:43:10 -0700
Received: from kbuild by 892944969b78 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1znH-0000000007E-0s4q;
	Mon, 16 Mar 2026 04:43:07 +0000
Date: Mon, 16 Mar 2026 12:43:02 +0800
From: kernel test robot <lkp@intel.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [arm-integrator:b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
 7/13] kernel/fork.c:260:49: error: 'THREAD_PREALLOC_PAGES' undeclared
Message-ID: <202603161220.T94bwBze-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/aarch64-dynamic-kernel-stacks-v7.0-rc1
head:   3ea8b0381a0759fa0c71abae5274db2414b58e78
commit: d2ee0928bdd182aed09a1eabb9c008eef73bb442 [7/13] fork: Dynamic Kernel Stacks
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260316/202603161220.T94bwBze-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260316/202603161220.T94bwBze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603161220.T94bwBze-lkp@intel.com/

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
