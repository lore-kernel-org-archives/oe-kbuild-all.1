Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3508F40
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 14:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748700401; cv=none; b=bFchyOTvw9+E2d7F1uOy5VaDVJkkeT8z005J3W3GMiQObsPZEpAmdfZ0dzE8MUdvzCNUTgfRHu6vegSBJnCJvBTISFaSJRA73M195BJk9Re2BJN7L3N4x0d/AnRp78U7E+KzK3eQ31/CKC1I6qUH96FWatbexSiX7AGQfEVvT1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748700401; c=relaxed/simple;
	bh=zgDDeTDV7HTqLgNQeGS4QA/IJQ7LgmO9Zx4mriK6ask=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oK87Mnr0j5ZjRKfAfpyl3Kh+qPZrhKoAmSdTahmzK4nDTDRPd3qt4ZiKV1lyddADblY6qiR+fopcMeDAyuRN2ZLlIvOwfsTDYuEdnPIWh6QOPOQcR6s8CVtoPgaf3yvX0sz1H2Tcn12RYirKxfFw/Nr1auK39p2j0iUzj6HIhZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXEH55Su; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXEH55Su"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748700399; x=1780236399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zgDDeTDV7HTqLgNQeGS4QA/IJQ7LgmO9Zx4mriK6ask=;
  b=fXEH55SuQowbB2tXFxzmNRamEdp4pD2sKFEl88xnqEOa5+EqX/DySUKV
   KRPJyA6h2ZIggJvDzXhwUarzWr/TzD4xAHkGsOirx9+qXnjJhyS8XBIeH
   rjLSH+QlCCJqJtMsgKK7fNdJjAxHodRkuFEv9oWuTOE/irabSmwtM7piK
   iPq//Aut1azwXGg0srRea7TWn2WEPhXiL9Ct7cJnV4PyiWmW8liCnSYSc
   BiTrAjlA4CUqIu+UCNwEF/4cHLEupy12boJZBdpkOM+2ddMk/qkvStDGs
   qMH51sMXNzjCs6jcKdM8IR8vVjnbsJTNIr9IYMEfwj/NgSvBH0CcfeBzr
   w==;
X-CSE-ConnectionGUID: qVP3y5vqSuG/p43Rb0yJZg==
X-CSE-MsgGUID: G1Nt7dEJQ2y2KWDni3s1Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="50646020"
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="50646020"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 07:06:39 -0700
X-CSE-ConnectionGUID: /ruK77gOSi2kE6QH7FX6Kw==
X-CSE-MsgGUID: sWT9Fm36SWuBwJYMey3URA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,198,1744095600"; 
   d="scan'208";a="144773034"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa007.jf.intel.com with ESMTP; 31 May 2025 07:06:38 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLMr5-00011O-2N;
	Sat, 31 May 2025 14:06:35 +0000
Date: Sat, 31 May 2025 22:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 1/1]
 kernel/sched/psi.c:1147:6: warning: no previous prototype for
 'psi_trigger_destroy'
Message-ID: <202505312205.1zr1I6bx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   b97c62c4e7d1e80fb6a2cb0cb381f03bbcd26a4e
commit: d4e4e61d4a5b87bfc9953c306a11d35d869417fd [1/1] psi: Fix uaf issue when psi trigger is destroyed while being polled
config: i386-buildonly-randconfig-2001-20250503 (https://download.01.org/0day-ci/archive/20250531/202505312205.1zr1I6bx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505312205.1zr1I6bx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505312205.1zr1I6bx-lkp@intel.com/

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
