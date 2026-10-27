Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793106789;
	b=LTk+MrhiOesTwIERrdR/6SUSPx6AE/9kf8f2lOLqY4Ex8QuOEyWycyprxqGQrehmemie
	 rwlrHNUWN3I7zalmAc8TSIJo0JMQcrJQgJqKPDp0D5h2mK4oJcgrAA5JbUhPe8ZBxH8q6
	 73hEBuq9qjyNdNDBxNgHnCSULRm+pt51P1cKnU/vodVUfLtnSuhIaCVbjDRiBYQ7eQZn4
	 mIBS36ZwYENeWMyQ9VskUXYvkinmuzp4WKkBkLcw1Oj8E99Kupu31YMvTWINIDU1pSlEC
	 SZL14HI7SAXtKa4x+hReIhoMoXUJ1ga6VDj49yO97tzlCcp3FhixouLLQVuJByG/2xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793106789;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=i65bU/0JewBJONT3eoF4zNEhk8u3g2V22ue8bH+DBjs=;
	b=i2azPrArvJYHdE5gMXqm87MtTbsXAxySH0Hld9PJOlUQ/ncVrDYstjkBNTOtCXBah1ao
	 BRHrbmVQl43FbGNqiiSaWy/v+uBe2ysCFMAyOHQgIWV8i4Zujbc/f02dIgKiHaCviNyGi
	 Bft7lGp36d+JBcPR+FXjE5qbEArRZsvF+X85gAGHprTpf6xtfMyA4uRxhDm86PL09RkUW
	 27Ukj5TZUGRvGWiorB66o6uzWEwmiwBhiQ/ylRHlwht4gDpnS00/nxaTegO0HNy79g/uO
	 WKthgIeyikR55tva1SGQa2Qs3JsgYe6VF3XN1kZyxITjs/7kw93OtzH3nEBYij/WJKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SRwnOah7;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ABF606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 13:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9ABF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SRwnOah7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793106788; x=1824642788;
  h=date:from:to:cc:subject:message-id;
  bh=TToRW698ripaVD5ZUTrD19g2fyTSOEDep+E8gKdnkEc=;
  b=SRwnOah7FldCvL01eYzx59NEoY52mlwM/PP7VH287yG+WZWNvuFzrHcR
   Pv5zoX9iXZ4adEJEr68HzYxXkr4dhr46ES9qrpQ7KrkEMoSCXAg+zGF62
   oNRsaYPicV1D7s0mTkYiP7bI6G8CNooAVW5sE2ZAoEVMpxGiMoQRuGu+I
   oCdoW1Omq26ccogBx4qDbp4le/pStywIldp+4UeYH2x4/zk9LRO/0m6b/
   ZcbdGY35xKxpLHza1YJmdD4CmdYqQqtOT7G+05lZzGD1cFwWxBNeaErFV
   uzWgQQ6cl51Wfk1ZuOwt39505zA+nZUVYl1bWCKE5v6VDEOjNZ4XRWrrO
   w==;
X-CSE-ConnectionGUID: 9X+MrSLBSwyyiA/TyL4CMg==
X-CSE-MsgGUID: T3c1F8ZATQ6qxsVCNVhkSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1835164"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1835164"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:13:08 -0700
X-CSE-ConnectionGUID: OAj68fUHRBOM1IHzZtSykQ==
X-CSE-MsgGUID: psAMdPIjQwyaRN4oxn2d6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4563765"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2026 06:13:07 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLgzA-000000004WD-1prp;
	Tue, 27 Oct 2026 13:13:04 +0000
Date: Tue, 27 Oct 2026 14:13:00 +0100
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/prjc 636/732]
 kernel/trace/rv/monitors/deadline/deadline.h:67:6: error: call to undeclared
 function 'dl_server'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610271426.RXzdSI2J-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/zen-kernel/zen-kernel 7.3/prjc
head:   f1ab44d828f1d74c6ec1d7a6cf32bc79cec13905
commit: 659df19f49db49a4bef8a3f327c7e71b85962a04 [636/732] sched/alt: [Sync] deadline sync-up fix
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261027/202610271426.RXzdSI2J-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271426.RXzdSI2J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271426.RXzdSI2J-lkp@intel.com/

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
   kernel/trace/rv/monitors/nomiss/nomiss.c:165:19: error: no member named 'dl' in 'struct task_struct'
     165 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:49: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                            ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:165:19: error: no member named 'dl' in 'struct task_struct'
     165 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:84: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                               ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:167:29: error: no member named 'dl' in 'struct task_struct'
     167 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:49: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                            ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:167:29: error: no member named 'dl' in 'struct task_struct'
     167 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^              ~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:84: note: expanded from macro 'EXPAND_ID_TASK'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                               ~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:175:12: error: no member named 'dl_server' in 'struct task_struct'
     175 |         if (next->dl_server)
         |             ~~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:176:41: error: no member named 'dl_server' in 'struct task_struct'
     176 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                 ~~~~  ^
   kernel/trace/rv/monitors/nomiss/nomiss.c:176:41: error: no member named 'dl_server' in 'struct task_struct'
     176 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
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
