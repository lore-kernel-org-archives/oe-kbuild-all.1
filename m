Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24BE1E868
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 01:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765588731; cv=none; b=kYz3bAV+cDtoPCAVtKZoW5CtPOI85ok3XbPt9UzmJWGMArBLsDwVSCTIVVJL+kZwcr3EDiiGqP6pm4a5Az7kv3LbNRBnI6WDUsvgcHjE9/VeUA55mBUs92bkdIYFHwqXFuN+ClYV8NzlCfFFMgMqjtMiPdE7W/JI985L5QVNadk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765588731; c=relaxed/simple;
	bh=rpHhp592GOhxEAYcytQcxElS3+sF9bqigF2hvPS2FIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V2Z/uNk4pVxk2PZ+Hfj+KoJBsJogg2Cm5Mphp5iWSRmm/0JhtdxlObO9Alj6XE+k2boBfGzi0pCpDsTpzqcVOYibnMwVrKBwKP9gSXLGgW0BX+a/7N85+i5HJS3RKRna2mrNg0m330YoAMlVlVgrGpj5GjQg/DZ4er3dHBAIyJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JLqwAuUf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JLqwAuUf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765588729; x=1797124729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rpHhp592GOhxEAYcytQcxElS3+sF9bqigF2hvPS2FIA=;
  b=JLqwAuUfyDFrN1QdDd0B2N2akjxzR2AHvrKrmGZZvm9GG2L4le0bjZ3M
   XUjSp+r+5GbMUKr5BNqYux+I6pPCIabB4bMGj9WB2BbhfRrqP3iAzU4RM
   kMiEEJunPMH76lNpPEKrGmY/8uvJtQPS3oXJwQZQ8Wj7imhBeKaQS91KD
   6ECA8uP/qDAfOmKp5VxnDeTZLo5mJO/h+BqaNyQ2stCPcxeoKBRyhVARX
   2FtlvPp48NsvfhxEmr1Jv/qZSomEJBiUgfJa0iRXi2lJ/nejS9lumdokn
   vo/b1b9dQdMwgsO9abnp8278D0SOe/W7FlHfFFK30WeXklzd2PavvEzo6
   g==;
X-CSE-ConnectionGUID: LdMUwpn3QRCefmoAb+QJLg==
X-CSE-MsgGUID: dQ9yx8QeTG+pyl0mV+aXHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67469845"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67469845"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 17:18:47 -0800
X-CSE-ConnectionGUID: 9pQ+XrNTQy2l4hBIvxysRg==
X-CSE-MsgGUID: UGb0k8x2R6mbKglhX2zV4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="201711638"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 17:18:46 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUEHT-000000006sf-2v7l;
	Sat, 13 Dec 2025 01:18:43 +0000
Date: Sat, 13 Dec 2025 09:18:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 kernel/power/energy_model.c:647:16: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202512130948.dUrNQgOh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5580efd2c7e4791254a0c26f9791aaa33dd70484
commit: 3a386e98188d75e563a10abeaa1c69847302d481 [0/1] UPSTREAM: PM: EM: Support late CPUs booting and capacity adjustment
config: x86_64-randconfig-121-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130948.dUrNQgOh-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130948.dUrNQgOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130948.dUrNQgOh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/energy_model.c:117:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:117:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:117:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:118:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:118:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:118:15: sparse:     got struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:126:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:126:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:126:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:128:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:128:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:128:19: sparse:     got struct callback_head [noderef] __rcu *
   kernel/power/energy_model.c:139:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:139:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:139:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:157:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void * @@
   kernel/power/energy_model.c:157:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:157:15: sparse:     got void *
   kernel/power/energy_model.c:161:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:161:20: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:161:20: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:270:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:270:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:270:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:275:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:275:45: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:275:45: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:295:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:295:9: sparse:     expected void const *
   kernel/power/energy_model.c:295:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:295:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const * @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:295:9: sparse:     expected void const *
   kernel/power/energy_model.c:295:9: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:295:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *p @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:295:9: sparse:     expected void *p
   kernel/power/energy_model.c:295:9: sparse:     got struct em_perf_state [noderef] __rcu *
>> kernel/power/energy_model.c:647:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_state *new_ps @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:647:16: sparse:     expected struct em_perf_state *new_ps
   kernel/power/energy_model.c:647:16: sparse:     got struct em_perf_state [noderef] __rcu *

vim +647 kernel/power/energy_model.c

   628	
   629	/*
   630	 * Adjustment of CPU performance values after boot, when all CPUs capacites
   631	 * are correctly calculated.
   632	 */
   633	static void em_adjust_new_capacity(struct device *dev,
   634					   struct em_perf_domain *pd,
   635					   u64 max_cap)
   636	{
   637		struct em_perf_table __rcu *em_table;
   638		struct em_perf_state *ps, *new_ps;
   639		int ret, ps_size;
   640	
   641		em_table = em_table_alloc(pd);
   642		if (!em_table) {
   643			dev_warn(dev, "EM: allocation failed\n");
   644			return;
   645		}
   646	
 > 647		new_ps = em_table->state;
   648	
   649		rcu_read_lock();
   650		ps = em_perf_state_from_pd(pd);
   651		/* Initialize data based on old table */
   652		ps_size = sizeof(struct em_perf_state) * pd->nr_perf_states;
   653		memcpy(new_ps, ps, ps_size);
   654	
   655		rcu_read_unlock();
   656	
   657		em_init_performance(dev, pd, new_ps, pd->nr_perf_states);
   658		ret = em_compute_costs(dev, new_ps, NULL, pd->nr_perf_states,
   659				       pd->flags);
   660		if (ret) {
   661			dev_warn(dev, "EM: compute costs failed\n");
   662			return;
   663		}
   664	
   665		ret = em_dev_update_perf_domain(dev, em_table);
   666		if (ret)
   667			dev_warn(dev, "EM: update failed %d\n", ret);
   668	
   669		/*
   670		 * This is one-time-update, so give up the ownership in this updater.
   671		 * The EM framework has incremented the usage counter and from now
   672		 * will keep the reference (then free the memory when needed).
   673		 */
   674		em_table_free(em_table);
   675	}
   676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
