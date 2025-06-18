Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630CF28751C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 12:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248831; cv=none; b=RAfNcacQTP0e/1rs4kawg1Cg9PgG0i4uCcAtOX7HVl+YRlqMp3FhGhjetf+T6or5tBH+KCzSRNQFrRQry8bFH3WPLpsKCDAdJXccJPe/lAT4XeYek/LOGsFwYs+ng+xGnxJKqsSrwz94NcTeSTf0YbRi81/Tp9fPmv1D2He53Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248831; c=relaxed/simple;
	bh=3YtM/HYdbChWkgFphRW7tfx2XVge8TytdHpzKrDVEbc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D+AuEhMS75ynsN2IL7oUt3EZcmEor6LgLF4mp9GEiQ4649IoFfYCmAPhX7mtIfgduX4Vpk3zJmo4dVYksr+Eih4cKluxc/yg3Af1vRDaU6xS5mnOn3Z6+++NvYHu98e7KcXS+moEeWSYNWIY+iKC2bIZ18GM2st5M1P8dVFigl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXMZteGQ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXMZteGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750248829; x=1781784829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3YtM/HYdbChWkgFphRW7tfx2XVge8TytdHpzKrDVEbc=;
  b=QXMZteGQyRIT0CVgBkNtuJe6b40qWKvPIhQLXEXxkH0sz9DslAEiTwnf
   LD234NM78UNd+gvqyakKprvhg1cC973xkApiOpoBzfYIXGGDwCRFDmi0I
   OgTwHi9qxP91AFaChyHqCU1ylzArQtUvgLG5dur59OT0ozBdsUaNXd9F/
   NJN6mVh/bPMzCMXtuT+DZeWz/lh9xqQ9TMuAI/mwWTFLKFwoBl7N3sWED
   UQTtCJ0CLTwiE8AfGMBsu5ogKUh7uc6o8WPTXm56da3ki4lchSJU/adxl
   ZUzYbY2Dsu+KFRT7BlBJvm0sX3k8ctC3u208D1xqCp8kgwth+17Ek2E4x
   A==;
X-CSE-ConnectionGUID: Fcn4fthaStaxSz/mUZiswQ==
X-CSE-MsgGUID: ciriknOYQX+J7tQkclCgkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52438817"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52438817"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 05:12:41 -0700
X-CSE-ConnectionGUID: QO1wTg+zRLG0rZ6D9WW0Tw==
X-CSE-MsgGUID: mWgvVP7AQ7uauvfoe1eCnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149930243"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 18 Jun 2025 05:12:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRref-000Jki-22;
	Wed, 18 Jun 2025 12:12:37 +0000
Date: Wed, 18 Jun 2025 20:11:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, zhangchangzhong <zhangchangzhong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1666/1666] kernel/sched/core.c:5976:22:
 error: 'root_task_group' undeclared; did you mean 'task_group'?
Message-ID: <202506182031.ldH7VynO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hui,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   4f84adc737008927c799b691e7b051bea90313cf
commit: 713cfd2684fa5ea08b144d92b9858b932c0f1705 [1666/1666] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-004-20250618 (https://download.01.org/0day-ci/archive/20250618/202506182031.ldH7VynO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506182031.ldH7VynO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506182031.ldH7VynO-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:1587:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    void sched_set_stop_task(int cpu, struct task_struct *stop)
         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c:3771:35: warning: no previous prototype for 'preempt_schedule_irq' [-Wmissing-prototypes]
    asmlinkage __visible void __sched preempt_schedule_irq(void)
                                      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_cpu_activate':
   kernel/sched/core.c:5845:2: error: implicit declaration of function 'tg_update_affinity_domains'; did you mean 'irq_create_affinity_masks'? [-Werror=implicit-function-declaration]
     tg_update_affinity_domains(cpu, 1);
     ^~~~~~~~~~~~~~~~~~~~~~~~~~
     irq_create_affinity_masks
   kernel/sched/core.c: In function 'sched_init_smp':
   kernel/sched/core.c:5976:2: error: implicit declaration of function 'init_auto_affinity'; did you mean 'irq_set_affinity'? [-Werror=implicit-function-declaration]
     init_auto_affinity(&root_task_group);
     ^~~~~~~~~~~~~~~~~~
     irq_set_affinity
>> kernel/sched/core.c:5976:22: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
     init_auto_affinity(&root_task_group);
                         ^~~~~~~~~~~~~~~
                         task_group
   kernel/sched/core.c:5976:22: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/core.c: In function 'sched_init':
   kernel/sched/core.c:6029:32: warning: variable 'ptr' set but not used [-Wunused-but-set-variable]
     unsigned long alloc_size = 0, ptr;
                                   ^~~
   cc1: some warnings being treated as errors


vim +5976 kernel/sched/core.c

  5949	
  5950	void __init sched_init_smp(void)
  5951	{
  5952		sched_init_numa();
  5953	
  5954		/*
  5955		 * There's no userspace yet to cause hotplug operations; hence all the
  5956		 * CPU masks are stable and all blatant races in the below code cannot
  5957		 * happen. The hotplug lock is nevertheless taken to satisfy lockdep,
  5958		 * but there won't be any contention on it.
  5959		 */
  5960		cpus_read_lock();
  5961		mutex_lock(&sched_domains_mutex);
  5962		sched_init_domains(cpu_active_mask);
  5963		mutex_unlock(&sched_domains_mutex);
  5964		cpus_read_unlock();
  5965	
  5966		/* Move init over to a non-isolated CPU */
  5967		if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_FLAG_DOMAIN)) < 0)
  5968			BUG();
  5969		sched_init_granularity();
  5970	
  5971		init_sched_rt_class();
  5972		init_sched_dl_class();
  5973	
  5974		sched_smp_initialized = true;
  5975	
> 5976		init_auto_affinity(&root_task_group);
  5977	}
  5978	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
