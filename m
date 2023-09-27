Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92F28DCC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 16:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695833130; x=1727369130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qMoIFwkYdgbgAyojkVUluoIGqN3B+vu33cy6cTldlWI=;
  b=hH4U8ZlRW6zHWM8NlZh4ln0q+13tHr6G4Z73okWfb6ArgMqrB/apP+qO
   02Z1jXkk2EsiV4avt4k8PHZyqhBvkK7Jub6esJycs15SX4WUsBpyeNJ1J
   2hFS9Y20jUJYNmJuc03almYIq+uEDtmH3+7EAE9Ca/gOjqG8w2rtOpFrx
   XwAfj6zCzF84WGfnYvmtU4CgijRfXXl+dCxVgPmIBtXlXJZtPT50Q9pKX
   qcQ6vPwcGgUUzpxj8vEiP4qPP6KacibDhVAzYK6HoII6o0AZelWahzQZJ
   8kevzNGBFOeBTj4Xqj8J17tHk+QaNTkh9cKmDNnhdkvlRbj0X7jVtMuf1
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3409643"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="3409643"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="819499719"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="819499719"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 27 Sep 2023 09:45:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlXfB-0000Rt-1D;
	Wed, 27 Sep 2023 16:45:25 +0000
Date: Thu, 28 Sep 2023 00:45:12 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:kmem_performance.rfc 4/7] mm/memcontrol.c:6916:17: error:
 'mem_cgroup_fork' undeclared here (not in a function); did you mean
 'mem_cgroup_free'?
Message-ID: <202309280001.3XUUG8Ye-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git kmem_performance.rfc
head:   2861702df93fd8d8093e9750f67d57bed3a673c8
commit: 2938aa6b55a86fcc01eac93b94650782d10d7042 [4/7] mm: kmem: add direct objcg pointer to task_struct
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230928/202309280001.3XUUG8Ye-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280001.3XUUG8Ye-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280001.3XUUG8Ye-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/memcontrol.c:6916:17: error: 'mem_cgroup_fork' undeclared here (not in a function); did you mean 'mem_cgroup_free'?
    6916 |         .fork = mem_cgroup_fork,
         |                 ^~~~~~~~~~~~~~~
         |                 mem_cgroup_free
>> mm/memcontrol.c:6917:17: error: 'mem_cgroup_exit' undeclared here (not in a function); did you mean 'mem_cgroup_reset'?
    6917 |         .exit = mem_cgroup_exit,
         |                 ^~~~~~~~~~~~~~~
         |                 mem_cgroup_reset


vim +6916 mm/memcontrol.c

  6900	
  6901	struct cgroup_subsys memory_cgrp_subsys = {
  6902		.css_alloc = mem_cgroup_css_alloc,
  6903		.css_online = mem_cgroup_css_online,
  6904		.css_offline = mem_cgroup_css_offline,
  6905		.css_released = mem_cgroup_css_released,
  6906		.css_free = mem_cgroup_css_free,
  6907		.css_reset = mem_cgroup_css_reset,
  6908		.css_rstat_flush = mem_cgroup_css_rstat_flush,
  6909		.can_attach = mem_cgroup_can_attach,
  6910	#if defined(CONFIG_LRU_GEN) || defined(CONFIG_MEMCG_KMEM)
  6911		.attach = mem_cgroup_attach,
  6912	#endif
  6913		.cancel_attach = mem_cgroup_cancel_attach,
  6914		.post_attach = mem_cgroup_move_task,
  6915	#ifdef CONFIG_MEMCG_KMEM
> 6916		.fork = mem_cgroup_fork,
> 6917		.exit = mem_cgroup_exit,
  6918	#endif
  6919		.dfl_cftypes = memory_files,
  6920		.legacy_cftypes = mem_cgroup_legacy_files,
  6921		.early_init = 0,
  6922	};
  6923	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
