Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D52AE90
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727642658; cv=none; b=jd4OCU2wYgfp5LFnc5+MaNf6YMsz9VUtbWF7VG9PG69omwlcahdMu7DnDqiPd+Is5WUJeMBrvCSiDmbEduKgRw9s5T2cbi+VWTYdffGWi+w9FwXyB6ViRjU2UvEChx3h3oOdp0pL1EQnoeZqXCETnNI0wcIINFps93Ip+50POVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727642658; c=relaxed/simple;
	bh=6uQp9zhcTSuxYExxLgJmNWPqKyeNLIv9uECjgq97N+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BmJtc8CQHgwRkfNrNLGV4yCslwQV7C5kY3wQaVcHBmlvgoNskVbtKT++eUDT0ls+HZxngqc6VIwOtQUO6RABPxC8Y0vKmOh3sD2GiH9obgQduL0fdVY6uJbpk+lrMTyFEVsBuXu2QaIzbn2hLozqf+It3z52+X2+tw31h57ms7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASl2YyOL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASl2YyOL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727642657; x=1759178657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uQp9zhcTSuxYExxLgJmNWPqKyeNLIv9uECjgq97N+k=;
  b=ASl2YyOLpG3MFCjDn+zd6U0sjMVMyGQFhx8bMtEzZQhP3dXPD2ywwb3q
   pPRzEoPwP43GW8bzHUZUctv48X1f4aMsXgdavI/KvBqx1f0GxGF9x9mbL
   rsiEtR0YSbhteHk107dS285N76i4nAIUcW3aNtm1G2JPAFLZRMKFFqRbG
   4Py5ojt56TjMlbHdztvyD5brp9Svd0Uj1vBJOD/fiBGkoaxlGQowrEX+X
   Jr18JyxtXNWJevMjE16iFgMvi2vD6fvBn2Cu++Faac5zX0gBD0U0HFRns
   /8NiTdAsagRCGZ2ihxzXjdA3NcILkX92iiY32h85PtfvDkJNFkSB+Ifry
   A==;
X-CSE-ConnectionGUID: Sxv+NpcpQ7+6YH0ivJjsow==
X-CSE-MsgGUID: wITIbN8HTgmlwCSt1Ujedg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="26817195"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="26817195"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:44:16 -0700
X-CSE-ConnectionGUID: 3UCwXA91RMqNhUNACTK8zw==
X-CSE-MsgGUID: Uhgm8fJAQX+jF179WUs3Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73066201"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 13:44:12 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv0m2-000Ohj-0k;
	Sun, 29 Sep 2024 20:44:10 +0000
Date: Mon, 30 Sep 2024 04:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 12004/12031] mm/memcontrol.c:7125:6: warning: no
 previous prototype for 'charge_dying_memcgs'
Message-ID: <202409300458.ikC3QeVe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   6c7ba3824d4ec8a20ab384fa7b838eeb7e5b4e5f
commit: b82ababba602b5f41111a137add5088358ec2862 [12004/12031] rue/mm: introduce new feature to async clean dying memcgs
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240930/202409300458.ikC3QeVe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300458.ikC3QeVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300458.ikC3QeVe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memcontrol.c:3008:6: warning: no previous prototype for 'memory_qos_update' [-Wmissing-prototypes]
    3008 | void memory_qos_update(void)
         |      ^~~~~~~~~~~~~~~~~
   mm/memcontrol.c:3023:5: warning: no previous prototype for 'memory_qos_prio_reclaim_ratio_update' [-Wmissing-prototypes]
    3023 | int memory_qos_prio_reclaim_ratio_update(void)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c:3128:5: warning: no previous prototype for 'mem_cgroup_notify_prio_change' [-Wmissing-prototypes]
    3128 | int mem_cgroup_notify_prio_change(struct cgroup_subsys_state *css,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/memcontrol.c: In function 'mem_cgroup_shrink_pagecache':
   mm/memcontrol.c:4221:63: warning: variable 'pre_used' set but not used [-Wunused-but-set-variable]
    4221 |         unsigned long pages_used, pages_max, goal_pages_used, pre_used;
         |                                                               ^~~~~~~~
   mm/memcontrol.c: At top level:
   mm/memcontrol.c:4378:15: warning: no previous prototype for 'mem_cgroup_pagecache_get_reclaim_pages' [-Wmissing-prototypes]
    4378 | unsigned long mem_cgroup_pagecache_get_reclaim_pages(struct mem_cgroup *memcg)
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:7125:6: warning: no previous prototype for 'charge_dying_memcgs' [-Wmissing-prototypes]
    7125 | void charge_dying_memcgs(struct mem_cgroup *memcg)
         |      ^~~~~~~~~~~~~~~~~~~
>> mm/memcontrol.c:10131:6: warning: no previous prototype for 'reap_slab' [-Wmissing-prototypes]
   10131 | void reap_slab(struct mem_cgroup *memcg)
         |      ^~~~~~~~~


vim +/charge_dying_memcgs +7125 mm/memcontrol.c

  7124	
> 7125	void charge_dying_memcgs(struct mem_cgroup *memcg)
  7126	{
  7127		if (sysctl_vm_memory_qos == 0)
  7128			return;
  7129	
  7130		if (sysctl_clean_dying_memcg_async == 0)
  7131			return;
  7132	
  7133		if (sysctl_clean_dying_memcg_threshold == 0)
  7134			return;
  7135	
  7136		if (atomic_long_read(&dying_memcgs_count) >=
  7137				sysctl_clean_dying_memcg_threshold) {
  7138			atomic_long_set(&dying_memcgs_count, 0);
  7139			wakeup_kclean_dying_memcg();
  7140		}
  7141	
  7142		memcg->offline_times = jiffies;
  7143		atomic_long_add(1, &dying_memcgs_count);
  7144	}
  7145	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
