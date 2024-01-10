Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE8E3D60
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jan 2024 15:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/+1q4h0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704901870; x=1736437870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vodH0CGAPrFjEV7X4fri+DZaZejqoO8INGxDuHelKyM=;
  b=k/+1q4h05u+hox8TSJBES5KBKDeI/gwtx651zdcYCnMQkAUQQ9XzevzK
   Fy6vOmIsbPbA9De01oblXVJxYdUUwOiSdDcjuJfZOONhhYQbxVNq4Ylr5
   Yyu+BgItVCAB74SUL/qoDMUpu+e5x/VzlxJcaneBug4rezq6vI+JyIX+W
   E7LGIV2mjy+QBgm3EZ5GdcXoEvGWzobnmkBWGXEy2/9+dmgwkDp4Rfq9h
   soCLTTZW1hozU52LaE+CkRlBs6PzCIxyfZLT7n22aCI5KyT0zE4LYoQMa
   RSkkWgt7EkoDbnxMif1nZyC3P024G4QvknweJ8gBTSh8V1NosvF+5W6rZ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="5928685"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5928685"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 07:51:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10948"; a="731889642"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="731889642"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 07:51:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNarB-0007D4-05;
	Wed, 10 Jan 2024 15:51:05 +0000
Date: Wed, 10 Jan 2024 23:50:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1844/2334] mm/oom_kill.c:316: warning: Function
 parameter or member 'task' not described in 'oom_next_task'
Message-ID: <202401102337.KTGM5fx0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c780cd23389087490b4199975c7e16cb696da852
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [1844/2334] memcg: support priority for oom
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240110/202401102337.KTGM5fx0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240110/202401102337.KTGM5fx0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401102337.KTGM5fx0-lkp@intel.com/

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
