Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE7931DF27F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765431643; cv=none; b=AYBrz4wGMCTvU+Ym6eQQIvqSS/ox7oU6iE0rM5MaZBcATFa15aoo1oZlkResvxw4hDJJFCcXWkvSfy/TDblcsAlBoRL6HTbQfPwRjHbsQAdCBj9CzusTvGe72LylVkQy3KaDVy21NfkbFnxMm2NffZXbaf1A4XoXCnELmS9xz/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765431643; c=relaxed/simple;
	bh=GeEJfglj9KkxTk9WZ4sugG/ffbnVrlLp8dVWGcu2rlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/AKnBTcEGsjU7fRG/eWwb2Yj1PVP7UXFzMse46UxBmkgYQ7OPOmDxXq1cC7mwgNbF6EklAZLT54RoNY2VM/9AbO1P8o1aGmuWXKhV8CAsRwgcwWyXc25iYx5bRbcE5Hokyh6LxQvmJMA+YmBVJk/sAIg8tmAUMTR+GYGJ8CI1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lk81mMOw; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lk81mMOw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765431641; x=1796967641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GeEJfglj9KkxTk9WZ4sugG/ffbnVrlLp8dVWGcu2rlc=;
  b=lk81mMOwMMkDiOloQ66Oc0J1YdLtAEsUzQ4upC6RGVOim1edCZBLkjtS
   8BUO2ktNSW/xpEctpx92E8k1m04jo8yMZNe2dwSo5OkKsuQ8qrYKdEqNd
   lxkhUKtZUaQRrguuc+Nw+2JF6Ep8iZPtg3ntfL+FEjY/9i8iPAJ0nGymr
   Te5yFG5zJmsRKlUjSSRGHfYRjwQ181TAOjGMtx3FQilVgg/ESDtqAfdww
   U2HVcidD6N5KbuyiAclA7UGcKYWuGeypQQkpmRpPI8ZkZ//M/R6S6m9we
   Z6JYsyZHTFXtVTtiwm6qa48Q06mzXiaN5ugD796pJdlga7K8UYWmXarpy
   Q==;
X-CSE-ConnectionGUID: TQeHZ5iMTauDB0Nz+BWC2Q==
X-CSE-MsgGUID: CQ1kM7Z4TV21aWhSGr5Icg==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="84817136"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="84817136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 21:40:40 -0800
X-CSE-ConnectionGUID: 9E0jw1XhSKOarfh9lrz1rA==
X-CSE-MsgGUID: cveKqty8T3u06hK7Ool7Cg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201630348"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 10 Dec 2025 21:40:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTZPo-000000004Ef-3mRR;
	Thu, 11 Dec 2025 05:40:36 +0000
Date: Thu, 11 Dec 2025 13:39:45 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/5] kernel/sched/fair.c:4146:6:
 warning: no previous prototype for 'set_group_prefer_node'
Message-ID: <202512111337.rllNMzCY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   38743d2d77ee27e7fe97c7ef81b8643365903536
commit: a0afbf3c5d0386fa940ad3ee5e5cda8ad0e3eced [0/5] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20251211/202512111337.rllNMzCY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111337.rllNMzCY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111337.rllNMzCY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:4146:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4146 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_group_prefer_node':
   kernel/sched/fair.c:4175:33: error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'? [-Wimplicit-function-declaration]
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
         |                                 cpu_of
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:7324:22: error: conflicting types for 'cpu_load'; have 'long unsigned int(struct rq *)'
    7324 | static unsigned long cpu_load(struct rq *rq)
         |                      ^~~~~~~~
   kernel/sched/fair.c:4175:33: note: previous implicit declaration of 'cpu_load' with type 'int()'
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~


vim +/set_group_prefer_node +4146 kernel/sched/fair.c

  4137	
  4138	static inline u64 cfs_rq_last_update_time(struct cfs_rq *cfs_rq)
  4139	{
  4140		return u64_u32_load_copy(cfs_rq->avg.last_update_time,
  4141					 cfs_rq->last_update_time_copy);
  4142	}
  4143	#ifdef CONFIG_FAIR_GROUP_SCHED
  4144	DEFINE_PER_CPU(struct cpumask, cpus_allowed_alt);
  4145	/* Decide which node for @tg to run on*/
> 4146	void set_group_prefer_node(struct task_group *tg)
  4147	{
  4148		int cpu, node;
  4149		unsigned long min_load = ULONG_MAX, now = jiffies, load;
  4150		static int prev_node;
  4151		static unsigned long prev_jiffies;
  4152	
  4153		/* Choose Round-Robin way with frequent call */
  4154		if (now - prev_jiffies < HZ) {
  4155			prev_jiffies = now;
  4156	
  4157			prev_node = next_online_node(prev_node);
  4158			if (prev_node >= 0 && prev_node < MAX_NUMNODES) {
  4159				tg->prefer_node = prev_node;
  4160				return;
  4161			}
  4162	
  4163			prev_node = first_online_node;
  4164			tg->prefer_node = prev_node;
  4165			return;
  4166		}
  4167	
  4168		prev_jiffies = now;
  4169	
  4170		/* find the idlest node */
  4171		prev_node = first_online_node;
  4172		for_each_online_node(node) {
  4173			load = ULONG_MAX;
  4174			for_each_cpu(cpu, cpumask_of_node(node))
  4175				load += cpu_load(cpu_rq(cpu));
  4176			if (load < min_load) {
  4177				min_load = load;
  4178				prev_node = node;
  4179			}
  4180		}
  4181	
  4182		tg->prefer_node = prev_node;
  4183	}
  4184	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
