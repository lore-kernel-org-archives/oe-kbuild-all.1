Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4DB6FBF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 20:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715805909; cv=none; b=B3z3NGu9hFgLzLtwMSHD3DKadGsgnU+8PuTBUgv8S7pl7ZHefk5QmD4mvQHWFvsGUC86NLnbLCEDqateIAdbiu8Fpb+UFVkRE/k538hsNSsuimXLVhIUvjHBPIw+wkJ+U1B2saTnx0wOgsCA6NU0NA/niPvyXCruhXSRr3Wp3Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715805909; c=relaxed/simple;
	bh=4OXESoy/YACGWLtrjHxlGrFlpsdfR46QYCjKc0xaJfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=agF2KBgYLlICJsT7ZOmYaRy+BB/jwaBD8cSCldvTgQICHJlBKl0KIzIdVkR6bPBEOdo9Q6RmAgcGAQa775lw6VOzKnj406kG4zFCrIJR7A/H6+En3vPmPF1YCXGa7wvehUl0E/TwlZ/AWz+AVCrxBrsqYTemTUkEmZIkf/xE7Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzyFWSub; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzyFWSub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715805908; x=1747341908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4OXESoy/YACGWLtrjHxlGrFlpsdfR46QYCjKc0xaJfc=;
  b=JzyFWSubV8AXZRlkV3vQ2m+nkuNmqFkY6v8bZboOhdQ+XhLwNilodz+F
   9HmGEOzpO00lRgElMwFYQ7m+EVOGS7EYmTlZXTsy9sTvcy508XgpjKBKH
   VkfXmvPRYKUBdhEJ1xHe3v94Fq1CiA4yNp4NS4pm2EjdjsoxTdUH2NdG/
   DqPJhssai285cHQTskTbXJHhsxYlYuf8HVgjluy+cm3ML1oP5atgI6WL2
   Tt5hEG+i0WHd/QPsc83vfNEWjw+hWV6144fr1CBhp46I6jyL594sjiXhT
   poBVmXwgqn7AaS+HYYZCbmV+/1d9Rwp/D2+uZL/KiVGzdK9w9hTzV0QnG
   w==;
X-CSE-ConnectionGUID: a0HCg16dSGO9qMegrIfBxQ==
X-CSE-MsgGUID: xlp57LGCTQ+5obgdiUk5Rg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="22485389"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="22485389"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 13:45:07 -0700
X-CSE-ConnectionGUID: hTBD/fu0TvSm2hHrxXiYZw==
X-CSE-MsgGUID: RS3AE3yISIW0RRzSiyFy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35738998"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2024 13:45:05 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7LUl-000DFr-1L;
	Wed, 15 May 2024 20:45:03 +0000
Date: Thu, 16 May 2024 04:44:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Liu <liuyongqiang13@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 19669/22436]
 kernel/sched/fair.c:6701:19: error: 'struct task_group' has no member named
 'se'
Message-ID: <202405160414.7SqMuv8G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c6c0f64fb7e3a44c5ddebc0bf9dfbb71901a28e3
commit: 70a232a564cfa99401d197708cf380398ad5e2d7 [19669/22436] sched: Adjust wakeup cpu range according CPU util dynamicly
config: x86_64-randconfig-122-20240516 (https://download.01.org/0day-ci/archive/20240516/202405160414.7SqMuv8G-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160414.7SqMuv8G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160414.7SqMuv8G-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:9718:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9718:9: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9718:9: sparse:    struct sched_domain *
   kernel/sched/fair.c:9915:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9915:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:9915:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:9929:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9929:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9929:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9938:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9938:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9938:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9963:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9963:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9963:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:9993:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9993:14: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9993:14: sparse:    struct sched_domain *
   kernel/sched/fair.c:5184:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:6215:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6215:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6215:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6206:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6206:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6206:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6215:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6215:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6215:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6206:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6206:15: sparse:    struct sched_domain_shared [noderef] <asn:4> *
   kernel/sched/fair.c:6206:15: sparse:    struct sched_domain_shared *
   kernel/sched/fair.c:6187:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6187:17: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:6187:17: sparse:    struct sched_domain *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:9808:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9808:16: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9808:16: sparse:    struct sched_domain *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:9808:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9808:16: sparse:    struct sched_domain [noderef] <asn:4> *
   kernel/sched/fair.c:9808:16: sparse:    struct sched_domain *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/sched.h:2254:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data [noderef] <asn:4> *
   kernel/sched/sched.h:2254:16: sparse:    struct update_util_data *
   kernel/sched/fair.c:3675:6: warning: no previous prototype for 'sync_entity_load_avg' [-Wmissing-prototypes]
    3675 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3688:6: warning: no previous prototype for 'remove_entity_load_avg' [-Wmissing-prototypes]
    3688 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'set_task_select_cpus':
>> kernel/sched/fair.c:6701:19: error: 'struct task_group' has no member named 'se'
    6701 |   if (unlikely(!tg->se[cpu]))
         |                   ^~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/sched/fair.c:6707:40: error: 'struct task_group' has no member named 'se'
    6707 |    spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
         |                                        ^~
   kernel/sched/fair.c:6720:21: error: 'struct task_group' has no member named 'se'
    6720 |   util_avg_sum += tg->se[cpu]->avg.util_avg;
         |                     ^~
   kernel/sched/fair.c: In function 'select_task_rq_fair':
   kernel/sched/fair.c:6747:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    6747 |  unsigned long time;
         |                ^~~~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
   kernel/sched/fair.c:7291:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    7291 |  unsigned long time;
         |                ^~~~
   In file included from include/linux/migrate.h:6,
                    from kernel/sched/sched.h:52,
                    from kernel/sched/fair.c:23:
   At top level:
   include/linux/mempolicy.h:329:13: warning: '__do_mbind' defined but not used [-Wunused-function]
     329 | static long __do_mbind(unsigned long start, unsigned long len,
         |             ^~~~~~~~~~
--
   kernel/sched/fair.c:3675:6: warning: no previous prototype for 'sync_entity_load_avg' [-Wmissing-prototypes]
    3675 | void sync_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:3688:6: warning: no previous prototype for 'remove_entity_load_avg' [-Wmissing-prototypes]
    3688 | void remove_entity_load_avg(struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/x86/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from kernel/sched/sched.h:5,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'set_task_select_cpus':
>> kernel/sched/fair.c:6701:19: error: 'struct task_group' has no member named 'se'
    6701 |   if (unlikely(!tg->se[cpu]))
         |                   ^~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
      77 | # define unlikely(x) __builtin_expect(!!(x), 0)
         |                                          ^
   kernel/sched/fair.c:6707:40: error: 'struct task_group' has no member named 'se'
    6707 |    spare = (long)(capacity_of(cpu) - tg->se[cpu]->avg.util_avg);
         |                                        ^~
   kernel/sched/fair.c:6720:21: error: 'struct task_group' has no member named 'se'
    6720 |   util_avg_sum += tg->se[cpu]->avg.util_avg;
         |                     ^~
   kernel/sched/fair.c: In function 'select_task_rq_fair':
   kernel/sched/fair.c:6747:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    6747 |  unsigned long time;
         |                ^~~~
   kernel/sched/fair.c: In function 'pick_next_task_fair':
   kernel/sched/fair.c:7291:16: warning: variable 'time' set but not used [-Wunused-but-set-variable]
    7291 |  unsigned long time;
         |                ^~~~
   In file included from include/linux/migrate.h:6,
                    from kernel/sched/sched.h:52,
                    from kernel/sched/fair.c:23:
   At top level:
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
