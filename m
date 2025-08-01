Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CE72C9A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 03:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754020403; cv=none; b=Wvg1xo7mF5EXXVntTy6Lr8leCPn80XWVVtR/fAEfRzOkmfRUqdJKcEMDR6OtUQVvrlpKQ02hYIfqqLVCpiNP/lbKoSpZM9CJtnku1fMcI5uBRuXCD6MoW1GfEKdpAotcNmE5ISRHaRa/0bJwYnWHb9ZpNQBdjX3Xfxz1O4R+jFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754020403; c=relaxed/simple;
	bh=oJiYPN69FxoYT6t6bGfuTm3PGB+jhAuReFbWOHrE4D8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEdCHZr0xIRXpsGMWgiEr/ODN/zqKdDRcsZVjG992MpCHoriM+SSIutDfEo2r5KZQw3pOthKvqAHDuJzmT3O78YZLDaAwG+wERzrDPpcgSaDdixCDAuX5nsxrv5Z1ImIwyV+yAqw1xDX3ZAoUHPL9pFYO6pJD0r5K8aZ1KC76OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLbUnzfs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLbUnzfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754020401; x=1785556401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJiYPN69FxoYT6t6bGfuTm3PGB+jhAuReFbWOHrE4D8=;
  b=RLbUnzfsZTZ8VtQ7gg2N8mfh2oX6CBwFHsDKWjDdXfRt6qQc4adeMnOW
   IDg70zRQYAXeBu6jKR/KZ74exfoM/95IGJF3mvKsjXmL678+oSmvpeRgk
   bGXQjLoMYmERR8ZgfAN6j5iN1x88bwCJcXiJB6cBUB84D2w0m1vVQh8Q8
   nTY9Zc+d/D2Ye8ztwvR47TT3Nu3lnuOtOkd8HBtLb7i8UjhWuOZzMjCip
   KleEbFv26KWSVSmHAz9OjptEohzbQVsoCLUvfFpYVka7Qm+P8FuYt/X+j
   a013RPTrhjhaHWSXkL8BkHPMlnvbrWYsP8idxUJriNygkmtvwY4DDdxl0
   Q==;
X-CSE-ConnectionGUID: CQXfYsRER7SzkqMQXmAUUQ==
X-CSE-MsgGUID: TBZUNrDqQhOiIxmULdCWyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67723394"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="67723394"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 20:53:20 -0700
X-CSE-ConnectionGUID: kEqTaF6JQAySw8kb+HD5ng==
X-CSE-MsgGUID: o9mcKTkhSAS9Ew1Vii3cEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="162724019"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jul 2025 20:53:20 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhgpY-0004Km-20;
	Fri, 01 Aug 2025 03:53:16 +0000
Date: Fri, 1 Aug 2025 11:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/4] kernel/sched/fair.c:4175:33:
 error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'?
Message-ID: <202508011113.vS2eQ0Fx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   80d98c12d49f8632c6899a04f5bf44f818378777
commit: f1cb904d4a612d9b8d5f062c13c99f252b5ba920 [0/4] anolis: sched: add Numa Affine feature
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250801/202508011113.vS2eQ0Fx-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250801/202508011113.vS2eQ0Fx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508011113.vS2eQ0Fx-lkp@intel.com/

Note: the anolis-intel-cloud/devel-6.6 HEAD 80d98c12d49f8632c6899a04f5bf44f818378777 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:4146:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4146 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_group_prefer_node':
>> kernel/sched/fair.c:4175:33: error: implicit declaration of function 'cpu_load'; did you mean 'cpu_of'? [-Werror=implicit-function-declaration]
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
         |                                 cpu_of
   kernel/sched/fair.c: At top level:
>> kernel/sched/fair.c:7324:22: error: conflicting types for 'cpu_load'; have 'long unsigned int(struct rq *)'
    7324 | static unsigned long cpu_load(struct rq *rq)
         |                      ^~~~~~~~
   kernel/sched/fair.c:4175:33: note: previous implicit declaration of 'cpu_load' with type 'int()'
    4175 |                         load += cpu_load(cpu_rq(cpu));
         |                                 ^~~~~~~~
   cc1: some warnings being treated as errors


vim +4175 kernel/sched/fair.c

  4137	
  4138	static inline u64 cfs_rq_last_update_time(struct cfs_rq *cfs_rq)
  4139	{
  4140		return u64_u32_load_copy(cfs_rq->avg.last_update_time,
  4141					 cfs_rq->last_update_time_copy);
  4142	}
  4143	#ifdef CONFIG_FAIR_GROUP_SCHED
  4144	DEFINE_PER_CPU(struct cpumask, cpus_allowed_alt);
  4145	/* Decide which node for @tg to run on*/
  4146	void set_group_prefer_node(struct task_group *tg)
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
> 4175				load += cpu_load(cpu_rq(cpu));
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
