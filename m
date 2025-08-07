Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C25233727
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 23:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754608717; cv=none; b=QV6B+8Fs01dCV7puLdbzACjl7QVqofcoIfcYXU1icvCLzaY5v1qvpHNhxhvMGFGDsH+7qs8hMk/fpjTTYZXqxER0pvpbDI+4nFMQWE5hmJ4CXM8sd1zHeHEWbZAmE+BktR9s/v5NOYIdZSkrlJHtL/h3jDsHio7g0ElFlw68Cp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754608717; c=relaxed/simple;
	bh=n0EqmKuFrxNBDzBaJCXalWCmszYqu1Z+fqPj4YwU+tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fN8v4RM6CQstj7oRwfeQYUZ8T1cqrnDqosA2X6jI48p2CdZezX4Sl+DRC8bZwP8EvCVwBdx8dLtGsORcL2WXlaCKpR9lG/eRSyR06b4TxwhSHfSKDkcR5UYL2TPApYQCV/aZS5Bvf+RAbZsF/+bYktQ5kydkKbTmvo8qpRJtHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBRBEZ2W; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBRBEZ2W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754608715; x=1786144715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n0EqmKuFrxNBDzBaJCXalWCmszYqu1Z+fqPj4YwU+tw=;
  b=fBRBEZ2WY3ryx8Ah09jjQx4ESUZq+8ts58PldiaALenHSuZk6ltSpdl9
   BwgWPIauuh71rvIHCsX0meR7Fq6EPFbnNnSaLEXHkodqboV/ViCaKw0Ba
   QFWGpdQ6PWNxr/OQmHZG2sP/eJvoxesvewTP30FC2h+gLUtmYFb8ou/0m
   4vVbtSIzix431TaslToW9oqMHEmUJ861w8TLc6qm1OiWK/tWjJTQel6zG
   Ou6lAhjMIzYVEuw0VAWdpdGTQsKryGO8R/XxxKd7K8Ak78BwlGz6kXVDS
   8LYdtyd8OHqJkeg0L6MZGyb2vzMrHqON7ABj7w1xOd9XTUSndYVmz6sT8
   g==;
X-CSE-ConnectionGUID: W1uHNGYvSMC2fNKfQowHJw==
X-CSE-MsgGUID: NUN4piesS6aBj58dTMnFWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="56858386"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="56858386"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 16:18:35 -0700
X-CSE-ConnectionGUID: 4Jc/ymZtQWC9SLWc9aK5wQ==
X-CSE-MsgGUID: FfrERaaPRvC3xbEkLMcyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165980767"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2025 16:18:33 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk9sV-0003Lb-2c;
	Thu, 07 Aug 2025 23:18:31 +0000
Date: Fri, 8 Aug 2025 07:18:08 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 15/17] kernel/sched/psi.c:1372:40: error:
 passing argument 2 of 'bpf_psi_add_trigger' from incompatible pointer type
Message-ID: <202508080741.gePnM5PV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   5da37b0fa382bf6c978606c1f682424f3e49d27e
commit: 6de83397e2150cad0ca5ee7ce49a1fd8cf05f4f1 [15/17] sched: psi: implement psi trigger handling using bpf
config: csky-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080741.gePnM5PV-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080741.gePnM5PV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080741.gePnM5PV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:95:
   kernel/sched/psi.c: In function 'psi_trigger_create':
>> kernel/sched/psi.c:1372:40: error: passing argument 2 of 'bpf_psi_add_trigger' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1372 |                 bpf_psi_add_trigger(t, params);
         |                                        ^~~~~~
         |                                        |
         |                                        const struct psi_trigger_params *
   In file included from kernel/sched/build_utility.c:22:
   include/linux/bpf_psi.h:43:56: note: expected 'struct bpf_psi *' but argument is of type 'const struct psi_trigger_params *'
      43 |                                        struct bpf_psi *bpf_psi) {}
         |                                        ~~~~~~~~~~~~~~~~^~~~~~~
   cc1: some warnings being treated as errors


vim +/bpf_psi_add_trigger +1372 kernel/sched/psi.c

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
> 1372			bpf_psi_add_trigger(t, params);
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
