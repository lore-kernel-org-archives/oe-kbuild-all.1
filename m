Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754A01CA92
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 11:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714823191; cv=none; b=YOLq52ffGTmf22o5kYRWdGDyQzjg33IxanJkkObUswCrFZoE0ig8/IcOqh/ELxumU9HmkR02825OZQ1pmqFlcSYuYcYzpQ5PaACiAUq+Yg3FhjPL9j+AOfh+1Yq8VfOHWVgy9icDjXvDu9+dfGvH2C0LqYr8WJDufFL5VNhCYwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714823191; c=relaxed/simple;
	bh=AOm1saOsOtx8BKB++2PRDP5SkMknlvI1GZi1Ez9NtjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q+psXk4HdJSqSTnyl5ShcYb4LrJbv2jAgCVtjUuc2qtUijZii2JT4QTJhxHVI2O1CsOzZWOTznKsfXf7HaN9i4wqAKHI+YaB6BsljosCzRUirySw6XBgHIJYTPVmzHDhFs4X51KhfZK3t4rdHm+H9OnrcOC4R9gEU5VISmnC2MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJgp1z8H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJgp1z8H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714823189; x=1746359189;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOm1saOsOtx8BKB++2PRDP5SkMknlvI1GZi1Ez9NtjY=;
  b=RJgp1z8H0u98s6AVTU3qhDUb2G1wFF4IYQsOizqC0Br24QsQHvFxRwu2
   HmKvIIaRJs9nMO4cG1wDEOiYPR1xycJWT3yvxc0s9gpmHDjoU9pogP8rS
   Qn9psLwilvG6zdKCtB40UHgg7PrhMzGbJeE3C1Cr1KFuIF0NV+nyxcXdp
   9HfCMh6IvBsHSzosHrkXu9nxcy+ib7WcKYMp5K5rVLbEJBIZlgOBeCkWB
   50rJPexP3MBZ86pEJ6HrplA9YwrYkmvSAf0+drJhAC8SRITkg65BGtjhZ
   HkHsxbrUAnk1cX1Lsoywt2lT/JyOH6QWMPemhyEPICneXcTChY8uRJV5u
   A==;
X-CSE-ConnectionGUID: LoKiQ5O0QXGSBM73mP8hgg==
X-CSE-MsgGUID: JapPWfkCSjKq/Wm5QCsdAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="28100180"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="28100180"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 04:46:29 -0700
X-CSE-ConnectionGUID: NO/y/hraTTilJHqClM4pKg==
X-CSE-MsgGUID: ZZKW190BQFu5AFpddaizRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="58605923"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 04 May 2024 04:46:28 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3DqT-000CjW-1l;
	Sat, 04 May 2024 11:46:25 +0000
Date: Sat, 4 May 2024 19:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 3/3] mm/memcontrol.c:5423:2: error:
 implicit declaration of function 'wb_memcg_offline'; did you mean
 'device_offline'?
Message-ID: <202405041951.pf3TIyPE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   c5d0efd9ad4acbcf666aed6e47e15d1feefa4ff0
commit: c5d0efd9ad4acbcf666aed6e47e15d1feefa4ff0 [3/3] mm: memcg: move charge migration code to memcontrol-v1.c
config: x86_64-buildonly-randconfig-001-20240504 (https://download.01.org/0day-ci/archive/20240504/202405041951.pf3TIyPE-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041951.pf3TIyPE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041951.pf3TIyPE-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memcontrol.c: In function 'mem_cgroup_css_offline':
>> mm/memcontrol.c:5423:2: error: implicit declaration of function 'wb_memcg_offline'; did you mean 'device_offline'? [-Werror=implicit-function-declaration]
     wb_memcg_offline(memcg);
     ^~~~~~~~~~~~~~~~
     device_offline
   cc1: some warnings being treated as errors


vim +5423 mm/memcontrol.c

8cdea7c0545426 Balbir Singh       2008-02-07  5398  
eb95419b023aba Tejun Heo          2013-08-08  5399  static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
df878fb04dea04 KAMEZAWA Hiroyuki  2008-02-07  5400  {
eb95419b023aba Tejun Heo          2013-08-08  5401  	struct mem_cgroup *memcg = mem_cgroup_from_css(css);
3bc942f372af38 Tejun Heo          2013-11-22  5402  	struct mem_cgroup_event *event, *tmp;
79bd9814e5ec9a Tejun Heo          2013-11-22  5403  
79bd9814e5ec9a Tejun Heo          2013-11-22  5404  	/*
79bd9814e5ec9a Tejun Heo          2013-11-22  5405  	 * Unregister events and notify userspace.
79bd9814e5ec9a Tejun Heo          2013-11-22  5406  	 * Notify userspace about cgroup removing only after rmdir of cgroup
79bd9814e5ec9a Tejun Heo          2013-11-22  5407  	 * directory to avoid race between userspace and kernelspace.
79bd9814e5ec9a Tejun Heo          2013-11-22  5408  	 */
4ba9515d32bac1 Shakeel Butt       2021-09-02  5409  	spin_lock_irq(&memcg->event_list_lock);
fba94807837850 Tejun Heo          2013-11-22  5410  	list_for_each_entry_safe(event, tmp, &memcg->event_list, list) {
79bd9814e5ec9a Tejun Heo          2013-11-22  5411  		list_del_init(&event->list);
79bd9814e5ec9a Tejun Heo          2013-11-22  5412  		schedule_work(&event->remove);
79bd9814e5ec9a Tejun Heo          2013-11-22  5413  	}
4ba9515d32bac1 Shakeel Butt       2021-09-02  5414  	spin_unlock_irq(&memcg->event_list_lock);
ec64f51545fffb KAMEZAWA Hiroyuki  2009-04-02  5415  
bf8d5d52ffe89a Roman Gushchin     2018-06-07  5416  	page_counter_set_min(&memcg->memory, 0);
230671533d6463 Roman Gushchin     2018-06-07  5417  	page_counter_set_low(&memcg->memory, 0);
63677c745d63ba Roman Gushchin     2017-09-06  5418  
a65b0e7607ccb5 Domenico Cerasuolo 2023-11-30  5419  	zswap_memcg_offline_cleanup(memcg);
a65b0e7607ccb5 Domenico Cerasuolo 2023-11-30  5420  
567e9ab2e614e5 Johannes Weiner    2016-01-20  5421  	memcg_offline_kmem(memcg);
a178015cde6998 Yang Shi           2021-05-04  5422  	reparent_shrinker_deferred(memcg);
52ebea749aaed1 Tejun Heo          2015-05-22 @5423  	wb_memcg_offline(memcg);
e4dde56cd20867 Yu Zhao            2022-12-21  5424  	lru_gen_offline_memcg(memcg);
73f576c04b9410 Johannes Weiner    2016-07-20  5425  
591edfb10a949d Roman Gushchin     2018-10-26  5426  	drain_all_stock(memcg);
591edfb10a949d Roman Gushchin     2018-10-26  5427  
73f576c04b9410 Johannes Weiner    2016-07-20  5428  	mem_cgroup_id_put(memcg);
df878fb04dea04 KAMEZAWA Hiroyuki  2008-02-07  5429  }
df878fb04dea04 KAMEZAWA Hiroyuki  2008-02-07  5430  

:::::: The code at line 5423 was first introduced by commit
:::::: 52ebea749aaed195245701a8f90a23d672c7a933 writeback: make backing_dev_info host cgroup-specific bdi_writebacks

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
