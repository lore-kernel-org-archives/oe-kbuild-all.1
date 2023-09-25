Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3AE11C8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Sep 2023 14:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695651796; x=1727187796;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=D4Z+yb5cr7rTB7L/znzUoO4W25OKGiOPn0XJjTdrFEc=;
  b=nrZWm++aCdofegdI8JSe6bqxhapWqJ21v0UEMM2kt6cfY5mU6I725Iip
   08eiSa8/kEmBlZXWrMhNSAGBq+1cBNqinjZ9/XBx23ruvprsyvRB1hBQ0
   fo4cUaI1hcRvcbYpO3a30CUtdJK7/AD6vtuvP+CIxioC5Ir4plrfCtG3F
   RLHG9RL0mQEgzXqcM525We4/v9AVv8+fL/IuLwXRNzH30o25ZZXbfO5zD
   y6TSkjM2l0kTe3ohHqdMiCC/Dbjv4HswrhY8hwJnrsEdBndxKi/nWfhWK
   bwdKNhGgu5e8oGXWaIQFBauD7KlrJ3HFRT1BZpq4Hp5mefTlW8GlcHPyx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="360642207"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="360642207"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2023 07:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="751707572"
X-IronPort-AV: E=Sophos;i="6.03,175,1694761200"; 
   d="scan'208";a="751707572"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 25 Sep 2023 07:23:14 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkmUS-0001Zp-0G;
	Mon, 25 Sep 2023 14:23:12 +0000
Date: Mon, 25 Sep 2023 22:22:41 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
Message-ID: <202309252204.wdpAZ2u6-lkp@intel.com>
References: <20230919230909.530174-5-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230919230909.530174-5-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on tip/x86/asm]
[also build test ERROR on arnd-asm-generic/master linus/master v6.6-rc3]
[cannot apply to akpm-mm/mm-everything next-20230925]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-migrate-fix-do_pages_move-for-compat-pointers/20230920-072208
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230919230909.530174-5-gregory.price%40memverge.com
patch subject: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20230925/202309252204.wdpAZ2u6-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230925/202309252204.wdpAZ2u6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309252204.wdpAZ2u6-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function 'phys_page_migratable':
>> mm/migrate.c:2186:47: error: 'struct mm_struct' has no member named 'owner'
    2186 |         struct task_struct *owner = vma->vm_mm->owner;
         |                                               ^~
   mm/migrate.c:2186:29: warning: unused variable 'owner' [-Wunused-variable]
    2186 |         struct task_struct *owner = vma->vm_mm->owner;
         |                             ^~~~~


vim +2186 mm/migrate.c

  2174	
  2175	/*
  2176	 * Walks each vma mapping a given page and determines if those
  2177	 * vma's are both migratable, and that the target node is within
  2178	 * the allowed cpuset of the owning task.
  2179	 */
  2180	static bool phys_page_migratable(struct folio *folio,
  2181					 struct vm_area_struct *vma,
  2182					 unsigned long address,
  2183					 void *arg)
  2184	{
  2185		struct rmap_page_ctxt *ctxt = (struct rmap_page_ctxt *)arg;
> 2186		struct task_struct *owner = vma->vm_mm->owner;
  2187		/* On non-memcg systems, the allowed set is the possible set */
  2188	#ifdef CONFIG_MEMCG
  2189		nodemask_t task_nodes = cpuset_mems_allowed(owner);
  2190	#else
  2191		nodemask_t task_nodes = node_possible_map;
  2192	#endif
  2193	
  2194		ctxt->found |= true;
  2195		ctxt->migratable &= vma_migratable(vma);
  2196		ctxt->node_allowed &= node_isset(ctxt->node, task_nodes);
  2197	
  2198		return ctxt->migratable && ctxt->node_allowed;
  2199	}
  2200	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
