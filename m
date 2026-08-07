Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E205F473C76
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 12:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786104297; cv=none; b=jyk0nlcFkSd1zZPrlTIOvU4AiR3T/0FnhNQrWnez/bJ4PN/xrPyNnglPm+KPs45L6KnKS8meHcKwZLv5Nv4YHjtIRCCzkFV5p/FZLhRtJ9C+ZCGcDmUDBs4J+NWMuyKcxLMqWRHpSIKavJuTArjI5hdjXb893e+YFmq4TDe6jNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786104297; c=relaxed/simple;
	bh=ZYKgvTIKfzamtsKOEHOUgdfCxfgjI+c5sSOuINsJdYo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fi9UmqgEDB4/iA1GPsZjACon8c8GXQ/QOUGN07/5CCZ9LcavNx1ozPaWBghiQFvvEv8bnJ7Qx6HhCK4tQg46fZQqFPxua4goi1GqBDGxwImC9HS3O/s7qjfdan+UM+w5OYuTDQSApspUJiwC02J8rdO7Ar5AvJiuZ4psPOdtt4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OVNOPEbF; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OVNOPEbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786104291; x=1817640291;
  h=date:from:to:cc:subject:message-id;
  bh=ZYKgvTIKfzamtsKOEHOUgdfCxfgjI+c5sSOuINsJdYo=;
  b=OVNOPEbFq4RUdfogDJL96kLyKU3e8/NQTl0XDHrays80+Y6QUrkbJ9WQ
   jGYnDoKr6g0VVst0elFO9tADxGBOIVGS0PDC4e43w28vZtz0nLnCT1wvd
   rN4+Ejf1IJA3TnRg4wgJ2HyLA2V2pL73Zj9FzWMnFpTsKwlJCYu2QXfCj
   oDGBgTfQJ8mTwm2VUTTxVlKjqXbOskRATbKwKxUIIwxTPVGp6ARfiW+5R
   QMr1QDpLa6k0uR8S3Jb8IU5Uy01jpFFzMSB9/V0QTfBoynWaLICe+349K
   qJKj4TVmjMgfXs6Xy6MO05BjWkWUzNmYaNpaRmy73U9klehMAUCKfaBZm
   Q==;
X-CSE-ConnectionGUID: 66GEBfxkQlCQr8vWWKWs+A==
X-CSE-MsgGUID: YXpDW+iARkqP97k5JY968Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="97864493"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="97864493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 05:04:31 -0700
X-CSE-ConnectionGUID: TETXYC7sQ3mdE7DKpfrQ1g==
X-CSE-MsgGUID: 3XOd8bmyTpukOrVLmhoznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="259049624"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 Aug 2026 05:04:29 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsJJK-00000000I5X-1Wdi;
	Fri, 07 Aug 2026 12:04:26 +0000
Date: Fri, 07 Aug 2026 20:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 636/719]
 kernel/trace/rv/monitors/deadline/deadline.h:75:1: warning: control reaches
 end of non-void function
Message-ID: <202608071923.kzOMaZCc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alfred,

FYI, the error/warning still remains.

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   bafe3c105f696e656e6f216bd7c2a76c373f2086
commit: de41db545b89a8e1f708de3813fec4a38d17f710 [636/719] sched/alt: [Sync] deadline sync-up fix
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260807/202608071923.kzOMaZCc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260807/202608071923.kzOMaZCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608071923.kzOMaZCc-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:217:34: note: in expansion of macro 'EXPAND_ID_TASK'
     217 |                 da_create_or_get(EXPAND_ID_TASK(p));
         |                                  ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:217:34: note: in expansion of macro 'EXPAND_ID_TASK'
     217 |                 da_create_or_get(EXPAND_ID_TASK(p));
         |                                  ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'handle_sched_wakeup':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:223:33: note: in expansion of macro 'EXPAND_ID_TASK'
     223 |                 da_handle_event(EXPAND_ID_TASK(tsk), sched_wakeup_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:223:33: note: in expansion of macro 'EXPAND_ID_TASK'
     223 |                 da_handle_event(EXPAND_ID_TASK(tsk), sched_wakeup_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'get_entity_id':
>> kernel/trace/rv/monitors/deadline/deadline.h:75:1: warning: control reaches end of non-void function [-Wreturn-type]
      75 | }
         | ^


vim +75 kernel/trace/rv/monitors/deadline/deadline.h

b133207deb7260 Gabriele Monaco 2026-03-30  48  
b133207deb7260 Gabriele Monaco 2026-03-30  49  /*
b133207deb7260 Gabriele Monaco 2026-03-30  50   * Use negative numbers for the server.
b133207deb7260 Gabriele Monaco 2026-03-30  51   * Currently only one fair server per CPU, may change in the future.
b133207deb7260 Gabriele Monaco 2026-03-30  52   */
b133207deb7260 Gabriele Monaco 2026-03-30  53  #define fair_server_id(cpu) (-cpu)
b133207deb7260 Gabriele Monaco 2026-03-30  54  #define ext_server_id(cpu) (-cpu - num_possible_cpus())
b133207deb7260 Gabriele Monaco 2026-03-30  55  #define NO_SERVER_ID (-2 * num_possible_cpus())
b133207deb7260 Gabriele Monaco 2026-03-30  56  /*
b133207deb7260 Gabriele Monaco 2026-03-30  57   * Get a unique id used for dl entities
b133207deb7260 Gabriele Monaco 2026-03-30  58   *
b133207deb7260 Gabriele Monaco 2026-03-30  59   * The cpu is not required for tasks as the pid is used there, if this function
b133207deb7260 Gabriele Monaco 2026-03-30  60   * is called on a dl_se that for sure corresponds to a task, DL_TASK can be
b133207deb7260 Gabriele Monaco 2026-03-30  61   * used in place of cpu.
b133207deb7260 Gabriele Monaco 2026-03-30  62   * We need the cpu for servers as it is provided in the tracepoint and we
b133207deb7260 Gabriele Monaco 2026-03-30  63   * cannot easily retrieve it from the dl_se (requires the struct rq definition).
b133207deb7260 Gabriele Monaco 2026-03-30  64   */
b133207deb7260 Gabriele Monaco 2026-03-30  65  static inline int get_entity_id(struct sched_dl_entity *dl_se, int cpu, u8 type)
b133207deb7260 Gabriele Monaco 2026-03-30  66  {
b133207deb7260 Gabriele Monaco 2026-03-30  67  	if (dl_server(dl_se) && type != DL_TASK) {
b133207deb7260 Gabriele Monaco 2026-03-30  68  		if (type == DL_SERVER_FAIR)
b133207deb7260 Gabriele Monaco 2026-03-30  69  			return fair_server_id(cpu);
b133207deb7260 Gabriele Monaco 2026-03-30  70  		if (type == DL_SERVER_EXT)
b133207deb7260 Gabriele Monaco 2026-03-30  71  			return ext_server_id(cpu);
b133207deb7260 Gabriele Monaco 2026-03-30  72  		return NO_SERVER_ID;
b133207deb7260 Gabriele Monaco 2026-03-30  73  	}
b133207deb7260 Gabriele Monaco 2026-03-30  74  	return dl_task_of(dl_se)->pid;
b133207deb7260 Gabriele Monaco 2026-03-30 @75  }
b133207deb7260 Gabriele Monaco 2026-03-30  76  
b133207deb7260 Gabriele Monaco 2026-03-30  77  static inline bool task_is_scx_enabled(struct task_struct *tsk)
b133207deb7260 Gabriele Monaco 2026-03-30  78  {
b133207deb7260 Gabriele Monaco 2026-03-30  79  	return IS_ENABLED(CONFIG_SCHED_CLASS_EXT) &&
b133207deb7260 Gabriele Monaco 2026-03-30  80  	       tsk->sched_class == rv_ext_sched_class;
b133207deb7260 Gabriele Monaco 2026-03-30  81  }
b133207deb7260 Gabriele Monaco 2026-03-30  82  
b133207deb7260 Gabriele Monaco 2026-03-30  83  /* Expand id and target as arguments for da functions */
b133207deb7260 Gabriele Monaco 2026-03-30  84  #define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu, type), dl_se
b133207deb7260 Gabriele Monaco 2026-03-30 @85  #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
b133207deb7260 Gabriele Monaco 2026-03-30  86  

:::::: The code at line 75 was first introduced by commit
:::::: b133207deb72609ad4da40c4d50128a5e150677b rv: Add nomiss deadline monitor

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
