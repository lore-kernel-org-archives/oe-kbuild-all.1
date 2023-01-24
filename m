Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777EBA31
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Jan 2023 03:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674531879; x=1706067879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SEcqvZ0JXaK+afy7MEtJ3H2Ci23bWhe7KjX+WUvyfvs=;
  b=dIRpotA/N8Mgf4aNhw7IYYKlqfZfrMnYkNXZdeIodMbQMkrPvf58ye55
   LT+SP0YzgvIkWqK9UjJssfhHOcSJxWBKt5Z4DeYcTAUMM65J+VCn8VNY+
   TQofQcZ5+8q9AW5trAdCAwq4wtBE3LU2WilMh5rxrabYPf5URXmxMnzqz
   Yh2aSYfF/4B0britqTtqjnyNfas/ieL4HZJAV7hUsjl1t099PKQBgy5hH
   IytcTGFWrNtF2bk+GScGcS6c4FUAJgk6pq/KVrjZKPDZ2qK+Sl8cDlyr+
   z8Lu7+KyfLDw5Vku1YCctM00DCLzguN5o2pSO0Apg//Z0+V/zaPtAOwqq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="353493755"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="353493755"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 19:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="785926374"
X-IronPort-AV: E=Sophos;i="5.97,241,1669104000"; 
   d="scan'208";a="785926374"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Jan 2023 19:44:37 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKAEe-00066M-2P;
	Tue, 24 Jan 2023 03:44:36 +0000
Date: Tue, 24 Jan 2023 11:44:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jin Qian <jinqian@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-goldfish:android-4.14-q 1/1] kernel/sched/psi.c:1082:6:
 warning: no previous declaration for 'psi_trigger_destroy'
Message-ID: <202301241118.WL1Y7kml-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/goldfish android-4.14-q
head:   6e193ecd7a65f41aabc219c33deccd3152fde14c
commit: c41efc2a4924492456c78ab9b9cca213a856f09e [1/1] BACKPORT: psi: Fix uaf issue when psi trigger is destroyed while being polled
config: s390-randconfig-r026-20230123 (https://download.01.org/0day-ci/archive/20230124/202301241118.WL1Y7kml-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-goldfish https://android.googlesource.com/kernel/goldfish
        git fetch --no-tags android-goldfish android-4.14-q
        git checkout c41efc2a4924492456c78ab9b9cca213a856f09e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/sched.h:6:0,
                    from kernel/sched/psi.c:144:
   include/linux/sched/topology.h:197:1: warning: type qualifiers ignored on function return type [-Wignored-qualifiers]
    const struct sched_group_energy * const(*sched_domain_energy_f)(int cpu);
    ^~~~~
   kernel/sched/psi.c:1008:21: warning: no previous declaration for 'psi_trigger_create' [-Wmissing-declarations]
    struct psi_trigger *psi_trigger_create(struct psi_group *group,
                        ^~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:1082:6: warning: no previous declaration for 'psi_trigger_destroy' [-Wmissing-declarations]
    void psi_trigger_destroy(struct psi_trigger *t)
         ^~~~~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1145:14: warning: no previous declaration for 'psi_trigger_poll' [-Wmissing-declarations]
    unsigned int psi_trigger_poll(void **trigger_ptr, struct file *file,
                 ^~~~~~~~~~~~~~~~
   kernel/sched/psi.c:1260:37: warning: 'psi_cpu_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations psi_cpu_fops = {
                                        ^~~~~~~~~~~~
   kernel/sched/psi.c:1251:37: warning: 'psi_memory_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations psi_memory_fops = {
                                        ^~~~~~~~~~~~~~~
   kernel/sched/psi.c:1242:37: warning: 'psi_io_fops' defined but not used [-Wunused-const-variable=]
    static const struct file_operations psi_io_fops = {
                                        ^~~~~~~~~~~


vim +/psi_trigger_destroy +1082 kernel/sched/psi.c

  1081	
> 1082	void psi_trigger_destroy(struct psi_trigger *t)
  1083	{
  1084		struct psi_group *group;
  1085		struct kthread_worker *kworker_to_destroy = NULL;
  1086	
  1087		/*
  1088		 * We do not check psi_disabled since it might have been disabled after
  1089		 * the trigger got created.
  1090		 */
  1091		if (!t)
  1092			return;
  1093	
  1094		group = t->group;
  1095		/*
  1096		 * Wakeup waiters to stop polling. Can happen if cgroup is deleted
  1097		 * from under a polling process.
  1098		 */
  1099		wake_up_interruptible(&t->event_wait);
  1100	
  1101		mutex_lock(&group->trigger_lock);
  1102	
  1103		if (!list_empty(&t->node)) {
  1104			struct psi_trigger *tmp;
  1105			u64 period = ULLONG_MAX;
  1106	
  1107			list_del(&t->node);
  1108			group->nr_triggers[t->state]--;
  1109			if (!group->nr_triggers[t->state])
  1110				group->poll_states &= ~(1 << t->state);
  1111			/* reset min update period for the remaining triggers */
  1112			list_for_each_entry(tmp, &group->triggers, node)
  1113				period = min(period, div_u64(tmp->win.size,
  1114						UPDATES_PER_WINDOW));
  1115			group->poll_min_period = period;
  1116			/* Destroy poll_kworker when the last trigger is destroyed */
  1117			if (group->poll_states == 0) {
  1118				group->polling_until = 0;
  1119				kworker_to_destroy = rcu_dereference_protected(
  1120						group->poll_kworker,
  1121						lockdep_is_held(&group->trigger_lock));
  1122				rcu_assign_pointer(group->poll_kworker, NULL);
  1123			}
  1124		}
  1125	
  1126		mutex_unlock(&group->trigger_lock);
  1127	
  1128		/*
  1129		 * Wait for psi_schedule_poll_work RCU to complete its read-side
  1130		 * critical section before destroying the trigger and optionally the
  1131		 * poll_task.
  1132		 */
  1133		synchronize_rcu();
  1134		/*
  1135		 * Destroy the kworker after releasing trigger_lock to prevent a
  1136		 * deadlock while waiting for psi_poll_work to acquire trigger_lock
  1137		 */
  1138		if (kworker_to_destroy) {
  1139			kthread_cancel_delayed_work_sync(&group->poll_work);
  1140			kthread_destroy_worker(kworker_to_destroy);
  1141		}
  1142		kfree(t);
  1143	}
  1144	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
