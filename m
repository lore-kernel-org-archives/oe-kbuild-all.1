Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEF191548F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAU9LVqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704972516; x=1736508516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iMqxYPir7oCTKn72DG5YLXBoJ0B666eQgQ6OK/rxznQ=;
  b=LAU9LVqoPBMkaQAZN1LXtSV9cESfF6okT8sZa3kdQFNYiJ+nHOSvyDlr
   37wRhXe98mTwiZGC6XxoV8AZrSdOaLB25SGLAOyVryleCL/cb2SAJ2oDg
   e2ta8XuiY3sbJTZnZkP29j9NNyJzXcR+Re51UAfvODgZzw1NQnsQ1Iriq
   eyRNasqWpNT3mlxHCvdD/E9crvjgG3A3y6oxmHMkLiqte/ECdG0sx6uTn
   r8kgmSg5cV3hIAf0vpqb5197Zft3RSnPo9o/erHY7K3oMjG48H4vddeIA
   n1NYG22CJlNe7q8aiPEl3yrnkAalEZjkTHu36K851UtpX9bhth3WcOSS0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="398509579"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="398509579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 03:28:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="30969502"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 11 Jan 2024 03:28:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNtEd-0008C4-2c;
	Thu, 11 Jan 2024 11:28:31 +0000
Date: Thu, 11 Jan 2024 19:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1774/2336] kernel/livepatch/core.c:2020:13:
 warning: no previous prototype for 'arch_klp_set_brk_func'
Message-ID: <202401111910.XufUusNC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cb3c3cb3ca9a0b06f501ef5e486aaf18220ac7a9
commit: 470628a716984e1325b92bef4fa2140ff5a062a5 [1774/2336] livepatch: Use breakpoint exception to optimize enabling livepatch
config: x86_64-openeuler_defconfig (https://download.01.org/0day-ci/archive/20240111/202401111910.XufUusNC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401111910.XufUusNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401111910.XufUusNC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/livepatch/core.c:1728:12: warning: no previous prototype for 'arch_klp_check_activeness_func' [-Wmissing-prototypes]
    1728 | int __weak arch_klp_check_activeness_func(struct klp_func *func, int enable,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:1983:14: warning: no previous prototype for 'arch_klp_mem_alloc' [-Wmissing-prototypes]
    1983 | void __weak *arch_klp_mem_alloc(size_t size)
         |              ^~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:1988:13: warning: no previous prototype for 'arch_klp_mem_free' [-Wmissing-prototypes]
    1988 | void __weak arch_klp_mem_free(void *mem)
         |             ^~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2006:12: warning: no previous prototype for 'arch_klp_check_breakpoint' [-Wmissing-prototypes]
    2006 | int __weak arch_klp_check_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2011:12: warning: no previous prototype for 'arch_klp_add_breakpoint' [-Wmissing-prototypes]
    2011 | int __weak arch_klp_add_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |            ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/livepatch/core.c:2016:13: warning: no previous prototype for 'arch_klp_remove_breakpoint' [-Wmissing-prototypes]
    2016 | void __weak arch_klp_remove_breakpoint(struct arch_klp_data *arch_data, void *old_func)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/livepatch/core.c:2020:13: warning: no previous prototype for 'arch_klp_set_brk_func' [-Wmissing-prototypes]
    2020 | void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
         |             ^~~~~~~~~~~~~~~~~~~~~


vim +/arch_klp_set_brk_func +2020 kernel/livepatch/core.c

  2019	
> 2020	void __weak arch_klp_set_brk_func(struct klp_func_node *func_node, void *new_func)
  2021	{
  2022		func_node->brk_func = new_func;
  2023	}
  2024	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
