Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE535445AF2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 13:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790428579; cv=none; b=XZU1UDFPJGjJZOP1RGXaoFgl/fq/cyH5484bH11xBRwYHXv5gcuBYlw4o6rvN+V9xukBZLbrUrGlXhPMdP5IojQmwKpEpT8c4lvhuqBjvgihzjyDAQMuFtgiq/689Sm1k3gX3Ilm20cELfZMIopfHBJs7pxjw7iUeiChLfHKbCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790428579; c=relaxed/simple;
	bh=bH/EtHQQC3TV0ytDA2jT0lUNuORy73AZm4DIay9PctM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RnedSQz0bJcDL1TQOr9ooCJxNgk19l52yLuyLhrGmCU7yNl/ezblAWdA/Pu5SZz/kqhkfx3eJ3p83ZHTuXU+2KFQtc9vq/8cs/TC2r7Z4mTFS43Xeg9ZHzOdZpmRNZDH8PSxhlTVNJySWPD1VZMNi8Q4Zy4Wjw3xtTNtx5AFXBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdWTOVc3; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdWTOVc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790428573; x=1821964573;
  h=date:from:to:cc:subject:message-id;
  bh=bH/EtHQQC3TV0ytDA2jT0lUNuORy73AZm4DIay9PctM=;
  b=RdWTOVc3NsAgLpX4lwhTTKM/IKw2N0nKnHtX8HXm7DdBWf2Z1kcxKabG
   OYjljLTrU2kN45DdaFs8FXXbZ2hqWldDmTMeA2cYxOAZDHPmNe57DrOpD
   2/CQmYy1ac0YSCRgdTvVpXsv3YxVTQpg7XtooqWmAawODf0DSV5IWpXYU
   XAA/ceU8V+tdKDgC8LWji5Ukt/fAj7BoO+bjQ1lfeP+lUKM2Tn/p+TUbJ
   BlfYtxqx3sbL0a5562kuflBIZIfm5fk+02gls3J678NKple5Piciuhx+P
   i+g7Qb+vYRd6xDwKqI1NnjxasqCeRqxko5UpAPg8WvMq4vmDELwconFdC
   A==;
X-CSE-ConnectionGUID: yNsPkDDaQsmPRCGrNAX7uA==
X-CSE-MsgGUID: jWPS0wHmSgKnUbqaJ93TTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="108684777"
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="108684777"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 06:16:12 -0700
X-CSE-ConnectionGUID: BvE+A0aQRZu7+MWof6p/yA==
X-CSE-MsgGUID: Ljz/As6lRrKdL/PzhlXRFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,124,1787036400"; 
   d="scan'208";a="277761406"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 26 Sep 2026 06:16:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xASG8-00000000Lpf-01cA;
	Sat, 26 Sep 2026 13:16:08 +0000
Date: Sat, 26 Sep 2026 21:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 636/779]
 kernel/trace/rv/monitors/deadline/deadline.h:67:13: error: implicit
 declaration of function 'dl_server'
Message-ID: <202609262154.NY7NmpDp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   998c50092be8097be2939c7272c5cb9f0d143081
commit: 2aa4e79f80724416740dea5ee6450a3d338d8ea9 [636/779] sched/alt: [Sync] deadline sync-up fix
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260926/202609262154.NY7NmpDp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609262154.NY7NmpDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609262154.NY7NmpDp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/deadline/deadline.c:10:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'get_entity_id':
>> kernel/trace/rv/monitors/deadline/deadline.h:67:13: error: implicit declaration of function 'dl_server' [-Wimplicit-function-declaration]
      67 |         if (dl_server(dl_se) && type != DL_TASK) {
         |             ^~~~~~~~~
>> kernel/trace/rv/monitors/deadline/deadline.h:74:16: error: implicit declaration of function 'dl_task_of'; did you mean 'dl_task'? [-Wimplicit-function-declaration]
      74 |         return dl_task_of(dl_se)->pid;
         |                ^~~~~~~~~~
         |                dl_task
>> kernel/trace/rv/monitors/deadline/deadline.h:74:33: error: invalid type argument of '->' (have 'int')
      74 |         return dl_task_of(dl_se)->pid;
         |                                 ^~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'task_is_scx_enabled':
   kernel/trace/rv/monitors/deadline/deadline.h:80:19: error: 'struct task_struct' has no member named 'sched_class'
      80 |                tsk->sched_class == rv_ext_sched_class;
         |                   ^~
--
   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:25:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'get_entity_id':
>> kernel/trace/rv/monitors/deadline/deadline.h:67:13: error: implicit declaration of function 'dl_server' [-Wimplicit-function-declaration]
      67 |         if (dl_server(dl_se) && type != DL_TASK) {
         |             ^~~~~~~~~
>> kernel/trace/rv/monitors/deadline/deadline.h:74:16: error: implicit declaration of function 'dl_task_of'; did you mean 'dl_task'? [-Wimplicit-function-declaration]
      74 |         return dl_task_of(dl_se)->pid;
         |                ^~~~~~~~~~
         |                dl_task
>> kernel/trace/rv/monitors/deadline/deadline.h:74:33: error: invalid type argument of '->' (have 'int')
      74 |         return dl_task_of(dl_se)->pid;
         |                                 ^~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'task_is_scx_enabled':
   kernel/trace/rv/monitors/deadline/deadline.h:80:19: error: 'struct task_struct' has no member named 'sched_class'
      80 |                tsk->sched_class == rv_ext_sched_class;
         |                   ^~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'get_server':
   kernel/trace/rv/monitors/deadline/deadline.h:142:16: error: 'struct task_struct' has no member named 'dl_server'
     142 |         if (tsk->dl_server && get_server_type(tsk) == type)
         |                ^~
   kernel/trace/rv/monitors/deadline/deadline.h:143:27: error: 'struct task_struct' has no member named 'dl_server'
     143 |                 return tsk->dl_server;
         |                           ^~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'init_storage':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/deadline/deadline.h:176:48: note: in expansion of macro 'EXPAND_ID_TASK'
     176 |                         if (!da_create_storage(EXPAND_ID_TASK(p), NULL)) {
         |                                                ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/deadline/deadline.h:176:48: note: in expansion of macro 'EXPAND_ID_TASK'
     176 |                         if (!da_create_storage(EXPAND_ID_TASK(p), NULL)) {
         |                                                ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'handle_newtask':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/deadline/deadline.h:194:35: note: in expansion of macro 'EXPAND_ID_TASK'
     194 |                 da_create_storage(EXPAND_ID_TASK(task), NULL);
         |                                   ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/deadline/deadline.h:194:35: note: in expansion of macro 'EXPAND_ID_TASK'
     194 |                 da_create_storage(EXPAND_ID_TASK(task), NULL);
         |                                   ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'handle_exit':
   kernel/trace/rv/monitors/deadline/deadline.h:200:52: error: 'struct task_struct' has no member named 'dl'
     200 |                 da_destroy_storage(get_entity_id(&p->dl, DL_TASK, DL_TASK));
         |                                                    ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'ha_get_env':
   kernel/trace/rv/monitors/nomiss/nomiss.c:43:25: error: implicit declaration of function 'dl_is_implicit' [-Wimplicit-function-declaration]
      43 |                 return !dl_is_implicit(ha_get_target(ha_mon));
         |                         ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'handle_sched_switch':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:179:33: note: in expansion of macro 'EXPAND_ID_TASK'
     179 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:179:33: note: in expansion of macro 'EXPAND_ID_TASK'
     179 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:181:43: note: in expansion of macro 'EXPAND_ID_TASK'
     181 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:181:43: note: in expansion of macro 'EXPAND_ID_TASK'
     181 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c:189:17: error: 'struct task_struct' has no member named 'dl_server'
     189 |         if (next->dl_server)
         |                 ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:190:53: error: 'struct task_struct' has no member named 'dl_server'
     190 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                     ^~
   kernel/trace/rv/monitors/deadline/deadline.h:84:51: note: in definition of macro 'EXPAND_ID'
      84 | #define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu, type), dl_se
         |                                                   ^~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c:190:53: error: 'struct task_struct' has no member named 'dl_server'
     190 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                     ^~
   kernel/trace/rv/monitors/deadline/deadline.h:84:70: note: in definition of macro 'EXPAND_ID'
      84 | #define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu, type), dl_se
         |                                                                      ^~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'handle_sys_enter':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:215:26: note: in expansion of macro 'EXPAND_ID_TASK'
     215 |                 da_reset(EXPAND_ID_TASK(p));
         |                          ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:215:26: note: in expansion of macro 'EXPAND_ID_TASK'
     215 |                 da_reset(EXPAND_ID_TASK(p));
         |                          ^~~~~~~~~~~~~~


vim +/dl_server +67 kernel/trace/rv/monitors/deadline/deadline.h

b133207deb72609 Gabriele Monaco 2026-03-30  48  
b133207deb72609 Gabriele Monaco 2026-03-30  49  /*
b133207deb72609 Gabriele Monaco 2026-03-30  50   * Use negative numbers for the server.
b133207deb72609 Gabriele Monaco 2026-03-30  51   * Currently only one fair server per CPU, may change in the future.
b133207deb72609 Gabriele Monaco 2026-03-30  52   */
b133207deb72609 Gabriele Monaco 2026-03-30  53  #define fair_server_id(cpu) (-cpu)
b133207deb72609 Gabriele Monaco 2026-03-30  54  #define ext_server_id(cpu) (-cpu - num_possible_cpus())
b133207deb72609 Gabriele Monaco 2026-03-30  55  #define NO_SERVER_ID (-2 * num_possible_cpus())
b133207deb72609 Gabriele Monaco 2026-03-30  56  /*
b133207deb72609 Gabriele Monaco 2026-03-30  57   * Get a unique id used for dl entities
b133207deb72609 Gabriele Monaco 2026-03-30  58   *
b133207deb72609 Gabriele Monaco 2026-03-30  59   * The cpu is not required for tasks as the pid is used there, if this function
b133207deb72609 Gabriele Monaco 2026-03-30  60   * is called on a dl_se that for sure corresponds to a task, DL_TASK can be
b133207deb72609 Gabriele Monaco 2026-03-30  61   * used in place of cpu.
b133207deb72609 Gabriele Monaco 2026-03-30  62   * We need the cpu for servers as it is provided in the tracepoint and we
b133207deb72609 Gabriele Monaco 2026-03-30  63   * cannot easily retrieve it from the dl_se (requires the struct rq definition).
b133207deb72609 Gabriele Monaco 2026-03-30  64   */
b133207deb72609 Gabriele Monaco 2026-03-30  65  static inline int get_entity_id(struct sched_dl_entity *dl_se, int cpu, u8 type)
b133207deb72609 Gabriele Monaco 2026-03-30  66  {
b133207deb72609 Gabriele Monaco 2026-03-30 @67  	if (dl_server(dl_se) && type != DL_TASK) {
b133207deb72609 Gabriele Monaco 2026-03-30  68  		if (type == DL_SERVER_FAIR)
b133207deb72609 Gabriele Monaco 2026-03-30  69  			return fair_server_id(cpu);
b133207deb72609 Gabriele Monaco 2026-03-30  70  		if (type == DL_SERVER_EXT)
b133207deb72609 Gabriele Monaco 2026-03-30  71  			return ext_server_id(cpu);
b133207deb72609 Gabriele Monaco 2026-03-30  72  		return NO_SERVER_ID;
b133207deb72609 Gabriele Monaco 2026-03-30  73  	}
b133207deb72609 Gabriele Monaco 2026-03-30 @74  	return dl_task_of(dl_se)->pid;
b133207deb72609 Gabriele Monaco 2026-03-30  75  }
b133207deb72609 Gabriele Monaco 2026-03-30  76  

:::::: The code at line 67 was first introduced by commit
:::::: b133207deb72609ad4da40c4d50128a5e150677b rv: Add nomiss deadline monitor

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
