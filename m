Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDC31D63D1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Dec 2025 02:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766457854; cv=none; b=sUccga5Rf8KTH1WG/SYgIG+MWWwpfm9PkUNTeXb1ffzonlwrh7x24V9poxApe+vsWRlIMSsGd3K6gXB3A/JbNomqyW9MyRIwEuxmQbhsgQ/8LD2imDpjsyLso9RHUGfs0hqHmXL/WsyI5O1VnnlvpnzsTS1stUJ3kfAy4X0uZ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766457854; c=relaxed/simple;
	bh=gm0aWuFTyTdJa07IqleicnMMK9ezKKlof3qDoQ3xxcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q/KCsd7AyYkzAg+jZgU5G+rXPbb2/svvZSiVwyGDGxMI077x4zsnliQ2QoeDXfXSaFZVsnUgb3Xx+XEqrcC2RXWNURPXlJByJCAXfmmG2RDDBicv9592GkfjMPuz9DHIN69eVun0NkivZksuLMILaV1AuCO/Px0pmetKE+kCwYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxiOYY7J; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxiOYY7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766457853; x=1797993853;
  h=date:from:to:cc:subject:message-id;
  bh=gm0aWuFTyTdJa07IqleicnMMK9ezKKlof3qDoQ3xxcU=;
  b=NxiOYY7Jz4cL+kJWjDUwbj1pe4Axt0hB8BKg++JLo1ewH/0zH9+SgxfM
   A/xvvTzbokJYmApnkAMJs6DoWRFgHMFXCV3uAY3HeCFihEuzUrugH1oAf
   bSht3Xj0d5tJsBb3d6BqFM1BU83nHM+4+uVuqwki8BNYZ2o64QCoC0UGF
   BJHBTh0OBQIELJWdh9i3RuYJF2Re64doXBFXL3ddRjYOgc4RylNHIXUY+
   wTYizwFJ3zJXKblRKPXe7WVu827HjcPRJUTKTx3cliOpNe1EJeO6L+YOj
   PG3yV9hRizWdh0g7noHSY5ohrHqGBw+FTodBavrd8GCR1qJL5iTfIeal/
   g==;
X-CSE-ConnectionGUID: +4U9yUdwQy6hPXAfUSbNtg==
X-CSE-MsgGUID: Po2KHYVJRI29X76lgLdZmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79030398"
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="79030398"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 18:44:10 -0800
X-CSE-ConnectionGUID: 14lFiSMJSmG4CBVF5ATWmA==
X-CSE-MsgGUID: b6Qyt8wLQymGV5dYEkO9TQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,169,1763452800"; 
   d="scan'208";a="230332490"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2025 18:44:08 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXsNa-000000001Mv-0m3m;
	Tue, 23 Dec 2025 02:44:06 +0000
Date: Tue, 23 Dec 2025 10:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2/2] mm/oom_kill.c:316: warning: Function
 parameter or member 'task' not described in 'oom_next_task'
Message-ID: <202512231015.AeGVhu0Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jing,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c098fa18c07cc52100a52db8fd0c2900461888c9
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [2/2] memcg: support priority for oom
config: arm64-randconfig-004-20251223 (https://download.01.org/0day-ci/archive/20251223/202512231015.AeGVhu0Q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512231015.AeGVhu0Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512231015.AeGVhu0Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/oom_kill.c:316: warning: Function parameter or member 'task' not described in 'oom_next_task'
>> mm/oom_kill.c:316: warning: Function parameter or member 'oc' not described in 'oom_next_task'
>> mm/oom_kill.c:316: warning: Function parameter or member 'points' not described in 'oom_next_task'
>> mm/oom_kill.c:316: warning: expecting prototype for We choose the task in low(). Prototype was for oom_next_task() instead


vim +316 mm/oom_kill.c

   308	
   309	#ifdef CONFIG_MEMCG_OOM_PRIORITY
   310	/**
   311	 * We choose the task in low-priority memcg firstly. For the same state, we
   312	 * choose the task with the highest number of 'points'.
   313	 */
   314	static bool oom_next_task(struct task_struct *task, struct oom_control *oc,
   315				long points)
 > 316	{
   317		struct mem_cgroup *cur_memcg;
   318		struct mem_cgroup *oc_memcg;
   319		int cur_memcg_prio, oc_memcg_prio;
   320	
   321		if (points == LONG_MIN)
   322			return true;
   323	
   324		if (!oc->chosen)
   325			return false;
   326	
   327		rcu_read_lock();
   328		oc_memcg = mem_cgroup_from_task(oc->chosen);
   329		cur_memcg = mem_cgroup_from_task(task);
   330		oc_memcg_prio = READ_ONCE(oc_memcg->oom_prio);
   331		cur_memcg_prio = READ_ONCE(cur_memcg->oom_prio);
   332		rcu_read_unlock();
   333	
   334		if (cur_memcg_prio == oc_memcg_prio)
   335			return points < oc->chosen_points;
   336	
   337		/* if oc is low-priority, so skip the task */
   338		if (oc_memcg_prio == MEMCG_LOW_OOM_PRIORITY)
   339			return true;
   340	
   341		return false;
   342	}
   343	#else
   344	static inline bool oom_next_task(struct task_struct *task,
   345					struct oom_control *oc, long points)
   346	{
   347		return points == LONG_MIN || points < oc->chosen_points;
   348	}
   349	#endif
   350	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
