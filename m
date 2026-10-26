Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047715;
	b=ku0geepmMYNV8906JzcTFbATMHDo09xKC9y/pdnGyRfFIIvVezUtLfeJl52s4laFljHu
	 vFqD4NKonpFsI1VhWvV578PnuWBrfWwYhy2/sqWhuM8yBnQn5siKuqWS7yicrYCfQ67lc
	 OahBclqdy3z/HyjjOOXlitRSQ7sjIBIpmVerXyTemsAnze/DzlkzV0rV7WnDU3abTevz8
	 w3RNL8P4nUrlxTL7t2BWmwHL1bel5AfFsrVcVT8zI/PqEeqr9Hyf/t8KDNsxr9Ctrc/ca
	 dANtS+3rbpGRny/49lOsPjB6FGAeH+IHpGwCSWvRAx0xEqV4iEpwuxQ+7V++66IMAsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047715;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2/WLB0Jks3IQO1Kke9fwdATJnMBw+elSj6VeQOoXONA=;
	b=aEtJTRFItTp6IFvx/6//HFjRrSaRYNIeozgknb0i0M71IWrV1tPcpHYs6BOPSCXy0KDJ
	 oaRXetN3TJQWyHpmNuldBTs/tNfgJ8OCfqsqxSSHCDUHqbqIZ9fDJ9MjZfVgK8/BwlDxX
	 OKlMy0MlsrFY58lXs6R24cDKSMlPBJNVOmqslLXs4xHG0DDydJwDpSFhK6SuUFSylmLGL
	 g5Wg6wODH8ltWnSrbKU0YO2FwLqHH+uFiofWrA8UU08FoF31WC0gCLjfIEhr99QV+hMfJ
	 UrZSzIu4mS7MTtX1jhjw9K1MtRbUgVRSiJ4qP2xWJmEmVIWbSywYkjDemNnFr1Ct9Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n+D9AJej;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02F606A31A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Oct 2026 20:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC02F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=n+D9AJej
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793047714; x=1824583714;
  h=date:from:to:cc:subject:message-id;
  bh=tcHJdiOwZqFoXt1LGy0WaHOzf9nHpNtMiEej1HgA++4=;
  b=n+D9AJejxROb6S3nifr/maXUBw9S94UBGe7qg7ZII0sFYDPn9PZX2EAe
   0/ieax3BwqFAKOcPyFUHGz1AZ+47e1m71nQDLu0+Iw7nAwo5RPcPAIloo
   ifXFVztazyYU7SJo2giQ7ZxErI8ckax2LiOvkO1PZUz+6aZq7/ypDQFmb
   IkAeD1o8X2oY9vsFT0ILP413p7VgCPgbvz3Hld6eEBbEpQIN+pSxH5CZ1
   lVDrJcrADUSGdk/dArm552QntYllQZllUz4rJFPD8frJPsKirRraXw5O3
   ydKysNNjjAd+nbMKC6z5bh4jnrPoTnNeAaQMK63GLUGxMwl1d3RCE0dtH
   w==;
X-CSE-ConnectionGUID: HtF3lF8+QSa/ILBIsswixA==
X-CSE-MsgGUID: 4m2BERmLTT2b4HDeLWM4PA==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1742796"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1742796"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 13:48:33 -0700
X-CSE-ConnectionGUID: zeZ2jGA2THKDZ3bz+AX4yQ==
X-CSE-MsgGUID: rgQMLafpS1mckyeCt/IRNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6191122"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 26 Oct 2026 13:48:32 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLRcL-000000004Dz-2YWf;
	Mon, 26 Oct 2026 20:48:29 +0000
Date: Mon, 26 Oct 2026 21:48:22 +0100
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.3/prjc 636/732]
 kernel/trace/rv/monitors/nomiss/nomiss.c:43:25: error: implicit declaration
 of function 'dl_is_implicit'
Message-ID: <202610262109.qOrDKLWj-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261026/202610262109.qOrDKLWj-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261026/202610262109.qOrDKLWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610262109.qOrDKLWj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/rv/monitors/nomiss/nomiss.c:25:
   kernel/trace/rv/monitors/deadline/deadline.h: In function 'get_entity_id':
   kernel/trace/rv/monitors/deadline/deadline.h:67:13: error: implicit declaration of function 'dl_server' [-Wimplicit-function-declaration]
      67 |         if (dl_server(dl_se) && type != DL_TASK) {
         |             ^~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:74:16: error: implicit declaration of function 'dl_task_of'; did you mean 'dl_task'? [-Wimplicit-function-declaration]
      74 |         return dl_task_of(dl_se)->pid;
         |                ^~~~~~~~~~
         |                dl_task
   kernel/trace/rv/monitors/deadline/deadline.h:74:33: error: invalid type argument of '->' (have 'int')
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
>> kernel/trace/rv/monitors/nomiss/nomiss.c:43:25: error: implicit declaration of function 'dl_is_implicit' [-Wimplicit-function-declaration]
      43 |                 return !dl_is_implicit(ha_get_target(ha_mon));
         |                         ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'handle_sched_switch':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:165:33: note: in expansion of macro 'EXPAND_ID_TASK'
     165 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:165:33: note: in expansion of macro 'EXPAND_ID_TASK'
     165 |                 da_handle_event(EXPAND_ID_TASK(prev), sched_switch_suspend_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:167:43: note: in expansion of macro 'EXPAND_ID_TASK'
     167 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:167:43: note: in expansion of macro 'EXPAND_ID_TASK'
     167 |                 da_handle_start_run_event(EXPAND_ID_TASK(next), sched_switch_in_nomiss);
         |                                           ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c:175:17: error: 'struct task_struct' has no member named 'dl_server'
     175 |         if (next->dl_server)
         |                 ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:176:53: error: 'struct task_struct' has no member named 'dl_server'
     176 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                     ^~
   kernel/trace/rv/monitors/deadline/deadline.h:84:51: note: in definition of macro 'EXPAND_ID'
      84 | #define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu, type), dl_se
         |                                                   ^~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c:176:53: error: 'struct task_struct' has no member named 'dl_server'
     176 |                 da_handle_start_event(EXPAND_ID(next->dl_server, cpu,
         |                                                     ^~
   kernel/trace/rv/monitors/deadline/deadline.h:84:70: note: in definition of macro 'EXPAND_ID'
      84 | #define EXPAND_ID(dl_se, cpu, type) get_entity_id(dl_se, cpu, type), dl_se
         |                                                                      ^~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'handle_sys_enter':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:201:26: note: in expansion of macro 'EXPAND_ID_TASK'
     201 |                 da_reset(EXPAND_ID_TASK(p));
         |                          ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:201:26: note: in expansion of macro 'EXPAND_ID_TASK'
     201 |                 da_reset(EXPAND_ID_TASK(p));
         |                          ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:203:34: note: in expansion of macro 'EXPAND_ID_TASK'
     203 |                 da_create_or_get(EXPAND_ID_TASK(p));
         |                                  ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:203:34: note: in expansion of macro 'EXPAND_ID_TASK'
     203 |                 da_create_or_get(EXPAND_ID_TASK(p));
         |                                  ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/nomiss/nomiss.c: In function 'handle_sched_wakeup':
   kernel/trace/rv/monitors/deadline/deadline.h:85:47: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                               ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:209:33: note: in expansion of macro 'EXPAND_ID_TASK'
     209 |                 da_handle_event(EXPAND_ID_TASK(tsk), sched_wakeup_nomiss);
         |                                 ^~~~~~~~~~~~~~
   kernel/trace/rv/monitors/deadline/deadline.h:85:82: error: 'struct task_struct' has no member named 'dl'
      85 | #define EXPAND_ID_TASK(tsk) get_entity_id(&tsk->dl, task_cpu(tsk), DL_TASK), &tsk->dl
         |                                                                                  ^~
   kernel/trace/rv/monitors/nomiss/nomiss.c:209:33: note: in expansion of macro 'EXPAND_ID_TASK'
     209 |                 da_handle_event(EXPAND_ID_TASK(tsk), sched_wakeup_nomiss);
         |                                 ^~~~~~~~~~~~~~


vim +/dl_is_implicit +43 kernel/trace/rv/monitors/nomiss/nomiss.c

b133207deb7260 Gabriele Monaco 2026-03-30  37  
b133207deb7260 Gabriele Monaco 2026-03-30  38  static u64 ha_get_env(struct ha_monitor *ha_mon, enum envs_nomiss env, u64 time_ns)
b133207deb7260 Gabriele Monaco 2026-03-30  39  {
b133207deb7260 Gabriele Monaco 2026-03-30  40  	if (env == clk_nomiss)
b133207deb7260 Gabriele Monaco 2026-03-30  41  		return ha_get_clk_ns(ha_mon, env, time_ns);
b133207deb7260 Gabriele Monaco 2026-03-30  42  	else if (env == is_constr_dl_nomiss)
b133207deb7260 Gabriele Monaco 2026-03-30 @43  		return !dl_is_implicit(ha_get_target(ha_mon));
b133207deb7260 Gabriele Monaco 2026-03-30  44  	else if (env == is_defer_nomiss)
b133207deb7260 Gabriele Monaco 2026-03-30  45  		return ha_get_target(ha_mon)->dl_defer;
b133207deb7260 Gabriele Monaco 2026-03-30  46  	return ENV_INVALID_VALUE;
b133207deb7260 Gabriele Monaco 2026-03-30  47  }
b133207deb7260 Gabriele Monaco 2026-03-30  48  

:::::: The code at line 43 was first introduced by commit
:::::: b133207deb72609ad4da40c4d50128a5e150677b rv: Add nomiss deadline monitor

:::::: TO: Gabriele Monaco <gmonaco@redhat.com>
:::::: CC: Gabriele Monaco <gmonaco@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
