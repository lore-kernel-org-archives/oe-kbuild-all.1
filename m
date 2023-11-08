Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CC9CA58
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 06:10:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYDYbLYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699423856; x=1730959856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dWNBsMPQOoRgiY7rx1DGU+kkx0cHzZ/piLanJKT/bkw=;
  b=nYDYbLYR47aF2sMVeEKP4kkSaDx9vqVAdWMwJkL4aYGXGC7EUI7Cpixj
   XHAsd+JDtvCOKNKdyEvwd0JHzAgthQbVkpcPTl4DIyHzkKbL4QOedKd6e
   3/9m57nTVCaDVOnY/vAD/T+xbhXSYnzYwDgu9pSyqaYgiBFOXF74OhTqS
   sUSolKEPMlpAU4wmP+MgjS9Vc6YHF4T3ju8Feoxx3T38vGi2/TFQzE92l
   5K+WLE0fvk1TE3HuXMpsDtf/y8CsB3sK0b3ZadeJlVzQ9mZno17BsY34H
   TzgFz9eqNepl7vSmnqTMd8Ajbkvb/GWTxnVOId2gpGmRcsKC7BUXZoQkS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="456194189"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="456194189"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 22:10:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="886565346"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="886565346"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Nov 2023 22:10:54 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bm7-0007j6-2U;
	Wed, 08 Nov 2023 06:10:51 +0000
Date: Wed, 8 Nov 2023 14:10:28 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:patchset/meminfo/v2.1 1/1] mm/memcontrol.c:4065:37: error:
 implicit declaration of function 'mem_cgroup_node_nr_lru_pages'; did you
 mean 'mem_cgroup_get_nr_swap_pages'?
Message-ID: <202311081319.IL9Dao2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git patchset/meminfo/v2.1
head:   6d731510698c5bcb25383ef6ccb28a36c1ea4261
commit: 6d731510698c5bcb25383ef6ccb28a36c1ea4261 [1/1] proc: Implement /proc/self/meminfo
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231108/202311081319.IL9Dao2C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081319.IL9Dao2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081319.IL9Dao2C-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'mem_cgroup_nr_pages':
>> mm/memcontrol.c:4065:37: error: implicit declaration of function 'mem_cgroup_node_nr_lru_pages'; did you mean 'mem_cgroup_get_nr_swap_pages'? [-Werror=implicit-function-declaration]
    4065 |                         pages[i] += mem_cgroup_node_nr_lru_pages(iter, nid, BIT(i), false);
         |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                     mem_cgroup_get_nr_swap_pages
   cc1: some warnings being treated as errors


vim +4065 mm/memcontrol.c

  4057	
  4058	static void mem_cgroup_nr_pages(struct mem_cgroup *memcg, int nid, unsigned long *pages)
  4059	{
  4060		struct mem_cgroup *iter;
  4061		int i;
  4062	
  4063		for_each_mem_cgroup_tree(iter, memcg) {
  4064			for (i = 0; i < NR_LRU_LISTS; i++)
> 4065				pages[i] += mem_cgroup_node_nr_lru_pages(iter, nid, BIT(i), false);
  4066		}
  4067	}
  4068	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
