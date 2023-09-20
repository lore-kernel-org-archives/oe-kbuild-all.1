Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B33918654
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 11:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695210515; x=1726746515;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z+fCGQgebBI+QjTwX3ltJJ6qwB9mOL4hDBaUSHH3RDY=;
  b=YI9nAeZEuH2EhMdMGV8990B2RHtOdP0YpvakpaJjvzVByoqIuBjgoVfC
   lYN2lLEi3Hcg3n6G/yg5upq85jLAGj4zHgl0IT5fJ9LWGx8dzLd2J5mpk
   0oxHCvKAhavt02XZVsJOTwFdmNUefLdwyT6QSH8koXPoiTS0XXhQeE7+Z
   oUbdfBrj73Agv2DDAHTeH1IqnkiShK2euyVCLoIptGgPNRUenblBammw9
   g7e1ba1xtZhRZvgmppxicQqbEtG2Q1NnmWHHrNKmRpb/6Xl4s2dtHfHZa
   AZRexVeL9GKMGBS4/qKeneBCdVCyzaVToMT2ljcKVh2E26UQM72e4RnkB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382944589"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="382944589"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 04:48:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="836812749"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="836812749"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 20 Sep 2023 04:48:33 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qivh1-0008hv-1p;
	Wed, 20 Sep 2023 11:48:31 +0000
Date: Wed, 20 Sep 2023 19:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
Message-ID: <202309201901.j8RzcXv1-lkp@intel.com>
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
[also build test WARNING on arnd-asm-generic/master linus/master v6.6-rc2]
[cannot apply to akpm-mm/mm-everything next-20230920]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-migrate-fix-do_pages_move-for-compat-pointers/20230920-072208
base:   tip/x86/asm
patch link:    https://lore.kernel.org/r/20230919230909.530174-5-gregory.price%40memverge.com
patch subject: [RFC v2 4/5] mm/migrate: Create move_phys_pages syscall
config: loongarch-randconfig-001-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201901.j8RzcXv1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201901.j8RzcXv1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201901.j8RzcXv1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/migrate.c: In function 'phys_page_migratable':
   mm/migrate.c:2186:47: error: 'struct mm_struct' has no member named 'owner'
    2186 |         struct task_struct *owner = vma->vm_mm->owner;
         |                                               ^~
>> mm/migrate.c:2186:29: warning: unused variable 'owner' [-Wunused-variable]
    2186 |         struct task_struct *owner = vma->vm_mm->owner;
         |                             ^~~~~


vim +/owner +2186 mm/migrate.c

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
