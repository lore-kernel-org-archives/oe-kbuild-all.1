Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B893A290
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 19:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aQbujuWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697051975; x=1728587975;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z9gId7MQySp5ph97jl+RPq9DaVpoeoWz6xlMszQ5Q1c=;
  b=aQbujuWylS8ww0ORKrWTNYSsaBThBObFUen7PkTvEwtmqFQxOBQ4cBbX
   AWg3KgWXHk78AiKL4xhZ6zXc3iWLFbRehZT/crWYTnmBMg2g2hkXXU9DK
   ohjHKBr3hrNoqqk48w5Irkn9AboulZDpWhPLG/k7+RnEuE9Tfcb78S+r9
   K/yUxPyEzQ64aRhEbXv8SH85clmH1dQVAhmxv7Z2skXUy5zLk/IcvUihz
   1T9Xv+Jh4o1WfLtVMRButrxADZaBk7ZJ1RNN6Fd69HyIlxTCHvGIyAGMz
   PqSyEDdp6qLUORr/Bg8m05LXktiHiXkuqvVUbqMu4cLfQEljDvsvXc3Rd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381990567"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="381990567"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:19:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730608589"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="730608589"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Oct 2023 12:19:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqejv-0002cN-0O;
	Wed, 11 Oct 2023 19:19:27 +0000
Date: Thu, 12 Oct 2023 03:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
Message-ID: <202310120131.8ILdbBnZ-lkp@intel.com>
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
[cannot apply to akpm-mm/mm-everything arnd-asm-generic/master linus/master v6.6-rc5 next-20231011]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-migrate-fix-do_pages_move-for-compat-pointers/20230920-072208
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230919230909.530174-5-gregory.price%40memverge.com
patch subject: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
config: x86_64-randconfig-122-20230925 (https://download.01.org/0day-ci/archive/20231012/202310120131.8ILdbBnZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120131.8ILdbBnZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120131.8ILdbBnZ-lkp@intel.com/

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
