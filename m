Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D32634CF1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Sep 2023 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695750297; x=1727286297;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vBDSDh6DnFwZ0lQ0lcko3gAW5n5Yp5CSwEJ7QKbVsck=;
  b=iPQTm8NTOwVQkc9HWMsAbahuDsy67bwArpN170KAOz3zEK37SUVtvJHF
   jCk4B9y+203ONGNomAt3DrhMDtCrtHpXsxjaxiOCkN3gEppwSkW0OmOvU
   BcSkL5OxXEfWa58dpO6/pp1CIT/b3qRVmQzvn3TvIi8cFRNe+WlzcVFvE
   opPuCeKNWZkr5MN+58U+HQ+fJVRtieh2ZE7IA7CUyon42IA/oLAkCgaxu
   Sa+0k+CLIoGDgg8VIJzUSIxw9MVbsrL5SY4zz9FQgF5mG00YYO3zTqv6N
   DYMd7RxSLyWLralNKT1B9/5OyvGo6BCcgmJzZbCUQIdIVen+a21SBWtu4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="361007182"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="361007182"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 10:44:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="922505741"
X-IronPort-AV: E=Sophos;i="6.03,178,1694761200"; 
   d="scan'208";a="922505741"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Sep 2023 10:44:54 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlC7A-0003C5-1b;
	Tue, 26 Sep 2023 17:44:52 +0000
Date: Wed, 27 Sep 2023 01:44:36 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
Message-ID: <202309270101.QgUVUNRS-lkp@intel.com>
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
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/x86/asm]
[also build test WARNING on arnd-asm-generic/master v6.6-rc3]
[cannot apply to akpm-mm/mm-everything linus/master next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-migrate-fix-do_pages_move-for-compat-pointers/20230920-072208
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230919230909.530174-5-gregory.price%40memverge.com
patch subject: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
config: x86_64-randconfig-122-20230925 (https://download.01.org/0day-ci/archive/20230927/202309270101.QgUVUNRS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309270101.QgUVUNRS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309270101.QgUVUNRS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/migrate.c:2186:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *owner @@     got struct task_struct [noderef] __rcu *owner @@
   mm/migrate.c:2186:47: sparse:     expected struct task_struct *owner
   mm/migrate.c:2186:47: sparse:     got struct task_struct [noderef] __rcu *owner
   mm/migrate.c:325:20: sparse: sparse: context imbalance in 'migration_entry_wait' - unexpected unlock
   mm/migrate.c:789:9: sparse: sparse: context imbalance in '__buffer_migrate_folio' - different lock contexts for basic block

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
