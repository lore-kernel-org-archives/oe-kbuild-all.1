Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCAC3C9EF8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Apr 2026 13:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775653516; cv=none; b=fZSgOmOgV4wHJCEpaJV+DKJbzZjMttrOracMyNedUMwSEjuOS4Xoqq9RyLqzWYox55ZKIe99Oy/f6hzhRz5fBtBOY90kipbDd0zRKNv12P8S1GGYGXq+4aibkhsZmcqW2NZy0XKg7FKBsughljgLXFxIyxmIPOSYnCoKiKWKz9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775653516; c=relaxed/simple;
	bh=pAbATCU4UWxYks/mUscPF2GEd5MYcJq6ho3VNOqddCA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vhsf3Cbu92bG7Z8kT+iigGOUyvo7Hwzn6vzR0Xjo9ObPA2f6YtaiyWWcTc3kBsuG9tt6DnGHv+MkZA01NjwiZWv85GPqFMW7SUQmOKWF685wpWkGxoymTY4P/4cvQCMdf9ydq4xd2fEbU+pwSAJKuogOavpVOrcRU48IIiFGVZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cz/nPih/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cz/nPih/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775653514; x=1807189514;
  h=date:from:to:cc:subject:message-id;
  bh=pAbATCU4UWxYks/mUscPF2GEd5MYcJq6ho3VNOqddCA=;
  b=cz/nPih/JElEXKxV5A0JzguVUf8wyBKLV6RBPsukp76TD9xntQG7r4qw
   e4hF/2DsHzk8sZELwSb8nhmgHJYgVmYNwjroPON4u5tf70tD+jGIBprQ+
   Qxrl8rFz0+TMeHMi0mIrnUzh4zgzRs9SLKXtRIymqolrlScR8P8+K86Nl
   CG5vMMHwL+dn4dn16SHFS9DV8Bf8FpdQdIEy+uvREg1Qtg5PsIiCpRqin
   0Q1GWWoNyqVl/YnEFfL/sD4AkUYk0kJ869GD3EcA3TRgiEnK7JdXrWS2x
   6nMIebVIqxhruLoB250RwPJ5fGydIwS8ntjZ9MyNTIF2U1VKEZ109FhAQ
   A==;
X-CSE-ConnectionGUID: 7BHVB/WySIeYOtRY0MLJGA==
X-CSE-MsgGUID: 69LCKuHyTx2VTzV4ttHt6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80522263"
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="80522263"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 06:05:01 -0700
X-CSE-ConnectionGUID: anxtQgIASZ+0+GW/SeJYiA==
X-CSE-MsgGUID: Qndmrv21S66HXpx6Hxg17w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,167,1770624000"; 
   d="scan'208";a="266453555"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 08 Apr 2026 06:05:00 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wASaW-000000001qb-3hTK;
	Wed, 08 Apr 2026 13:04:56 +0000
Date: Wed, 08 Apr 2026 21:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-12 0/1]
 kernel/sched/psi.c:1147:6: warning: no previous prototype for
 'psi_trigger_destroy'
Message-ID: <202604082001.sdkFC8LG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-12
head:   730d06ec05ff5dc34389ff99ea4009411efba5e6
commit: d4e4e61d4a5b87bfc9953c306a11d35d869417fd [0/1] psi: Fix uaf issue when psi trigger is destroyed while being polled
config: i386-buildonly-randconfig-003-20260408 (https://download.01.org/0day-ci/archive/20260408/202604082001.sdkFC8LG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260408/202604082001.sdkFC8LG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604082001.sdkFC8LG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/psi.c:1077:21: warning: no previous prototype for 'psi_trigger_create' [-Wmissing-prototypes]
    1077 | struct psi_trigger *psi_trigger_create(struct psi_group *group,
         |                     ^~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1147:6: warning: no previous prototype for 'psi_trigger_destroy' [-Wmissing-prototypes]
    1147 | void psi_trigger_destroy(struct psi_trigger *t)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1214:10: warning: no previous prototype for 'psi_trigger_poll' [-Wmissing-prototypes]
    1214 | __poll_t psi_trigger_poll(void **trigger_ptr,
         |          ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1329:30: warning: 'psi_cpu_proc_ops' defined but not used [-Wunused-const-variable=]
    1329 | static const struct proc_ops psi_cpu_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1320:30: warning: 'psi_memory_proc_ops' defined but not used [-Wunused-const-variable=]
    1320 | static const struct proc_ops psi_memory_proc_ops = {
         |                              ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1311:30: warning: 'psi_io_proc_ops' defined but not used [-Wunused-const-variable=]
    1311 | static const struct proc_ops psi_io_proc_ops = {
         |                              ^~~~~~~~~~~~~~~


vim +/psi_trigger_destroy +1147 kernel/sched/psi.c

  1146	
> 1147	void psi_trigger_destroy(struct psi_trigger *t)
  1148	{
  1149		struct psi_group *group;
  1150		struct task_struct *task_to_destroy = NULL;
  1151	
  1152		/*
  1153		 * We do not check psi_disabled since it might have been disabled after
  1154		 * the trigger got created.
  1155		 */
  1156		if (!t)
  1157			return;
  1158	
  1159		group = t->group;
  1160		/*
  1161		 * Wakeup waiters to stop polling. Can happen if cgroup is deleted
  1162		 * from under a polling process.
  1163		 */
  1164		wake_up_interruptible(&t->event_wait);
  1165	
  1166		mutex_lock(&group->trigger_lock);
  1167	
  1168		if (!list_empty(&t->node)) {
  1169			struct psi_trigger *tmp;
  1170			u64 period = ULLONG_MAX;
  1171	
  1172			list_del(&t->node);
  1173			group->nr_triggers[t->state]--;
  1174			if (!group->nr_triggers[t->state])
  1175				group->poll_states &= ~(1 << t->state);
  1176			/* reset min update period for the remaining triggers */
  1177			list_for_each_entry(tmp, &group->triggers, node)
  1178				period = min(period, div_u64(tmp->win.size,
  1179						UPDATES_PER_WINDOW));
  1180			group->poll_min_period = period;
  1181			/* Destroy poll_task when the last trigger is destroyed */
  1182			if (group->poll_states == 0) {
  1183				group->polling_until = 0;
  1184				task_to_destroy = rcu_dereference_protected(
  1185						group->poll_task,
  1186						lockdep_is_held(&group->trigger_lock));
  1187				rcu_assign_pointer(group->poll_task, NULL);
  1188				del_timer(&group->poll_timer);
  1189			}
  1190		}
  1191	
  1192		mutex_unlock(&group->trigger_lock);
  1193	
  1194		/*
  1195		 * Wait for psi_schedule_poll_work RCU to complete its read-side
  1196		 * critical section before destroying the trigger and optionally the
  1197		 * poll_task.
  1198		 */
  1199		synchronize_rcu();
  1200		/*
  1201		 * Stop kthread 'psimon' after releasing trigger_lock to prevent a
  1202		 * deadlock while waiting for psi_poll_work to acquire trigger_lock
  1203		 */
  1204		if (task_to_destroy) {
  1205			/*
  1206			 * After the RCU grace period has expired, the worker
  1207			 * can no longer be found through group->poll_task.
  1208			 */
  1209			kthread_stop(task_to_destroy);
  1210		}
  1211		kfree(t);
  1212	}
  1213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
