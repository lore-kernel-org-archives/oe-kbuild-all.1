Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05314265
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Feb 2024 05:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708063046; cv=none; b=ZF0KWtZkg+m0O7OvuHJ+kL/YSLa6soYLHOu3zIU3LJEK43PwXytcRGJ2U4RiZqDiuc5TBeAJW7OtThUZjpxNQbifZzHiwGdwEa3bOi5/2TQSyfmh52o6vk9xAk7Ft+Hc/QYyZ7YkdXoENHRD3d0GWeuM567CPiW5Hya1u1DrzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708063046; c=relaxed/simple;
	bh=bMjY8WD9GNw3lqtDH2pBllR2wVsPOwf42LVfzneKmsI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4l23+1ZO9InF6unoKlUFaNpUc/nDfYzPiLvAqDzzRxXb6I+ql7zxVkkZveFpNoriL/7RE48zEVl1Alcjc/chHIaIWy0hdRL8Op9jwM0VvG9DTi4i8kY8ioOklk3WFFzbkmyB2MqdCTiNzIl7Dxyai9+/mYAjZSAKHRYMsw9MBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UguO+ymm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UguO+ymm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708063044; x=1739599044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMjY8WD9GNw3lqtDH2pBllR2wVsPOwf42LVfzneKmsI=;
  b=UguO+ymmuRjefQj0pHRa6KCiQB4dIta7I1XxMMOqOO8KJQb3bS3KB2um
   I1nkugOX74JnfT6N0vydnacLvQRw/NxhZJILfcGPFv/P183Ec7YIltRU3
   5BM9p5bzCEGWzCZqZKPAS2RwMbKS2brikgq8kNtGH5BrbHhaTOUEL9JMD
   lxH8a8tJGS8l2uwoMnWa5wdf8LA7msom+ds1wpggJ94a5GklDn4j9/IG6
   9z2KYpgnK3P6neaIbncSpJOzu/yyQ5yQyVSow2wLGQuur87oV0cPWrcd1
   4k564PIKSH5gcp/k/Sjs46qNMSZH5qgkbdxDEOw7o5+Mx1UTwDCXVRDys
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="2324246"
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="2324246"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2024 21:57:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,163,1705392000"; 
   d="scan'208";a="8447507"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 15 Feb 2024 21:57:22 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rarDN-00011U-2L;
	Fri, 16 Feb 2024 05:57:01 +0000
Date: Fri, 16 Feb 2024 13:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/44] kernel/sched/fair_eevdf.c:12923:32:
 error: 'struct rq' has no member named 'cfs_tasks'
Message-ID: <202402161341.D85P5SDG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   f0ad352e8fc4195bce44c3227c84dc084608600f
commit: 33508a693bdea05c8d33b4b664c19ce2886b8033 [34/44] CHROMIUM: sched: dynamically switch between cfs and eevdf
config: i386-randconfig-004-20240214 (https://download.01.org/0day-ci/archive/20240216/202402161341.D85P5SDG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240216/202402161341.D85P5SDG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402161341.D85P5SDG-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair_eevdf.c:708:6: warning: no previous prototype for 'update_entity_lag' [-Wmissing-prototypes]
     708 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c: In function 'update_curr_se':
   kernel/sched/fair_eevdf.c:1244:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1244 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_start':
   kernel/sched/fair_eevdf.c:1312:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1312 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_wait_end':
   kernel/sched/fair_eevdf.c:1332:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1332 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'update_stats_enqueue_sleeper':
   kernel/sched/fair_eevdf.c:1376:34: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1376 |         struct sched_statistics *stats;
         |                                  ^~~~~
   kernel/sched/fair_eevdf.c: In function 'set_next_entity':
   kernel/sched/fair_eevdf.c:5250:42: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    5250 |                 struct sched_statistics *stats;
         |                                          ^~~~~
   kernel/sched/fair_eevdf.c: At top level:
   kernel/sched/fair_eevdf.c:6257:6: warning: no previous prototype for 'init_cfs_bandwidth' [-Wmissing-prototypes]
    6257 | void init_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
         |      ^~~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c:12774:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   12774 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c:12776:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   12776 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c:12781:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   12781 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c:12783:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   12783 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c:12894:5: warning: no previous prototype for 'scheduler_switch_eevdf' [-Wmissing-prototypes]
   12894 | int scheduler_switch_eevdf(void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair_eevdf.c: In function 'scheduler_switch_eevdf':
>> kernel/sched/fair_eevdf.c:12923:32: error: 'struct rq' has no member named 'cfs_tasks'
   12923 |                 cfs_tasks = &rq->cfs_tasks;
         |                                ^~
   kernel/sched/fair_eevdf.c: At top level:
   kernel/sched/fair_eevdf.c:12955:5: warning: no previous prototype for 'sched_use_eevdf' [-Wmissing-prototypes]
   12955 | int sched_use_eevdf(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~


vim +12923 kernel/sched/fair_eevdf.c

 12893	
 12894	int scheduler_switch_eevdf(void *arg)
 12895	{
 12896		unsigned int use_eevdf = (unsigned int)((size_t) arg);
 12897		int cpu;
 12898		struct task_struct *p;
 12899		struct rq *rq;
 12900		int num_deq;
 12901		struct list_head* cpu_list;
 12902		struct list_head* cfs_tasks;
 12903		struct rq_flags rf;
 12904	
 12905		// 1. Remove all the scheduling entities from all rq.
 12906		// 2. Change the use_eevdf rq flags.
 12907		// 3. Add all the entities removed back to the rqs.
 12908		lockdep_assert_irqs_disabled();
 12909	
 12910		if (use_eevdf == sysctl_sched_use_eevdf)
 12911			return 0;
 12912	
 12913		// Dequeue all the tasks
 12914		for_each_cpu(cpu, cpu_possible_mask) {
 12915			num_deq = 0;
 12916			cpu_list = &per_cpu(eevdf_switch_tasks, (cpu));
 12917	
 12918			INIT_LIST_HEAD(cpu_list);
 12919			// Since this is running in a stop_machine we don't need to take the
 12920			// lock, but to make lockdep_asserts happy.
 12921			rq = cpu_rq(cpu);
 12922			rq_lock(rq, &rf);
 12923			cfs_tasks = &rq->cfs_tasks;
 12924			while(!list_empty(cfs_tasks)) {
 12925				p = list_first_entry(cfs_tasks, struct task_struct, se.group_node);
 12926				num_deq++;
 12927				dequeue_task(rq, p, DEQUEUE_SAVE);
 12928				list_add(&p->se.group_node, cpu_list);
 12929			}
 12930			if (rb_first_cached(&rq->cfs.tasks_timeline) || rq->cfs.nr_running)
 12931				pr_err("unexpected tasks on rq: num_deq=%d, cfs_rq->nr_running=%d\n",
 12932						num_deq, rq->cfs.nr_running);
 12933			rq_unlock(rq, &rf);
 12934		}
 12935	
 12936		// Switch the EEVDF flag
 12937		sysctl_sched_use_eevdf = use_eevdf;
 12938	
 12939		// Enqueue all the taks back into the rqs
 12940		for_each_cpu(cpu, cpu_possible_mask) {
 12941			cpu_list = &per_cpu(eevdf_switch_tasks, (cpu));
 12942			rq = cpu_rq(cpu);
 12943			rq_lock(rq, &rf);
 12944			while(!list_empty(cpu_list)) {
 12945				p = list_first_entry(cpu_list, struct task_struct, se.group_node);
 12946				list_del(&p->se.group_node);
 12947				enqueue_task(rq, p, ENQUEUE_RESTORE);
 12948			}
 12949			rq_unlock(rq, &rf);
 12950		}
 12951	
 12952		return 0;
 12953	}
 12954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
