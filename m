Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3717041D10F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 09:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230858; cv=none; b=Yprn1JmQDpQVYBNIiLyG825jZMvqBIzDsxoIqLhAkIHukbGSIMPNO2uDpU4YJJlhdekO2rUur0tEbG1uZR9HwiCxeffWxXD+WLde3akf/ZdoXfdm0BhxdIeeehzHktXOcJZ6jFFVGleDg52bOx3l7f+x7aZx722I8uU8kIgQmw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230858; c=relaxed/simple;
	bh=VpOMoZiCz4Y4JPD9wV0uTQPh8pSShqsSIxayBBogCME=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q39R4ZFKz+SyfkRCU+lLyJbht+FiDUNTzbG1lnBTO9e6FNYvOctTrG+OyGpL+Ym0rcrt565sLK3jNkIP7cbrftA5NehZVz+lnYGQ9Z/KgH5ZbUs7vOGkXedsuWZ7M1C06CRI/TNx6syIPM1xarlQk+XYI0qkiXQORlLn6idqGJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zqch6xBx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zqch6xBx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785230857; x=1816766857;
  h=date:from:to:cc:subject:message-id;
  bh=VpOMoZiCz4Y4JPD9wV0uTQPh8pSShqsSIxayBBogCME=;
  b=Zqch6xBx5m+ck/jRkzIBOI/E2FUhlbeeQksi9ZULBK96FedszipJNmgD
   eC5Lbe3CfLY3o4HdJgJJoZ1GrM+NqiADro/NSIAwauplgVpwjmcG+Kwck
   VsrpLWA9Z9tGOwzWJ3AngabXt0HxCTwCloPn0ozRP5svYZ10aQcSvturH
   ofi+RHHSuwP9doZq5KCKJpW34fEwoqCcvigkSyyboIA61fSmS2CGSTMbp
   1Ei5DNncvpKGW7bl9fKIqy5Tq2juuk6gttbS8LcVNepUkwj8t+uvu/Eq1
   RL/X9bNIYzZJVTgOnLu31wpXa4mcO4Zjhj5vgnLsMp0LSy6v1Qlnepxn7
   g==;
X-CSE-ConnectionGUID: IlXobtiESeqVKXt3fX/C+g==
X-CSE-MsgGUID: xct4x0RQTAukUu0rp7hXGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84936825"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84936825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 02:27:36 -0700
X-CSE-ConnectionGUID: nbqV0hqWRHa9Ymz/NnuKcA==
X-CSE-MsgGUID: xatpN9CTSfSAixDNn/npYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="260306470"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 28 Jul 2026 02:27:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woe5x-00000000eBv-1jEv;
	Tue, 28 Jul 2026 09:27:30 +0000
Date: Tue, 28 Jul 2026 17:26:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 1/1]
 kernel/sched/psi.c:1147:6: warning: no previous prototype for
 'psi_trigger_destroy'
Message-ID: <202607281748.z5BN1zK8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Suren,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   68b45855d7865a3c7836a9f017f8c337f3a15367
commit: d4e4e61d4a5b87bfc9953c306a11d35d869417fd [1/1] psi: Fix uaf issue when psi trigger is destroyed while being polled
config: arm-randconfig-004-20260728 (https://download.01.org/0day-ci/archive/20260728/202607281748.z5BN1zK8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607281748.z5BN1zK8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607281748.z5BN1zK8-lkp@intel.com/

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
