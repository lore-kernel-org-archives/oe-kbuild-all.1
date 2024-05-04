Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE317E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 04:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714796358; cv=none; b=gd3iHBEU8A7cBOGA8epGfJq1Vd0TumuDOZwrmzu7hztkJPpCHv6UdSiQCrk/sXiu59xztqdhkGjmkCAY9YnzIN/cEcaP4qfRAFFAm8oC7wxmkBF8ILoKdyTo9NUVcN5sUAEdlXCi4wHrGWwooJ+3ru7pSDUsPMcI33eL55Udz9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714796358; c=relaxed/simple;
	bh=kjw/Ctz7DBFax0OpOUepM/lq/9FYrQ887EyG6IhbHaM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gneeUaRZ0vNUogjhgVSAn81htqYjwluPB+jq4GNZulHZPEYy5weQ+YlW2NqJoBNfxuxllxaxX/j61AvXmMRRelKIBD5Qm4CVhQ85LgrfMHWKvIChMTSkIwnqD2mLuMfjVl2P/HLFMnf7prBGIxNGT9+dMAUL464UuSlEEcQkMys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U7FMijFj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U7FMijFj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714796356; x=1746332356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjw/Ctz7DBFax0OpOUepM/lq/9FYrQ887EyG6IhbHaM=;
  b=U7FMijFjH52Jz0X23GkjUcDmBT9PEVBAL00CJh7jSQWrJUKuagbceK0P
   gZwgITGYEc/co/eLaiuZwTUVOjzZZb3VNcOVGsS2IqvUrCn2/qDnNraVB
   6F8EQhhEOtFv/8UE9FFO/v+Crop52R0V9Cyd3Kgf6n2v5aAiI3NQKpoBm
   AS4XfCGQlTQU8a/+rXd1s5BF3nhgO9eIVKD8g4RlCvfdzeeysCDrBFHov
   gd1tPlgGORVWdokDuhYsZQLa1XULKXSRqSWKoOv7QuIw61Xcz8D6x4+4K
   7aHolGNeIL7//8pjIa5x0FgioOWz6jIf5ZnR2JeMHCCPKbN5WT4csCaDy
   w==;
X-CSE-ConnectionGUID: LcVI0XBkQoKluXYgQD6axw==
X-CSE-MsgGUID: MufPpP88TVSzUvQfUnrWXQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="36000823"
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="36000823"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 21:19:16 -0700
X-CSE-ConnectionGUID: 7mB2T+56R8GVAZoC/kTneg==
X-CSE-MsgGUID: 8TYoefx2QWaAwRTVbybOgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,252,1708416000"; 
   d="scan'208";a="50829158"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 May 2024 21:19:15 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s36rh-000CQq-0C;
	Sat, 04 May 2024 04:19:13 +0000
Date: Sat, 4 May 2024 12:18:50 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 3/3] mm/memcontrol.c:5423:2: error: call
 to undeclared function 'wb_memcg_offline'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202405041252.UArWv8IN-lkp@intel.com>
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
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240504/202405041252.UArWv8IN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041252.UArWv8IN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041252.UArWv8IN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memcontrol.c:56:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memcontrol.c:5423:2: error: call to undeclared function 'wb_memcg_offline'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    5423 |         wb_memcg_offline(memcg);
         |         ^
   3 warnings and 1 error generated.


vim +/wb_memcg_offline +5423 mm/memcontrol.c

8cdea7c05454260 Balbir Singh       2008-02-07  5398  
eb95419b023abac Tejun Heo          2013-08-08  5399  static void mem_cgroup_css_offline(struct cgroup_subsys_state *css)
df878fb04dea044 KAMEZAWA Hiroyuki  2008-02-07  5400  {
eb95419b023abac Tejun Heo          2013-08-08  5401  	struct mem_cgroup *memcg = mem_cgroup_from_css(css);
3bc942f372af383 Tejun Heo          2013-11-22  5402  	struct mem_cgroup_event *event, *tmp;
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5403  
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5404  	/*
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5405  	 * Unregister events and notify userspace.
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5406  	 * Notify userspace about cgroup removing only after rmdir of cgroup
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5407  	 * directory to avoid race between userspace and kernelspace.
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5408  	 */
4ba9515d32bac1c Shakeel Butt       2021-09-02  5409  	spin_lock_irq(&memcg->event_list_lock);
fba94807837850e Tejun Heo          2013-11-22  5410  	list_for_each_entry_safe(event, tmp, &memcg->event_list, list) {
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5411  		list_del_init(&event->list);
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5412  		schedule_work(&event->remove);
79bd9814e5ec9a2 Tejun Heo          2013-11-22  5413  	}
4ba9515d32bac1c Shakeel Butt       2021-09-02  5414  	spin_unlock_irq(&memcg->event_list_lock);
ec64f51545fffbc KAMEZAWA Hiroyuki  2009-04-02  5415  
bf8d5d52ffe89aa Roman Gushchin     2018-06-07  5416  	page_counter_set_min(&memcg->memory, 0);
230671533d64631 Roman Gushchin     2018-06-07  5417  	page_counter_set_low(&memcg->memory, 0);
63677c745d63ba7 Roman Gushchin     2017-09-06  5418  
a65b0e7607ccb5e Domenico Cerasuolo 2023-11-30  5419  	zswap_memcg_offline_cleanup(memcg);
a65b0e7607ccb5e Domenico Cerasuolo 2023-11-30  5420  
567e9ab2e614e55 Johannes Weiner    2016-01-20  5421  	memcg_offline_kmem(memcg);
a178015cde69981 Yang Shi           2021-05-04  5422  	reparent_shrinker_deferred(memcg);
52ebea749aaed19 Tejun Heo          2015-05-22 @5423  	wb_memcg_offline(memcg);
e4dde56cd208674 Yu Zhao            2022-12-21  5424  	lru_gen_offline_memcg(memcg);
73f576c04b9410e Johannes Weiner    2016-07-20  5425  
591edfb10a949d6 Roman Gushchin     2018-10-26  5426  	drain_all_stock(memcg);
591edfb10a949d6 Roman Gushchin     2018-10-26  5427  
73f576c04b9410e Johannes Weiner    2016-07-20  5428  	mem_cgroup_id_put(memcg);
df878fb04dea044 KAMEZAWA Hiroyuki  2008-02-07  5429  }
df878fb04dea044 KAMEZAWA Hiroyuki  2008-02-07  5430  

:::::: The code at line 5423 was first introduced by commit
:::::: 52ebea749aaed195245701a8f90a23d672c7a933 writeback: make backing_dev_info host cgroup-specific bdi_writebacks

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Jens Axboe <axboe@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
