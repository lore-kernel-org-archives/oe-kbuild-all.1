Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2D915CD55
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 May 2025 05:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747893070; cv=none; b=liWuCvXgTTuQDAUZhobEk8DX4XcRyeuNYG0gg2D3sBWyfxlUwbSbl7leJr6AYCHDix64YTCjWMlKlYHuFMkkVBBV6u9nMZPsw9RQgn5qT4jw9N0N5FRmjVLgtiMJM6k+4cObmGRjZELt+lYdnmht82wBitqG1UKuAxirBz8nI44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747893070; c=relaxed/simple;
	bh=WyJZKBf9MBj6ZKfDc2MJ4RppVjw0ca1GtpK1lR4Cn/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FFspD2lbZZIPCLYw89S1fsi5LnGc4/ro9dzyoTfHdl4YpDimvaSl/DGJLlOAbaTlAHZKj+O8Ce1TjS55Pa+0WJ80giVeYsIyBUeS3cdRbbC9q/EspC1qCt0Vkgk7wvIFkv/yqmaD21T1BxBitwMfYkkMKJz6StvG/9Zo+SI3OhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oao00KMq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oao00KMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747893066; x=1779429066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WyJZKBf9MBj6ZKfDc2MJ4RppVjw0ca1GtpK1lR4Cn/o=;
  b=Oao00KMqKE+7TrFjUl/VwoG3QiDEcRjQXGwMJDDf8DJ6QKY1k3TBA3bW
   YpLAB/jAqrOlhj0T5s+dDUJ81vIfJxj5lYkjIrsvLjQkOJRdo/4FQko2s
   zqp8l1WIaDOzQMy5mSEeorpHrfZMnDpeN3T96bVGecoojSphsgewbtENu
   UcWLANMoOasGobryGBhpXUARJyfHbiXrYM97mugH+Mwa1vkLiFnAgF25o
   2Xlr87oRcPVMw82ikQhgoJ3qlApVqLZYlSYQnZo70ggidf16AdUK6sx3h
   2ulEiX+OfkIihvNiF9zlKzsTxAhXWqGCJ+6cpYwQJ/F6vGDTdHGCE6JdG
   w==;
X-CSE-ConnectionGUID: w65g8HP3Qeaurvu4GFa05g==
X-CSE-MsgGUID: hTxfaEtMRWSwW3cMZVo+yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="72427099"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="72427099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 22:51:06 -0700
X-CSE-ConnectionGUID: 58SuOqpcQEyR5TZjyrNKxA==
X-CSE-MsgGUID: CEPpHkbTT5iU0aBWbNQrAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="140952648"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 May 2025 22:51:05 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHypb-000Oxa-0B;
	Thu, 22 May 2025 05:51:03 +0000
Date: Thu, 22 May 2025 13:50:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kernel/sched/fair.c:8968:1:
 warning: no previous prototype for function 'select_idle_cpu'
Message-ID: <202505221320.m6wxs4rU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8c0e5d113e2a8ff250d4973be89da61edcab22d5
commit: dd56c7bbabe374d70fb83cf6e0b6cf61fac6d227 [11/11] anolis: sched/fair: fix a compilation error on sw_64 arch
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250522/202505221320.m6wxs4rU-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505221320.m6wxs4rU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505221320.m6wxs4rU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:1414:6: warning: no previous prototype for function 'group_identity_get' [-Wmissing-prototypes]
    1414 | void group_identity_get(void)
         |      ^
   kernel/sched/fair.c:1414:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1414 | void group_identity_get(void)
         | ^
         | static 
   kernel/sched/fair.c:1420:6: warning: no previous prototype for function 'group_identity_put' [-Wmissing-prototypes]
    1420 | void group_identity_put(void)
         |      ^
   kernel/sched/fair.c:1420:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1420 | void group_identity_put(void)
         | ^
         | static 
   kernel/sched/fair.c:2589:22: warning: no previous prototype for function '__pick_first_entity' [-Wmissing-prototypes]
    2589 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         |                      ^
   kernel/sched/fair.c:2589:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2589 | struct sched_entity *__pick_first_entity(struct cfs_rq *cfs_rq)
         | ^
         | static 
>> kernel/sched/fair.c:8968:1: warning: no previous prototype for function 'select_idle_cpu' [-Wmissing-prototypes]
    8968 | select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool has_idle_core, int target)
         | ^
   kernel/sched/fair.c:8967:17: note: declare 'static' if the function is not intended to be used outside of this translation unit
    8967 | __weak noinline int
         |                 ^
         |                 static 
   kernel/sched/fair.c:9728:7: warning: variable 'min_vruntime' set but not used [-Wunused-but-set-variable]
    9728 |                 u64 min_vruntime;
         |                     ^
   kernel/sched/fair.c:13852:6: warning: no previous prototype for function 'task_vruntime_update' [-Wmissing-prototypes]
    13852 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          |      ^
   kernel/sched/fair.c:13852:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    13852 | void task_vruntime_update(struct rq *rq, struct task_struct *p, bool in_fi)
          | ^
          | static 
   6 warnings generated.


vim +/select_idle_cpu +8968 kernel/sched/fair.c

  8961	
  8962	/*
  8963	 * Scan the LLC domain for idle CPUs; this is dynamically regulated by
  8964	 * comparing the average scan cost (tracked in sd->avg_scan_cost) against the
  8965	 * average idle time for this rq (as found in rq->avg_idle).
  8966	 */
  8967	__weak noinline int
> 8968	select_idle_cpu(struct task_struct *p, struct sched_domain *sd, bool has_idle_core, int target)
  8969	{
  8970		struct cpumask *cpus = this_cpu_cpumask_var_ptr(select_idle_mask);
  8971		int i, cpu, idle_cpu = -1, nr = INT_MAX, id_backup = -1;
  8972		int this = smp_processor_id();
  8973		struct sched_domain *this_sd;
  8974		u64 time;
  8975		bool is_seeker;
  8976	
  8977		this_sd = rcu_dereference(*this_cpu_ptr(&sd_llc));
  8978		if (!this_sd)
  8979			return -1;
  8980	
  8981		cpumask_and(cpus, sched_domain_span(sd), task_allowed_cpu(p));
  8982	
  8983		if (sched_feat(SIS_PROP) && !has_idle_core) {
  8984			u64 avg_cost, avg_idle, span_avg;
  8985	
  8986			/*
  8987			 * Due to large variance we need a large fuzz factor; hackbench in
  8988			 * particularly is sensitive here.
  8989			 */
  8990			avg_idle = get_avg_idle(this_rq()) / 512;
  8991			avg_cost = this_sd->avg_scan_cost + 1;
  8992	
  8993			is_seeker = is_idle_seeker_task(p);
  8994			if (!is_seeker) {
  8995				span_avg = sd->span_weight * avg_idle;
  8996				if (span_avg > 4*avg_cost)
  8997					nr = div_u64(span_avg, avg_cost);
  8998				else
  8999					nr = 4;
  9000			}
  9001			time = cpu_clock(this);
  9002		}
  9003	
  9004		if (static_branch_unlikely(&sched_cluster_active)) {
  9005			struct sched_group *sg = sd->groups;
  9006	
  9007			if (sg->flags & SD_CLUSTER) {
  9008				for_each_cpu_wrap(cpu, sched_group_span(sg), target + 1) {
  9009					if (!cpumask_test_cpu(cpu, cpus))
  9010						continue;
  9011	
  9012					if (has_idle_core) {
  9013						i = select_idle_core(p, cpu, cpus, &idle_cpu, &id_backup);
  9014						if ((unsigned int)i < nr_cpumask_bits)
  9015							return i;
  9016					} else {
  9017						if (--nr <= 0)
  9018							return -1;
  9019						idle_cpu = __select_idle_cpu(cpu, p, &id_backup);
  9020						if ((unsigned int)idle_cpu < nr_cpumask_bits)
  9021							return idle_cpu;
  9022					}
  9023				}
  9024				cpumask_andnot(cpus, cpus, sched_group_span(sg));
  9025			}
  9026		}
  9027	
  9028		for_each_cpu_wrap(cpu, cpus, target + 1) {
  9029			if (has_idle_core) {
  9030				i = select_idle_core(p, cpu, cpus, &idle_cpu, &id_backup);
  9031				if ((unsigned int)i < nr_cpumask_bits)
  9032					return i;
  9033			} else {
  9034				if (--nr <= 0)
  9035					return -1;
  9036				idle_cpu = __select_idle_cpu(cpu, p, &id_backup);
  9037				if ((unsigned int)idle_cpu < nr_cpumask_bits)
  9038					break;
  9039			}
  9040		}
  9041	
  9042		if (has_idle_core)
  9043			set_idle_cores(target, false);
  9044	
  9045		if (sched_feat(SIS_PROP) && !has_idle_core) {
  9046			time = cpu_clock(this) - time;
  9047			update_avg(&this_sd->avg_scan_cost, time);
  9048		}
  9049	
  9050		if (!group_identity_disabled())
  9051			return (unsigned int)idle_cpu < nr_cpumask_bits ? idle_cpu : id_backup;
  9052		return idle_cpu;
  9053	}
  9054	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
