Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB18529A8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KNDQ0t4u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697173326; x=1728709326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1NwXhRRZ4tbr5dewoAWuwn6dFGS4W0bVmFI8CSxm14=;
  b=KNDQ0t4u2FH4PhHBzl16GBYx7XTz0qOG/HtX02C6xFI8xEfgBsU/tQE0
   WFtPNdJTWd4pjBQRUseOO//2rsZRF4FhqfYiv10vvUrB+7MmnbYrZLnBr
   9suBMWbnmKiHnoPenKCl6HcMi9wrstcrjDar8qUr0OPofeE0M61cRVZh/
   kV1XMewPP/Ai34tbgOn/dKjo0UNA5TmgMs/hH0+QjRAl87pIZcnzFXHKB
   4oWfkJP/SInrX1kGF8GX7IlLLgkQN01kZnt4djEjXCJLOH+fkb8JfS4J7
   LkeJHVp/rUV5Fn/ZN7GSPhLo3dOWMC3KDVv2gv35eoS8h5MAFGT1O6UA3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6662790"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6662790"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878396715"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="878396715"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 22:02:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrAJB-0004Lj-2B;
	Fri, 13 Oct 2023 05:01:57 +0000
Date: Fri, 13 Oct 2023 13:01:32 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 2/3] mm/memory-tiers: Introduce sysfs for tier
 interleave weights
Message-ID: <202310131242.1D02MmrI-lkp@intel.com>
References: <20231009204259.875232-3-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009204259.875232-3-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on cxl/next cxl/pending v6.6-rc5]
[cannot apply to akpm-mm/mm-everything next-20231012]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-memory-tiers-change-mutex-to-rw-semaphore/20231012-044511
base:   linus/master
patch link:    https://lore.kernel.org/r/20231009204259.875232-3-gregory.price%40memverge.com
patch subject: [RFC PATCH v2 2/3] mm/memory-tiers: Introduce sysfs for tier interleave weights
config: um-defconfig (https://download.01.org/0day-ci/archive/20231013/202310131242.1D02MmrI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131242.1D02MmrI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131242.1D02MmrI-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: mm/vmscan.o: in function `memtier_get_node_weight':
>> include/linux/memory-tiers.h:110: multiple definition of `memtier_get_node_weight'; kernel/sched/fair.o:include/linux/memory-tiers.h:110: first defined here
   ld: mm/vmscan.o: in function `memtier_get_total_weight':
>> include/linux/memory-tiers.h:115: multiple definition of `memtier_get_total_weight'; kernel/sched/fair.o:include/linux/memory-tiers.h:115: first defined here
   ld: mm/memory.o: in function `memtier_get_node_weight':
>> include/linux/memory-tiers.h:110: multiple definition of `memtier_get_node_weight'; kernel/sched/fair.o:include/linux/memory-tiers.h:110: first defined here
   ld: mm/memory.o: in function `memtier_get_total_weight':
>> include/linux/memory-tiers.h:115: multiple definition of `memtier_get_total_weight'; kernel/sched/fair.o:include/linux/memory-tiers.h:115: first defined here
   ld: mm/mprotect.o: in function `memtier_get_node_weight':
>> include/linux/memory-tiers.h:110: multiple definition of `memtier_get_node_weight'; kernel/sched/fair.o:include/linux/memory-tiers.h:110: first defined here
   ld: mm/mprotect.o: in function `memtier_get_total_weight':
>> include/linux/memory-tiers.h:115: multiple definition of `memtier_get_total_weight'; kernel/sched/fair.o:include/linux/memory-tiers.h:115: first defined here


vim +110 include/linux/memory-tiers.h

   105	
   106	unsigned char memtier_get_node_weight(int from_node, int target_node,
   107					      nodemask_t *pol_nodes)
   108	{
   109		return 0;
 > 110	}
   111	
   112	unsigned int memtier_get_total_weight(int from_node, nodemask_t *pol_nodes)
   113	{
   114		return 0;
 > 115	}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
