Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD808624B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 03:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741316857; cv=none; b=s5O5KzayNMqZ9BJilHKPqCQyJHglpEDW80YiCSw1dpDgusH1X5He5QnYFt38mpy8XmHMb/TOdsuAF1dWiP/c92ZvfQ9seMbaDycZxIJfnGEcC9Tz2eqAMGTdgrp6Y+9wv1nFZOgy8rtucOjH3KFBZyhWe9mjdAWg/7Lm4zIxL8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741316857; c=relaxed/simple;
	bh=ZgNBHxnodbC6CkeMTqlAzPZSf88+/VpZsGeAI3m+gGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OniYDuo9/gWwmJ8SOY8TymE5B72C93aaqYzkIyGcM6OkXHQng1ESjjQCqzRU29RopezrWzXF4TVOGpNe6zp0vO7ORAJPQjSSzxxGtVAHRLMcNyQa9Q+vjvJMVdWtkpyLFYpKImXdo+BZaK1A8+XdPMS7NM2V9GSQUJVz5hpZtB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kngq42kA; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kngq42kA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741316855; x=1772852855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZgNBHxnodbC6CkeMTqlAzPZSf88+/VpZsGeAI3m+gGQ=;
  b=kngq42kApMXinHx+hzCLoOFtoaIfwLNkxHakn9N3PhEEJCxl3tnxxhtO
   V2hZUhWXm9waoBWvmh4rYCjXHjMEbTI0/PfxVlmo6AqpRXNN5GFHrJuuO
   d8QQwsz8/taqTzMuZFr0IEczjPpclrmYFkqA1kM/X2D7BouZWezrMWfiO
   g8OM/fwLLK0hn+15kNR6NIFtOjFnrMUoP95JXo2BdlBlyUTkoQnmqmGVC
   i+qMlJoBUneyIOTdH3WvdsDtv2B1Eb97wU3zTxOa5C/bvV/mHFDEC0TuY
   UuXfq8c/RmKtDyXk2OMPGRXAkCJCXgxjGbYhBKGFD/j0Ia8zNNNtVQisE
   A==;
X-CSE-ConnectionGUID: MLjYftIjRTCnb1/fZKgVtA==
X-CSE-MsgGUID: 6M66MUUjTl2dGBrPOPas5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="53754587"
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="53754587"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2025 19:07:35 -0800
X-CSE-ConnectionGUID: n04NTvmlQYSg20obWBFO7g==
X-CSE-MsgGUID: q5PgSvqsTUiRp+AxLomhvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,227,1736841600"; 
   d="scan'208";a="119204897"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2025 19:07:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqO3f-000O7U-2F;
	Fri, 07 Mar 2025 03:07:31 +0000
Date: Fri, 7 Mar 2025 11:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1447/1447] kernel/sched/fair.c:6701:33:
 error: 'struct task_group' has no member named 'se'
Message-ID: <202503071126.Eez53po7-lkp@intel.com>
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
head:   55990887ff37ac2fa796d5182eb2f462955a4d6e
commit: 70a232a564cfa99401d197708cf380398ad5e2d7 [1447/1447] sched: Adjust wakeup cpu range according CPU util dynamicly
config: arm64-randconfig-r064-20250307 (https://download.01.org/0day-ci/archive/20250307/202503071126.Eez53po7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250307/202503071126.Eez53po7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503071126.Eez53po7-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:3675:6: warning: no previous prototype for 'sync_entity_load_avg' [-Wmissing-prototypes]
    3675 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3688:6: warning: no previous prototype for 'remove_entity_load_avg' [-Wmissing-prototypes]
    3688 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'set_task_select_cpus':
>> kernel/sched/fair.c:6701:33: error: 'struct task_group' has no member named 'se'
    6701 |                 if (unlikely(!tg->se[cpu]))
         |                                 ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/fair.c:6707:61: error: 'struct task_group' has no member named 'se'
    6707 |                         spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
         |                                                             ^~
   kernel/sched/fair.c:6720:35: error: 'struct task_group' has no member named 'se'
    6720 |                 util_avg_sum += tg->se[cpu]->avg.util_avg;
         |                                   ^~
   kernel/sched/fair.c: In function 'select_task_rq_fair':
   kernel/sched/fair.c:6747:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    6747 |         unsigned long time;
         |                       ^~~~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
   kernel/sched/fair.c:7291:23: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    7291 |         unsigned long time;
         |                       ^~~~
   In file included from include/linux/migrate.h:6,
                    from kernel/sched/sched.h:52:
   include/linux/mempolicy.h: At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~


vim +6701 kernel/sched/fair.c

  6670	
  6671	/*
  6672	 * set_task_select_cpus: select the cpu range for task
  6673	 * @p: the task whose available cpu range will to set
  6674	 * @idlest_cpu: the cpu which is the idlest in prefer cpus
  6675	 *
  6676	 * If sum of 'util_avg' among 'preferred_cpus' lower than the percentage
  6677	 * 'sysctl_sched_util_low_pct' of 'preferred_cpus' capacity, select
  6678	 * 'preferred_cpus' range for task, otherwise select 'preferred_cpus' for task.
  6679	 *
  6680	 * The available cpu range set to p->select_cpus. Idlest cpu in preferred cpus
  6681	 * set to @idlest_cpu, which is set to wakeup cpu when fast path wakeup cpu
  6682	 * without p->select_cpus.
  6683	 */
  6684	static void set_task_select_cpus(struct task_struct *p, int *idlest_cpu,
  6685					 int sd_flag)
  6686	{
  6687		unsigned long util_avg_sum = 0;
  6688		unsigned long tg_capacity = 0;
  6689		long min_util = INT_MIN;
  6690		struct task_group *tg;
  6691		long spare;
  6692		int cpu;
  6693	
  6694		p->select_cpus = &p->cpus_allowed;
  6695		if (!prefer_cpus_valid(p))
  6696			return;
  6697	
  6698		rcu_read_lock();
  6699		tg = task_group(p);
  6700		for_each_cpu(cpu, p->prefer_cpus) {
> 6701			if (unlikely(!tg->se[cpu]))
  6702				continue;
  6703	
  6704			if (idlest_cpu && available_idle_cpu(cpu)) {
  6705				*idlest_cpu = cpu;
  6706			} else if (idlest_cpu) {
  6707				spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
  6708				if (spare > min_util) {
  6709					min_util = spare;
  6710					*idlest_cpu = cpu;
  6711				}
  6712			}
  6713	
  6714			if (available_idle_cpu(cpu)) {
  6715				rcu_read_unlock();
  6716				p->select_cpus = p->prefer_cpus;
  6717				return;
  6718			}
  6719	
  6720			util_avg_sum += tg->se[cpu]->avg.util_avg;
  6721			tg_capacity += capacity_of(cpu);
  6722		}
  6723		rcu_read_unlock();
  6724	
  6725		if (tg_capacity > cpumask_weight(p->prefer_cpus) &&
  6726		    util_avg_sum * 100 <= tg_capacity * sysctl_sched_util_low_pct) {
  6727			p->select_cpus = p->prefer_cpus;
  6728		}
  6729	}
  6730	#endif
  6731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
