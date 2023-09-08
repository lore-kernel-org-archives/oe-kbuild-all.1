Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7A30FA9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 22:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694211327; x=1725747327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EG+awePXiSRn14IjYjk5V2umVoHPjgZWCAG2QFnmuj0=;
  b=VRssAIQgXsfy81bGtv7KtHmhg8c08F4V+F/vP8PrMb6GWtNS9ao27dRh
   qMaS3TrCWE5MTIdqRPCBZSrN9W5E+zsoUHkKr9bVLrWmszasxb8+QdViX
   OXt6k1mz9lykG2DkhYKUigr7HWSaoRPNaKT0/KQAE2UPHQyO+YaEz/Fwc
   bshCLgPrzmcYa+cmDU3r1GJ6RTSFu0B1l0S7/r17e/a3EKCOUp7d3YnBJ
   epsjoktLl6TtZfIKmb+dwz9dWUu3uWRlpE3GmnMvS+kQSZS8pIE+dWc87
   QAzMTWwhiHZue9y+jPoijAIqduA6TC5Ch6cI83mMA5cjNjTEOoVazq+8P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="381577558"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="381577558"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 15:00:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="832800203"
X-IronPort-AV: E=Sophos;i="6.02,238,1688454000"; 
   d="scan'208";a="832800203"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 08 Sep 2023 15:00:33 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qejWf-0002eP-2u;
	Fri, 08 Sep 2023 22:00:29 +0000
Date: Sat, 9 Sep 2023 05:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/3] mm/migrate: Create move_phys_pages syscall
Message-ID: <202309090537.kq9Eccqg-lkp@intel.com>
References: <20230907075453.350554-4-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230907075453.350554-4-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on tip/x86/asm linus/master next-20230908]
[cannot apply to arnd-asm-generic/master v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-migrate-remove-unused-mm-argument-from-do_move_pages_to_node/20230909-004600
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230907075453.350554-4-gregory.price%40memverge.com
patch subject: [RFC PATCH 3/3] mm/migrate: Create move_phys_pages syscall
config: loongarch-randconfig-r021-20230909 (https://download.01.org/0day-ci/archive/20230909/202309090537.kq9Eccqg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309090537.kq9Eccqg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309090537.kq9Eccqg-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate.c: In function 'phys_page_migratable':
>> mm/migrate.c:2182:47: error: 'struct mm_struct' has no member named 'owner'
    2182 |         struct task_struct *owner = vma->vm_mm->owner;
         |                                               ^~


vim +2182 mm/migrate.c

  2170	
  2171	/*
  2172	 * Walks each vma mapping a given page and determines if those
  2173	 * vma's are both migratable, and that the target node is within
  2174	 * the allowed cpuset of the owning task.
  2175	 */
  2176	static bool phys_page_migratable(struct folio *folio,
  2177					 struct vm_area_struct *vma,
  2178					 unsigned long address,
  2179					 void *arg)
  2180	{
  2181		struct rmap_page_ctxt *ctxt = (struct rmap_page_ctxt *)arg;
> 2182		struct task_struct *owner = vma->vm_mm->owner;
  2183		nodemask_t task_nodes = cpuset_mems_allowed(owner);
  2184	
  2185		ctxt->found |= true;
  2186		ctxt->migratable &= vma_migratable(vma);
  2187		ctxt->node_allowed &= node_isset(ctxt->node, task_nodes);
  2188	
  2189		return ctxt->migratable && ctxt->node_allowed;
  2190	}
  2191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
