Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF131A072A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Mar 2025 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741243545; cv=none; b=XquUKxbty9sW/2SsaboaiOWGpJG+1OnU18qcn2tYawMVotqlSpoU9szL6ATBFTiSLmeA3hoY8cteGlqVkjjHkFg28Rv+pfBMP+l0CcndsmNlAPRU48tYEMzG3Sck8FmTpcB/Klfpxa6j8syATOfnh3hTnUbZopce19ZsWwoUYnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741243545; c=relaxed/simple;
	bh=zPKzixrbWt/0jC5xjZvR3uCU/HmgwthJ5OzqBly9wvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kZCLfC4YJLOZBGU2AVPNaR5vAlHRwcyNPyb8UmXdU6/Mq1sHCXEI/ZhggwTtZfdFGZWoskBUSXtNfbJwTmwBBczeFZ9F3/xEVeqsAI4Vj/t/iJM1A3H7Fgs0SJV/qhFHKbq4ZsIeQKVytxlR1IJ74KII3dUO5GdBxEMSzst3kvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MyUog/z1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MyUog/z1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741243543; x=1772779543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPKzixrbWt/0jC5xjZvR3uCU/HmgwthJ5OzqBly9wvE=;
  b=MyUog/z1lY9sr1vWs4/+qDyH1i0Jaf6Kqt2geJQ7ZkiCngvGj/dSdREx
   0WfcbvftbbubF4HXQh3S1Ja/ex6KcbDKB+Mg4RUO+FPwZ9FBbP6e/HGEV
   FNneBDgfIqqudamCarD9IoTtUKaXo0l4e1dGq+5+ebuxSHYA9drsXDe8g
   wXx0sMRJmeBdLhYxXmG/1MAtalyBaTuLnqiaffeyKUPbLpPNEPk73FLGT
   SrpHLHtbXby/Ndns8ujQ5dDnrXIzNeND4kCvxYOPprOA4f11rdHWurIz+
   BsraxG+kgwkWOB1QGrZa3UkcjwkZsnIUMcz47toHB+Z87m/X0TdHVjKUE
   A==;
X-CSE-ConnectionGUID: RjK5tKf4Sc6jfPn/1tbFlw==
X-CSE-MsgGUID: eZsHgDIERgqk9vVljwBa5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41946881"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="41946881"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 22:45:42 -0800
X-CSE-ConnectionGUID: Jq5buUpqTimv1t7yfaziug==
X-CSE-MsgGUID: kBKxkCwWS6isxAORG0rGxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119620172"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2025 22:45:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq4zD-000MeI-1Y;
	Thu, 06 Mar 2025 06:45:39 +0000
Date: Thu, 6 Mar 2025 14:45:02 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:sched/scx-dlserver-boost 7/7] kernel/sched/core.c:8620:
 undefined reference to `ext_server_init'
Message-ID: <202503061411.p176ccZR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/scx-dlserver-boost
head:   bac6d97ec2be6650f81c945564fcb76669ef4251
commit: bac6d97ec2be6650f81c945564fcb76669ef4251 [7/7] Add a DL server for sched_ext tasks
config: um-randconfig-001-20250306 (https://download.01.org/0day-ci/archive/20250306/202503061411.p176ccZR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061411.p176ccZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503061411.p176ccZR-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: kernel/sched/core.o: in function `sched_init':
>> kernel/sched/core.c:8620: undefined reference to `ext_server_init'
   collect2: error: ld returned 1 exit status


vim +8620 kernel/sched/core.c

  8580	
  8581	#ifdef CONFIG_RT_GROUP_SCHED
  8582			/*
  8583			 * This is required for init cpu because rt.c:__enable_runtime()
  8584			 * starts working after scheduler_running, which is not the case
  8585			 * yet.
  8586			 */
  8587			rq->rt.rt_runtime = global_rt_runtime();
  8588			init_tg_rt_entry(&root_task_group, &rq->rt, NULL, i, NULL);
  8589	#endif
  8590	#ifdef CONFIG_SMP
  8591			rq->sd = NULL;
  8592			rq->rd = NULL;
  8593			rq->cpu_capacity = SCHED_CAPACITY_SCALE;
  8594			rq->balance_callback = &balance_push_callback;
  8595			rq->active_balance = 0;
  8596			rq->next_balance = jiffies;
  8597			rq->push_cpu = 0;
  8598			rq->cpu = i;
  8599			rq->online = 0;
  8600			rq->idle_stamp = 0;
  8601			rq->avg_idle = 2*sysctl_sched_migration_cost;
  8602			rq->max_idle_balance_cost = sysctl_sched_migration_cost;
  8603	
  8604			INIT_LIST_HEAD(&rq->cfs_tasks);
  8605	
  8606			rq_attach_root(rq, &def_root_domain);
  8607	#ifdef CONFIG_NO_HZ_COMMON
  8608			rq->last_blocked_load_update_tick = jiffies;
  8609			atomic_set(&rq->nohz_flags, 0);
  8610	
  8611			INIT_CSD(&rq->nohz_csd, nohz_csd_func, rq);
  8612	#endif
  8613	#ifdef CONFIG_HOTPLUG_CPU
  8614			rcuwait_init(&rq->hotplug_wait);
  8615	#endif
  8616	#endif /* CONFIG_SMP */
  8617			hrtick_rq_init(rq);
  8618			atomic_set(&rq->nr_iowait, 0);
  8619			fair_server_init(rq);
> 8620			ext_server_init(rq);
  8621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
