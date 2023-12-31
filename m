Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849004422
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1S84PVT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704027667; x=1735563667;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Af635/0t2qnWXLV9r6XeVNYu0XH89EHW6zfiQ9GXKMI=;
  b=B1S84PVT+F31LClHLZ926ETMGvh6S2fVCj93tVYuh0o84ST1BawGAuqp
   kC4+LUYekZ2me/kpb+SOcl3IOl+BOqgQ1vcpHwehruDAPy94Q8rIP60Mv
   MVxGNCXkFR/a+0VflK2X4D26juCrRZHjY+14cFx7rzRwdcdcddyJV08di
   o4vfSctdC8QkGZwWFCDdyllVJ8/F+zlan2QJwrKTjYY8lQszX4gUru/f4
   ORq7TrqvmKSOkHSlnm7Q0ou7F/BNMe96zB6qfaaDZiXPk/cBSimEiWb4e
   bCk1r2bjygk59Aul6nc43pxXJpu7rxQMUwQsCGg4vd5Kbu2GaUl21E6sk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="376900885"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="376900885"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2023 05:01:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="755456956"
X-IronPort-AV: E=Sophos;i="6.04,320,1695711600"; 
   d="scan'208";a="755456956"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Dec 2023 05:01:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJvR8-000JRs-1m;
	Sun, 31 Dec 2023 13:01:02 +0000
Date: Sun, 31 Dec 2023 21:00:44 +0800
From: kernel test robot <lkp@intel.com>
To: Bin Lai <robinlai@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev,
	kaixuxiakx <60962168+kaixuxiakx@users.noreply.github.com>,
	Munger jiang <mungerjiang@tencent.com>
Subject: kernel/cgroup/sli.c:456:44: warning: implicit conversion from 'enum
 sli_schedlat_stat_item' to 'enum sli_memlat_stat_item'
Message-ID: <202312312017.RBsPqk2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: b879b1b64bf83919b5ebff080d4a2f6dda524181 sli: Introduce memory and sched latency stat infrastructure
date:   2 years, 2 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20231231/202312312017.RBsPqk2C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312312017.RBsPqk2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312312017.RBsPqk2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/cgroup/sli.c: In function 'get_schedlat_count_idx':
   kernel/cgroup/sli.c:249:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     249 |                 idx = SCHEDLAT_0_1;
         |                     ^
   kernel/cgroup/sli.c:251:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     251 |                 idx = SCHEDLAT_1_5;
         |                     ^
   kernel/cgroup/sli.c:253:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     253 |                 idx = SCHEDLAT_5_10;
         |                     ^
   kernel/cgroup/sli.c:255:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     255 |                 idx = SCHEDLAT_10_20;
         |                     ^
   kernel/cgroup/sli.c:257:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     257 |                 idx = SCHEDLAT_20_30;
         |                     ^
   kernel/cgroup/sli.c:259:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     259 |                 idx = SCHEDLAT_30_40;
         |                     ^
   kernel/cgroup/sli.c:261:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     261 |                 idx = SCHEDLAT_40_50;
         |                     ^
   kernel/cgroup/sli.c:263:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     263 |                 idx = SCHEDLAT_50_60;
         |                     ^
   kernel/cgroup/sli.c:265:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     265 |                 idx = SCHEDLAT_60_70;
         |                     ^
   kernel/cgroup/sli.c:267:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     267 |                 idx = SCHEDLAT_70_80;
         |                     ^
   kernel/cgroup/sli.c:269:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     269 |                 idx = SCHEDLAT_80_90;
         |                     ^
   kernel/cgroup/sli.c:271:21: warning: implicit conversion from 'enum sli_schedlat_count' to 'enum sli_memlat_count' [-Wenum-conversion]
     271 |                 idx = SCHEDLAT_90_100;
         |                     ^
   kernel/cgroup/sli.c: In function 'sli_memlat_thr_write':
   kernel/cgroup/sli.c:423:17: warning: the comparison will always evaluate as 'true' for the address of 'member' will never be NULL [-Waddress]
     423 |         for ( ; memlat_member_offset[i].member ; i++) {
         |                 ^~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c:18:14: note: 'member' declared here
      18 |         char member[LINE_SIZE];
         |              ^~~~~~
   kernel/cgroup/sli.c: In function 'sli_schedlat_stat':
>> kernel/cgroup/sli.c:456:44: warning: implicit conversion from 'enum sli_schedlat_stat_item' to 'enum sli_memlat_stat_item' [-Wenum-conversion]
     456 |         threshold = get_schedlat_threshold(sidx);
         |                                            ^~~~
   kernel/cgroup/sli.c:457:14: warning: implicit conversion from 'enum sli_memlat_count' to 'enum sli_schedlat_count' [-Wenum-conversion]
     457 |         cidx = get_schedlat_count_idx(delta);
         |              ^
   kernel/cgroup/sli.c: In function 'sli_schedlat_syscall_stat':
   kernel/cgroup/sli.c:499:44: warning: implicit conversion from 'enum sli_schedlat_stat_item' to 'enum sli_memlat_stat_item' [-Wenum-conversion]
     499 |         threshold = get_schedlat_threshold(sidx);
         |                                            ^~~~
   kernel/cgroup/sli.c:500:14: warning: implicit conversion from 'enum sli_memlat_count' to 'enum sli_schedlat_count' [-Wenum-conversion]
     500 |         cidx = get_schedlat_count_idx(delta);
         |              ^
   kernel/cgroup/sli.c: In function 'sli_schedlat_stat_show':
   kernel/cgroup/sli.c:596:56: warning: implicit conversion from 'enum sli_schedlat_stat_item' to 'enum sli_memlat_stat_item' [-Wenum-conversion]
     596 |                 seq_printf(m,"%s:\n",get_schedlat_name(sidx));
         |                                                        ^~~~
   kernel/cgroup/sli.c: In function 'sli_schedlat_thr_write':
   kernel/cgroup/sli.c:679:17: warning: the comparison will always evaluate as 'true' for the address of 'member' will never be NULL [-Waddress]
     679 |         for ( ; schedlat_member_offset[i].member ; i++) {
         |                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c:18:14: note: 'member' declared here
      18 |         char member[LINE_SIZE];
         |              ^~~~~~


vim +456 kernel/cgroup/sli.c

   445	
   446	void sli_schedlat_stat(struct task_struct *task,enum sli_schedlat_stat_item sidx, u64 delta)
   447	{
   448		enum sli_schedlat_count cidx;
   449		struct mem_cgroup *memcg;
   450		struct cgroup *cgrp;
   451		u64 threshold;
   452	
   453		if (static_branch_likely(&sli_no_enabled) || !task)
   454			return;
   455	
 > 456		threshold = get_schedlat_threshold(sidx);
   457		cidx = get_schedlat_count_idx(delta);
   458	
   459		rcu_read_lock();
   460		memcg = mem_cgroup_from_task(task);
   461		if (!memcg || memcg == root_mem_cgroup ) {
   462			rcu_read_unlock();
   463			return;
   464		}
   465		cgrp = memcg->css.cgroup;
   466	
   467		if (cgrp && cgrp->sli_schedlat_stat_percpu) {
   468			this_cpu_inc(cgrp->sli_schedlat_stat_percpu->item[sidx][cidx]);
   469			if (delta >= threshold)
   470				store_task_stack(cgrp,task,delta);
   471		}
   472		rcu_read_unlock();
   473	}
   474	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
