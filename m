Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C525945BFD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717093523; cv=none; b=E4/J4lUAGekbFe6mIsx1hL4AbyBv/NGDuwPir9sogUyuBEmTziWGaV1aJBzxfUD9FZval+Hv4FyHDrHDnoo8cpobM9QvKHzuRj0XcZWIk3TpH6WZDzVBe9I429V3U2NpcTZCeePw+mmZPJkrOX9k9O+KAXs0qCMAGStYFUNmfl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717093523; c=relaxed/simple;
	bh=8qR5+TiBUGkstwYX6N1ncKhrrHTtlBp/JYIol2NA/lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iC3ytm0vCGabTugdNllp4i97erYeUkrLZKv6CERzjJXXZyiOdPWtZ6/vp6bPnbxQNjhpNk5YogqUUkOuQP3kLXI59dIiAl6NF9Fu6RCkfGraacBcAyCCHjpLgbIJlhdo//fFXWQBfvcJiAOcVqXdo7UBJf/8ADFRWEJIAnm6O6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AC+va1nK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AC+va1nK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717093521; x=1748629521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8qR5+TiBUGkstwYX6N1ncKhrrHTtlBp/JYIol2NA/lI=;
  b=AC+va1nKUHQbn3+Iqme5FcJDxFFAPhCwOub81NbMeeJ7sNXHg2G8Fp16
   2v2fnc6ZqyU27w7UvYBEuL/83gWOyYRxZP8VrUCELp45hVpX6WXhW78hC
   MgNQz53cJMI+Y3Z2ebu3NkplM71ksy5kHbAhKis1bfv4Q3s1jIrHp+Wcz
   lyr14+CPENjbAO3WW/fbu5Bnw94CrxE6QRRmCArndNxOAaSUOm6lx4Xjg
   S7PS+4TPVYsgWr0FgwcAdykRkq6ncqeyNs2xxeaAs6BmaS4uZIxKH9Auu
   LTUc7L+4aT/1CP7/pHRbYJWM8YNyCpjXvm5v3WTHekLqy9m5+iqfNBQVj
   A==;
X-CSE-ConnectionGUID: 5RxkVw0nTBKUAe/B6D1c2A==
X-CSE-MsgGUID: rBTjcLYET7ay1xFv5wMJsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="11824295"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="11824295"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 11:25:21 -0700
X-CSE-ConnectionGUID: O+3bOaV0S6ibrmMk1V/vgg==
X-CSE-MsgGUID: A9QzeHKJSR2EfFe7V5UyiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40815500"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 11:25:20 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCkSa-000Fpx-1V;
	Thu, 30 May 2024 18:25:11 +0000
Date: Fri, 31 May 2024 02:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19669/22602]
 kernel/sched/fair.c:6701:33: error: invalid use of undefined type 'struct
 task_group'
Message-ID: <202405310225.ixqT7RKx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   03933bd11a64b94203f2cbe30ae71061807872fb
commit: 70a232a564cfa99401d197708cf380398ad5e2d7 [19669/22602] sched: Adjust wakeup cpu range according CPU util dynamicly
config: arm64-randconfig-001-20240531 (https://download.01.org/0day-ci/archive/20240531/202405310225.ixqT7RKx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310225.ixqT7RKx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310225.ixqT7RKx-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:3675:6: warning: no previous prototype for 'sync_entity_load_avg' [-Wmissing-prototypes]
    3675 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3688:6: warning: no previous prototype for 'remove_entity_load_avg' [-Wmissing-prototypes]
    3688 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:5206:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    5206 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'set_task_select_cpus':
>> kernel/sched/fair.c:6701:33: error: invalid use of undefined type 'struct task_group'
    6701 |                 if (unlikely(!tg->se[cpu]))
         |                                 ^~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   kernel/sched/fair.c:6707:61: error: invalid use of undefined type 'struct task_group'
    6707 |                         spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
         |                                                             ^~
   kernel/sched/fair.c:6720:35: error: invalid use of undefined type 'struct task_group'
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
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:11034:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   11034 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11036:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   11036 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11041:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   11041 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:11043:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   11043 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/migrate.h:6,
                    from kernel/sched/sched.h:52:
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
