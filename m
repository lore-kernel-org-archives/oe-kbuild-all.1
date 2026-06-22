Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5603F33F597
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782168604; cv=none; b=D4B87F1Mld+mRp80Jj1dQrQVHQbbMtRY5DRAGDJ2y9Tg42zNjbYPanpWdT56X7uHH+13MyLleatPabtG3Om2EDJxO9ZY2K4ay92xB3+lCWITfimlZpAwhl2blF4z+EH/AbqnkWz/tJ80j+rBYP7bjxa7naiJ4E1RINZZWHki92w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782168604; c=relaxed/simple;
	bh=vzoHmoEAyPnRY5WNN/OKKDfZcltf/mH1rxF1QwtqDx4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RfVg+E9ubjQRa5BUsOFOoS0g1p0G+mFyHWmabPZixsWtS3Uuo52d/y2bOiiaI8K1bFsUCJvfuHln6K/YNl14XWuzEkK9a+Ql9ilP+CEc98kcuEpU90Xda7KY3x22ffzvoIFSFnC7hxSUI8ZrDUPhsy29FHvaz+cuNMHMMwn/5tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6VojtFL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6VojtFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782168603; x=1813704603;
  h=date:from:to:cc:subject:message-id;
  bh=vzoHmoEAyPnRY5WNN/OKKDfZcltf/mH1rxF1QwtqDx4=;
  b=P6VojtFLmZCHpfAZf7QPsfZs4uAaf9GVwDe3Ky/dJlK+Qn5z9U9PcNmO
   J474Iu7wyksyFeAjVotcEMs7w8IiPsMqMHfpDttFoLN4/tWCrfUZSe2vB
   VIhEcF+e5k7NAOysNDi0d+671EYQKD2aQLseXp7FesvyugkRdHWyAY2X7
   u5WaA6b8c+YybzuQVYO398exTLAWUnC98Jx13oaHOQauvtXxK5MGfdF7N
   0Vt+j8PbRTBR2Gdsfuu3pD05ZkmEhAlefG6vqC+1LKfoqdH/q14bmRRVb
   fRNdoReeHfLozEmWnPY6qXokk5YxWR2xy5qO9aSCuoEiRD8gn2uPCRsCr
   Q==;
X-CSE-ConnectionGUID: lE732pCmRR656uZRnpekuA==
X-CSE-MsgGUID: 7Xi3VF19TbKs6iyfnAAZDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82947523"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82947523"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 15:50:03 -0700
X-CSE-ConnectionGUID: JI+s6UUnS42nkbRZH4BlQg==
X-CSE-MsgGUID: rSzk19n4QV+V7Gx25ZIiug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="253242831"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jun 2026 15:50:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbnSo-0000000022N-1lld;
	Mon, 22 Jun 2026 22:49:58 +0000
Date: Tue, 23 Jun 2026 06:49:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 636/668]
 kernel/trace/rv/monitors/deadline/deadline.h:67:6: error: call to undeclared
 function 'dl_server'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202606230659.WvfReCJF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   554af5ca804c16da84a47b49a517697a9b81bb54
commit: de41db545b89a8e1f708de3813fec4a38d17f710 [636/668] sched/alt: [Sync] deadline sync-up fix
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260623/202606230659.WvfReCJF-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230659.WvfReCJF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230659.WvfReCJF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/deadline/deadline.c:10:
>> kernel/trace/rv/monitors/deadline/deadline.h:67:6: error: call to undeclared function 'dl_server'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |         if (dl_server(dl_se) && type != DL_TASK) {
         |             ^
>> kernel/trace/rv/monitors/deadline/deadline.h:74:9: error: call to undeclared function 'dl_task_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |         return dl_task_of(dl_se)->pid;
         |                ^
   kernel/trace/rv/monitors/deadline/deadline.h:74:9: note: did you mean 'dl_task'?
   include/linux/sched/deadline.h:7:19: note: 'dl_task' declared here
       7 | static inline int dl_task(struct task_struct *p)
         |                   ^
   In file included from kernel/trace/rv/monitors/deadline/deadline.c:10:
>> kernel/trace/rv/monitors/deadline/deadline.h:74:28: error: member reference type 'int' is not a pointer
      74 |         return dl_task_of(dl_se)->pid;
         |                ~~~~~~~~~~~~~~~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:80:14: error: no member named 'sched_class' in 'struct task_struct'
      80 |                tsk->sched_class == rv_ext_sched_class;
         |                ~~~  ^
   4 errors generated.
--
   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:25:
>> kernel/trace/rv/monitors/deadline/deadline.h:67:6: error: call to undeclared function 'dl_server'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      67 |         if (dl_server(dl_se) && type != DL_TASK) {
         |             ^
>> kernel/trace/rv/monitors/deadline/deadline.h:74:9: error: call to undeclared function 'dl_task_of'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      74 |         return dl_task_of(dl_se)->pid;
         |                ^
   kernel/trace/rv/monitors/deadline/deadline.h:74:9: note: did you mean 'dl_task'?
   include/linux/sched/deadline.h:7:19: note: 'dl_task' declared here
       7 | static inline int dl_task(struct task_struct *p)
         |                   ^
   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:25:
>> kernel/trace/rv/monitors/deadline/deadline.h:74:28: error: member reference type 'int' is not a pointer
      74 |         return dl_task_of(dl_se)->pid;
         |                ~~~~~~~~~~~~~~~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:80:14: error: no member named 'sched_class' in 'struct task_struct'
      80 |                tsk->sched_class == rv_ext_sched_class;
         |                ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:142:11: error: no member named 'dl_server' in 'struct task_struct'
     142 |         if (tsk->dl_server && get_server_type(tsk) == type)
         |             ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:143:15: error: no member named 'dl_server' in 'struct task_struct'
     143 |                 return tsk->dl_server;
         |                        ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:176:27: error: no member named 'dl' in 'struct task_struct'
     176 |                         if (!da_create_storage(EXPAND_ID_TASK(p), NULL)) {
         |                                                ^              ~
   kernel/trace/rv/monitors/deadline/deadline.h:85:49: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                            ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:176:27: error: no member named 'dl' in 'struct task_struct'
     176 |                         if (!da_create_storage(EXPAND_ID_TASK(p), NULL)) {
         |                                                ^              ~
   kernel/trace/rv/monitors/deadline/deadline.h:85:84: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                               ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:194:21: error: no member named 'dl' in 'struct task_struct'
     194 |                 da_create_storage(EXPAND_ID_TASK(task), NULL);
         |                                   ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:49: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                            ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:194:21: error: no member named 'dl' in 'struct task_struct'
     194 |                 da_create_storage(EXPAND_ID_TASK(task), NULL);
         |                                   ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:84: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                               ~~~  ^
   kernel/trace/rv/monitors/deadline/deadline.h:200:40: error: no member named 'dl' in 'struct task_struct'
     200 |                 da_destroy_storage(get_entity_id(&p->dl, DL_TASK, DL_TASK));
         |                                                   ~  ^
>> kernel/trace/rv/monitors/nomiss/nomiss.c:43:11: error: call to undeclared function 'dl_is_implicit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      43 |                 return !dl_is_implicit(ha_get_target(ha_mon));
         |                         ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:179:19: error: no member named 'dl' in 'struct task_struct'
     179 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:49: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                            ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:179:19: error: no member named 'dl' in 'struct task_struct'
     179 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:84: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                               ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:181:29: error: no member named 'dl' in 'struct task_struct'
     181 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:49: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                            ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:181:29: error: no member named 'dl' in 'struct task_struct'
     181 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:84: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                               ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:189:12: error: no member named 'dl_server' in 'struct task_struct'
     189 |         if (next->dl_server)
         |             ~~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:190:41: error: no member named 'dl_server' in 'struct task_struct'
     190 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                 ~~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:190:41: error: no member named 'dl_server' in 'struct task_struct'
     190 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                 ~~~~  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/dl_server +67 kernel/trace/rv/monitors/deadline/deadline.h

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
b133207deb7260 Gabriele Monaco 2026-03-30 @67  	if (dl_server(dl_se) && type != DL_TASK) {
b133207deb7260 Gabriele Monaco 2026-03-30  68  		if (type == DL_SERVER_FAIR)
b133207deb7260 Gabriele Monaco 2026-03-30  69  			return fair_server_id(cpu);
b133207deb7260 Gabriele Monaco 2026-03-30  70  		if (type == DL_SERVER_EXT)
b133207deb7260 Gabriele Monaco 2026-03-30  71  			return ext_server_id(cpu);
b133207deb7260 Gabriele Monaco 2026-03-30  72  		return NO_SERVER_ID;
b133207deb7260 Gabriele Monaco 2026-03-30  73  	}
b133207deb7260 Gabriele Monaco 2026-03-30 @74  	return dl_task_of(dl_se)->pid;
b133207deb7260 Gabriele Monaco 2026-03-30  75  }
b133207deb7260 Gabriele Monaco 2026-03-30  76  

:::::: The code at line 67 was first introduced by commit
:::::: b133207deb72609ad4da40c4d50128a5e150677b rv: Add nomiss deadline monitor

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
