Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF36524F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 02:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754534256; cv=none; b=mW32rwlMZdg29/A21YCZUFKCCl+pdjdZIP5lMpP5xe9+qW4Lih6vY8lT5HhRfMYCO64ypyhtq2KGBWKMB8MUIDsEkhgjpgt955vLBGjDIpTWXloVC3x5NTMX99LpmEotyIkTp4Aw/6wDzWA3imnlCAB2yc1yd50GrCex465Oxrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754534256; c=relaxed/simple;
	bh=La7uJGZrsGneTd3gmA0r/8CzOTHlDehmQx+Wy5k2adk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a7YJPxvcMpAmqN3gc8FApq52hMTuv4mG3XrRbNSHcu2HuQT3RvmxquSo7GGR+8EoM7lJ3OGfG0RUyc/kvdcZhUupFE+8u6tys6TdH7Yi8RzQcHq/3GSZVqkj24bb7kgt+gkKcXx5UEXg6nRgOoFrvOgfybZNA1wudpicU6yuLpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/j+cUpN; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/j+cUpN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754534254; x=1786070254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=La7uJGZrsGneTd3gmA0r/8CzOTHlDehmQx+Wy5k2adk=;
  b=d/j+cUpNNbDWW2n+YEycOumO/610G4vBuurRD1Jtk7uW8lBl7hrhaW08
   YrC/17PZZcsTIADWN7ELpCuueZ9SGKyLi18EHHWRk2z3ibt0bvxLyKWfY
   6pZ+mPrFoc0VG79HO3jr7kNqApFZ0CD1uG6q/IJhrt/ktkknuMwWSJTI8
   k1ZLWtRcT1n00PH6GQS+QAir9DNj0hFT58w+BwfgxgyZ9fTogf0gQZeBZ
   ZFudX+rQWenH6SAvx8E7NlEq9qjxUnvzBWEYzlJhIh6+0oPJRtm8iFwQQ
   IW+YY+X72iApCF6dWoqRNaGwBPv5TRlGC4fMWps8XLWmKvW8gTl5wzm5w
   Q==;
X-CSE-ConnectionGUID: HWA1Hb+3RRaLACcgbJJQpQ==
X-CSE-MsgGUID: 8hm1eL1GSAetNtGHYy8uhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="67940719"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="67940719"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 19:37:34 -0700
X-CSE-ConnectionGUID: Vcjcku0qTUSLGHhk/S85Vg==
X-CSE-MsgGUID: WM907wGEQduktWHlwfomeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165276664"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 19:37:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujqVX-0002IY-06;
	Thu, 07 Aug 2025 02:37:31 +0000
Date: Thu, 7 Aug 2025 10:37:22 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 15/17] kernel/sched/psi.c:1372:46: error:
 'const struct psi_trigger_params' has no member named 'bpf_psi'
Message-ID: <202508071047.Wfu4lGE2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   56067bc9ae98ae8d75fbb2506874ef96ee0396e5
commit: 23cb752a881939dc52d857168e7a156606fbadb2 [15/17] sched: psi: implement psi trigger handling using bpf
config: arc-randconfig-001-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071047.Wfu4lGE2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071047.Wfu4lGE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071047.Wfu4lGE2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:95:
   kernel/sched/psi.c: In function 'psi_trigger_create':
>> kernel/sched/psi.c:1372:46: error: 'const struct psi_trigger_params' has no member named 'bpf_psi'
    1372 |                 bpf_psi_add_trigger(t, params->bpf_psi);
         |                                              ^~


vim +1372 kernel/sched/psi.c

  1331	
  1332		if (state >= PSI_NONIDLE)
  1333			return ERR_PTR(-EINVAL);
  1334	
  1335		if (params->window_us == 0 || params->window_us > WINDOW_MAX_US)
  1336			return ERR_PTR(-EINVAL);
  1337	
  1338		/*
  1339		 * Unprivileged users can only use 2s windows so that averages aggregation
  1340		 * work is used, and no RT threads need to be spawned.
  1341		 */
  1342		if (!params->privileged && params->window_us % 2000000)
  1343			return ERR_PTR(-EINVAL);
  1344	
  1345		/* Check threshold */
  1346		if (params->threshold_us == 0 || params->threshold_us > params->window_us)
  1347			return ERR_PTR(-EINVAL);
  1348	
  1349		t = kmalloc(sizeof(*t), GFP_KERNEL);
  1350		if (!t)
  1351			return ERR_PTR(-ENOMEM);
  1352	
  1353		t->type = params->type;
  1354		t->group = group;
  1355		t->state = state;
  1356		t->threshold = params->threshold_us * NSEC_PER_USEC;
  1357		t->win.size = params->window_us * NSEC_PER_USEC;
  1358		window_reset(&t->win, sched_clock(),
  1359				group->total[PSI_POLL][t->state], 0);
  1360	
  1361		t->event = 0;
  1362		t->last_event_time = 0;
  1363	
  1364		switch (params->type) {
  1365		case PSI_SYSTEM:
  1366			init_waitqueue_head(&t->event_wait);
  1367			break;
  1368		case PSI_CGROUP:
  1369			t->of = params->of;
  1370			break;
  1371		case PSI_BPF:
> 1372			bpf_psi_add_trigger(t, params->bpf_psi);
  1373			break;
  1374		}
  1375	
  1376		t->pending_event = false;
  1377		t->aggregator = params->privileged ? PSI_POLL : PSI_AVGS;
  1378	
  1379		if (params->privileged) {
  1380			mutex_lock(&group->rtpoll_trigger_lock);
  1381	
  1382			if (!rcu_access_pointer(group->rtpoll_task)) {
  1383				struct task_struct *task;
  1384	
  1385				task = kthread_create(psi_rtpoll_worker, group, "psimon");
  1386				if (IS_ERR(task)) {
  1387					mutex_unlock(&group->rtpoll_trigger_lock);
  1388					if (t->type == PSI_BPF)
  1389						bpf_psi_remove_trigger(t);
  1390					kfree(t);
  1391					return ERR_CAST(task);
  1392				}
  1393				atomic_set(&group->rtpoll_wakeup, 0);
  1394				wake_up_process(task);
  1395				rcu_assign_pointer(group->rtpoll_task, task);
  1396			}
  1397	
  1398			list_add(&t->node, &group->rtpoll_triggers);
  1399			group->rtpoll_min_period = min(group->rtpoll_min_period,
  1400				div_u64(t->win.size, UPDATES_PER_WINDOW));
  1401			group->rtpoll_nr_triggers[t->state]++;
  1402			group->rtpoll_states |= (1 << t->state);
  1403	
  1404			mutex_unlock(&group->rtpoll_trigger_lock);
  1405		} else {
  1406			mutex_lock(&group->avgs_lock);
  1407	
  1408			list_add(&t->node, &group->avg_triggers);
  1409			group->avg_nr_triggers[t->state]++;
  1410	
  1411			mutex_unlock(&group->avgs_lock);
  1412		}
  1413		return t;
  1414	}
  1415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
