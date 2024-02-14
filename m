Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE7B19472
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Feb 2024 11:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707910133; cv=none; b=oOcpl1fhYSjMku5c9+/v2CAaXD9t1ceGT1vyZ89b/h7m5YzHo/sbbGB8AaCdENwWc/7pf6dhxgeK71UmxvLERx+XWMPyoB4ByvybSflruLrWnIUBBQPFK0D9d1Nbla1/XAnbQBm1+24SzdsuwEI2bArx4niOUT0a9KF9cIDB86Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707910133; c=relaxed/simple;
	bh=BFUFK8O+xQNXA1VacagnBrfSe+58fdw1xQCgyvSjboQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hlLawrM22s5wdUUyZo97DcGbx4GPxM9URhokTWH+hAd+zhTW+tfpcoF2lXWqlJTJwHCicVdACXdeOuC39l22gwoVrbde327O4OOIMP7rgHQhPeCNYIcsOsOE+njQXV4N20Xos8m+ukyWZ/v8qn/C5fBSCbvlfUV9a5E7L42X7HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RwG1ygfS; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RwG1ygfS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707910131; x=1739446131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BFUFK8O+xQNXA1VacagnBrfSe+58fdw1xQCgyvSjboQ=;
  b=RwG1ygfSmGHeVguAM2iyrIkoawU2B5izgW2FjSrJiJGiEWBaFSw5uA0S
   ySavB4q1uMauLFMpChkhTrxM0uDHjzYkwYiyqlfIIRd/XfLT5khS5eOi5
   Lz//V9AjhXZaHHjPmTkkSIrzTGC4RJPsTEuoCZEs2g3ml90GAzQkBa0p9
   rTvylB/4rg2H2XgLXD2ls19tTJ5aF5SJwqtGY24gL4+9ocTb33e+NIPVa
   Lgf4b3lBGxK3eJ5tRNVYq2W3AVWSI2kfpTz7IBfX3FoX5PpIV3bKJL6c2
   Mx8we7UzeH3bZnjojN71r4byso5sD6DaRbDkY45kOl5uqd5amwcHeE5bj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="2092778"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="2092778"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2024 03:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="3071040"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Feb 2024 03:28:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1raDRW-0008ia-2g;
	Wed, 14 Feb 2024 11:28:46 +0000
Date: Wed, 14 Feb 2024 19:28:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/38] kernel/sched/fair_eevdf.c:12923:20:
 error: no member named 'cfs_tasks' in 'struct rq'
Message-ID: <202402141920.9iUywXGK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   efd81cb7bd74278826232f0556137a71fb757350
commit: 33508a693bdea05c8d33b4b664c19ce2886b8033 [34/38] CHROMIUM: sched: dynamically switch between cfs and eevdf
config: i386-buildonly-randconfig-002-20240214 (https://download.01.org/0day-ci/archive/20240214/202402141920.9iUywXGK-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240214/202402141920.9iUywXGK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402141920.9iUywXGK-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair_eevdf.c:708:6: warning: no previous prototype for function 'update_entity_lag' [-Wmissing-prototypes]
     708 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^
   kernel/sched/fair_eevdf.c:708:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     708 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         | ^
         | static 
   kernel/sched/fair_eevdf.c:1244:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1244 |                 struct sched_statistics *stats;
         |                                          ^
   kernel/sched/fair_eevdf.c:1312:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1312 |         struct sched_statistics *stats;
         |                                  ^
   kernel/sched/fair_eevdf.c:1332:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1332 |         struct sched_statistics *stats;
         |                                  ^
   kernel/sched/fair_eevdf.c:1376:27: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    1376 |         struct sched_statistics *stats;
         |                                  ^
   kernel/sched/fair_eevdf.c:5250:28: warning: variable 'stats' set but not used [-Wunused-but-set-variable]
    5250 |                 struct sched_statistics *stats;
         |                                          ^
>> kernel/sched/fair_eevdf.c:12923:20: error: no member named 'cfs_tasks' in 'struct rq'
    12923 |                 cfs_tasks = &rq->cfs_tasks;
          |                              ~~  ^
   kernel/sched/fair_eevdf.c:12894:5: warning: no previous prototype for function 'scheduler_switch_eevdf' [-Wmissing-prototypes]
    12894 | int scheduler_switch_eevdf(void *arg)
          |     ^
   kernel/sched/fair_eevdf.c:12894:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12894 | int scheduler_switch_eevdf(void *arg)
          | ^
          | static 
   kernel/sched/fair_eevdf.c:12955:5: warning: no previous prototype for function 'sched_use_eevdf' [-Wmissing-prototypes]
    12955 | int sched_use_eevdf(struct ctl_table *table, int write,
          |     ^
   kernel/sched/fair_eevdf.c:12955:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    12955 | int sched_use_eevdf(struct ctl_table *table, int write,
          | ^
          | static 
   8 warnings and 1 error generated.


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
