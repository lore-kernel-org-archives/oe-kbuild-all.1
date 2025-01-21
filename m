Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABD91B85C5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 23:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737501344; cv=none; b=gXSpXc++CoCp9L/S8Iazyl1V2qOxvSL6kqo+ZWWjZBiTlLEk+JydBCaQQtsGkUsoO2NSSxpVVulJM1mS1QUSWxICtTSyRpuYcpHdZexUMZBt2fMLCqvJt7RRhgP4l1JcA8sYF3F257UZnsgKaxhXUQD7ypUWx9kJF0qtivYuQh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737501344; c=relaxed/simple;
	bh=R0JRaWnAVHaw9+pZxsN41Uqh2n+q9R42bHcUL8pS80Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7xz1k3cF2Sx7TnNXqpb9bmyPWRsfFbI5vlWHlCdmnxU3Qa9dMqNI+z/TZooUi9VxJElk8pUXMBHc7crIvypl8o5jG1VxWH4BCWBXVO9bRet5uLcPLKFYSrPD9WXPjQf/8z0y50PitDhIUszyDmDaMm5BP9vsR+WhfeEVFYZvg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVPDZYTd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVPDZYTd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737501342; x=1769037342;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R0JRaWnAVHaw9+pZxsN41Uqh2n+q9R42bHcUL8pS80Q=;
  b=RVPDZYTdSWrBr3vBGGvwQqgJBPefjhczsSxvq13nHOKfabM02Cp7akEa
   nmmIKfLtVI477IlF8NQWo1ovveHg1wGzkJCCkCMI6/2pWFDrYz8DEC+AO
   b55puuPGKtcwkaS/TGq6XDq7rFA98RMXhqmcRoZLNAKbq9/Q3DXqvwtty
   ZSEUd1vEbUv40kvU46BW7OW6V2uiKkMyILqMk1tuFV5WR9Y3VG+4r0Q0e
   cAHVLvS9nsuU99ZmeRz7IgzVtnVHoymDiQ6MGJ+Brx28NYZ6FJQHf/Yww
   OK+pRBevuX4sN07kxH+/i4PJ9RvehaCitonvYRll99EUA4GKciSiAW029
   A==;
X-CSE-ConnectionGUID: 3mI2uXTARPKTfD4WvNQC+w==
X-CSE-MsgGUID: rQH9iVmuTDSBlAwHaVwKGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38092898"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="38092898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 15:15:41 -0800
X-CSE-ConnectionGUID: g6oTwnFmRC2eDmA5i4O4fQ==
X-CSE-MsgGUID: c6CCqp7bSECw/v683ygC2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="111937166"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2025 15:15:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taNT7-000Z6t-35;
	Tue, 21 Jan 2025 23:15:37 +0000
Date: Wed, 22 Jan 2025 07:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834] mm/memcontrol.c:4061:5: sparse:
 sparse: symbol 'sysctl_memcg_oom_prio' was not declared. Should it be
 static?
Message-ID: <202501220758.6wiUFGfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 44391f3171b05060096ff496f3507033f2460161 [1834/1834] memcg: Add sysctl memcg_qos_enable
config: x86_64-randconfig-121-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220758.6wiUFGfn-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220758.6wiUFGfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220758.6wiUFGfn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/memcontrol.c:4061:5: sparse: sparse: symbol 'sysctl_memcg_oom_prio' was not declared. Should it be static?
   mm/memcontrol.c:4223:50: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   mm/memcontrol.c:4223:50: sparse:     expected void *
   mm/memcontrol.c:4223:50: sparse:     got void [noderef] __user *buffer
>> mm/memcontrol.c:4245:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   mm/memcontrol.c:4245:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   mm/memcontrol.c:4245:35: sparse:     got int ( * )( ... )
   mm/memcontrol.c:4504:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4504:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4504:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4506:21: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4506:21: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4506:21: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4662:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4662:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4662:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:4756:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:4756:9: sparse:    struct mem_cgroup_threshold_ary [noderef] __rcu *
   mm/memcontrol.c:4756:9: sparse:    struct mem_cgroup_threshold_ary *
   mm/memcontrol.c:6799:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:6799:23: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:6799:23: sparse:    struct task_struct *
   mm/memcontrol.c:7016:52: sparse: sparse: incompatible types in comparison expression (different address spaces):
   mm/memcontrol.c:7016:52: sparse:    struct task_struct [noderef] __rcu *
   mm/memcontrol.c:7016:52: sparse:    struct task_struct *
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/memcontrol.c: note: in included file:
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock' - wrong count at exit
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irq' - wrong count at exit
   include/linux/memcontrol.h:782:9: sparse: sparse: context imbalance in 'folio_lruvec_lock_irqsave' - wrong count at exit
   mm/memcontrol.c:2134:6: sparse: sparse: context imbalance in 'folio_memcg_lock' - wrong count at exit
   mm/memcontrol.c:2181:17: sparse: sparse: context imbalance in '__folio_memcg_unlock' - unexpected unlock
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/memcontrol.c: note: in included file (through include/linux/rculist.h, include/linux/pid.h, include/linux/sched.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mem_cgroup_count_precharge_pte_range' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mem_cgroup_move_charge_pte_range' - unexpected unlock

vim +/sysctl_memcg_oom_prio +4061 mm/memcontrol.c

  4057	
  4058	#ifdef CONFIG_MEMCG_OOM_PRIORITY
  4059	#define ENABLE_MEMCG_OOM_PROIRITY	1
  4060	#define DISABLE_MEMCG_OOM_PROIRITY	0
> 4061	int sysctl_memcg_oom_prio = DISABLE_MEMCG_OOM_PROIRITY;
  4062	
  4063	bool memcg_oom_prio_disabled(void)
  4064	{
  4065		return READ_ONCE(sysctl_memcg_oom_prio) == DISABLE_MEMCG_OOM_PROIRITY;
  4066	}
  4067	
  4068	static void memcg_oom_prio_init(struct mem_cgroup *memcg)
  4069	{
  4070		struct mem_cgroup *parent = parent_mem_cgroup(memcg);
  4071		int oom_prio;
  4072	
  4073		if (!parent)
  4074			return;
  4075	
  4076		oom_prio = READ_ONCE(parent->oom_prio);
  4077		WRITE_ONCE(memcg->oom_prio, oom_prio);
  4078	}
  4079	
  4080	static s64 memcg_oom_prio_read(struct cgroup_subsys_state *css,
  4081					      struct cftype *cft)
  4082	{
  4083		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  4084	
  4085		if (memcg_oom_prio_disabled())
  4086			return 0;
  4087	
  4088		return READ_ONCE(memcg->oom_prio);
  4089	}
  4090	
  4091	static int memcg_oom_prio_write(struct cgroup_subsys_state *css,
  4092					       struct cftype *cft, s64 val)
  4093	{
  4094		struct mem_cgroup *memcg = mem_cgroup_from_css(css);
  4095		struct mem_cgroup *iter_memcg;
  4096		struct cgroup_subsys_state *iter_css;
  4097	
  4098		if (memcg_oom_prio_disabled())
  4099			return -EACCES;
  4100	
  4101		if (mem_cgroup_is_root(memcg))
  4102			return -EINVAL;
  4103	
  4104		if (val != MEMCG_LOW_OOM_PRIORITY && val != MEMCG_HIGH_OOM_PRIORITY)
  4105			return -EINVAL;
  4106	
  4107		rcu_read_lock();
  4108		css_for_each_descendant_pre(iter_css, &memcg->css) {
  4109			iter_memcg = mem_cgroup_from_css(iter_css);
  4110	
  4111			WRITE_ONCE(iter_memcg->oom_prio, val);
  4112		}
  4113		rcu_read_unlock();
  4114	
  4115		return 0;
  4116	}
  4117	
  4118	static struct mem_cgroup *memcg_find_max_usage(struct mem_cgroup *last)
  4119	{
  4120		struct mem_cgroup *iter, *max_memcg = NULL;
  4121		struct cgroup_subsys_state *css;
  4122		unsigned long usage, max_usage = 0;
  4123		int oom_prio;
  4124	
  4125		rcu_read_lock();
  4126		css_for_each_descendant_pre(css, &root_mem_cgroup->css) {
  4127			iter = mem_cgroup_from_css(css);
  4128			oom_prio = READ_ONCE(iter->oom_prio);
  4129	
  4130			if (oom_prio == MEMCG_HIGH_OOM_PRIORITY ||
  4131				iter == root_mem_cgroup ||
  4132				iter == last)
  4133				continue;
  4134	
  4135			usage = mem_cgroup_usage(iter, false);
  4136			if (usage > max_usage) {
  4137				max_usage = usage;
  4138				max_memcg = iter;
  4139			}
  4140		}
  4141		rcu_read_unlock();
  4142	
  4143		return max_memcg;
  4144	}
  4145	
  4146	bool memcg_oom_prio_scan_tasks(int (*fn)(struct task_struct *, void *),
  4147					   void *arg)
  4148	{
  4149		struct mem_cgroup *max, *last = NULL;
  4150		struct oom_control *oc = arg;
  4151		struct css_task_iter it;
  4152		struct task_struct *task;
  4153		int ret = 0;
  4154		bool retry = true;
  4155	
  4156		if (memcg_oom_prio_disabled())
  4157			return false;
  4158	retry:
  4159		max = memcg_find_max_usage(last);
  4160		if (!max)
  4161			return false;
  4162	
  4163		css_task_iter_start(&max->css, 0, &it);
  4164		while (!ret && (task = css_task_iter_next(&it))) {
  4165			if (test_tsk_thread_flag(task, TIF_MEMDIE))
  4166				continue;
  4167	
  4168			ret = fn(task, arg);
  4169		}
  4170		css_task_iter_end(&it);
  4171	
  4172		if (ret)
  4173			return false;
  4174	
  4175		if (!oc->chosen && retry) {
  4176			last = max;
  4177			retry = false;
  4178			goto retry;
  4179		}
  4180	
  4181		if (oc->chosen)
  4182			pr_info("The bad task [%d:%s] is from low-priority memcg.\n",
  4183					oc->chosen->pid, oc->chosen->comm);
  4184	
  4185		return oc->chosen ? true : false;
  4186	}
  4187	
  4188	void memcg_print_bad_task(struct oom_control *oc)
  4189	{
  4190		if (memcg_oom_prio_disabled())
  4191			return;
  4192	
  4193		if (oc->chosen) {
  4194			struct mem_cgroup *memcg;
  4195	
  4196			rcu_read_lock();
  4197			memcg = mem_cgroup_from_task(oc->chosen);
  4198			if (READ_ONCE(memcg->oom_prio) == MEMCG_LOW_OOM_PRIORITY)
  4199				pr_info("The bad task [%d:%s] is from low-priority memcg.\n",
  4200					oc->chosen->pid, oc->chosen->comm);
  4201			rcu_read_unlock();
  4202		}
  4203	}
  4204	
  4205	static void memcg_oom_prio_reset(void)
  4206	{
  4207		struct mem_cgroup *iter;
  4208		struct cgroup_subsys_state *css;
  4209	
  4210		rcu_read_lock();
  4211		css_for_each_descendant_pre(css, &root_mem_cgroup->css) {
  4212			iter = mem_cgroup_from_css(css);
  4213			WRITE_ONCE(iter->oom_prio, 0);
  4214		}
  4215		rcu_read_unlock();
  4216	}
  4217	
  4218	static int sysctl_memcg_oom_prio_handler(struct ctl_table *table, int write,
  4219			void __user *buffer, size_t *length, loff_t *ppos)
  4220	{
  4221		int ret;
  4222	
  4223		ret = proc_dointvec_minmax(table, write, buffer, length, ppos);
  4224		if (ret)
  4225			return ret;
  4226	
  4227		if (write) {
  4228			if (READ_ONCE(sysctl_memcg_oom_prio) == DISABLE_MEMCG_OOM_PROIRITY)
  4229				memcg_oom_prio_reset();
  4230		}
  4231	
  4232		return ret;
  4233	}
  4234	
  4235	static struct ctl_table memcg_oom_prio_sysctls[] = {
  4236		{
  4237			/*
  4238			 * This sysctl is used to control memcg oom priority
  4239			 * feature, the sysctl name is for compatibility.
  4240			 */
  4241			.procname	= "memcg_qos_enable",
  4242			.data		= &sysctl_memcg_oom_prio,
  4243			.maxlen		= sizeof(int),
  4244			.mode		= 0644,
> 4245			.proc_handler	= sysctl_memcg_oom_prio_handler,
  4246			.extra1		= SYSCTL_ZERO,
  4247			.extra2		= SYSCTL_ONE,
  4248		},
  4249	};
  4250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
