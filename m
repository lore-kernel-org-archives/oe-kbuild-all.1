Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85B8D524
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 08:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHhHK67C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699519189; x=1731055189;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Y0ADBsC/gHSW8BcJCWyu/JG9lmhQWlM1WdQLwleabko=;
  b=DHhHK67CW4bnqWFuZorf9KHDlvaL6ELmg9DmHUo8jNuvPGaYxY6/QdvD
   L1GuBkHT0pxRYEb6+SJ2H8CnW2NAIsNORvBoVyA7vhE+ggtZCD6nOOQRv
   4rtGgUYQSM5wZ8wGU7FuTTZD9Tj+VexCRGpuCLGNbvOfxP3blMaFSwVCt
   P6wWG+Fi08po9wqmBAndRz7uYpsYwVTJJd7enx3js4SYu/M1W2LM2BsXN
   cJ+pvJXoJ2wtzj4udED5k/LouMFdLYfGf0QuxRXeNQxxzDKoFABkSJKTp
   v4wSQtbmZUNXpLSsLaauj74Pp/gVCwl6Up8dB/IPJHVi6IkAIwr4Dyp/W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2974360"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2974360"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 00:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4670842"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Nov 2023 00:39:48 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r10Zl-0008ai-1V;
	Thu, 09 Nov 2023 08:39:45 +0000
Date: Thu, 9 Nov 2023 16:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry.memverge@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v4 1/3] mm/memcontrol: implement
 memcg.interleave_weights
Message-ID: <202311091652.AOSQhXGV-lkp@intel.com>
References: <20231109002517.106829-2-gregory.price@memverge.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231109002517.106829-2-gregory.price@memverge.com>

Hi Gregory,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on cxl/next]
[also build test ERROR on tj-cgroup/for-next cxl/pending v6.6]
[cannot apply to akpm-mm/mm-everything linus/master next-20231109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gregory-Price/mm-mempolicy-implement-weighted-interleave/20231109-092543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git next
patch link:    https://lore.kernel.org/r/20231109002517.106829-2-gregory.price%40memverge.com
patch subject: [RFC PATCH v4 1/3] mm/memcontrol: implement memcg.interleave_weights
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20231109/202311091652.AOSQhXGV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091652.AOSQhXGV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091652.AOSQhXGV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/alpha/mm/init.c:261:1: warning: no previous prototype for 'srm_paging_stop' [-Wmissing-prototypes]
     261 | srm_paging_stop (void)
         | ^~~~~~~~~~~~~~~
   In file included from include/linux/swap.h:9,
                    from arch/alpha/mm/init.c:20:
>> include/linux/memcontrol.h:1620:21: error: 'mem_cgroup_get_il_weights' defined but not used [-Werror=unused-function]
    1620 | static unsigned int mem_cgroup_get_il_weights(nodemask_t *nodes,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memcontrol.h:1618:22: error: 'mem_cgroup_get_il_weight' defined but not used [-Werror=unused-function]
    1618 | static unsigned char mem_cgroup_get_il_weight(unsigned int nid) { return 0; }
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/mem_cgroup_get_il_weights +1620 include/linux/memcontrol.h

  1617	
> 1618	static unsigned char mem_cgroup_get_il_weight(unsigned int nid) { return 0; }
  1619	
> 1620	static unsigned int mem_cgroup_get_il_weights(nodemask_t *nodes,
  1621						      unsigned char *weights)
  1622	{
  1623		return 0;
  1624	}
  1625	#endif /* CONFIG_MEMCG */
  1626	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
