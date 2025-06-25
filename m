Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CBB2627F5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 13:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750857480; cv=none; b=hmyZVKS3dyp5ry62V29ID5hcEZODoT6HY97QUpevX1dCAkAm3YS5MI6KDRmAi7pKj6lk0v5tUxQ+Iumv9bNDubH14heFq/GVDtxExo7Llo7eGjqnzccwe5gEVAGA6WggtOW+PdLTk8NabD5ErNGWfGfKZ4fo08cMbaGAcPGuSeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750857480; c=relaxed/simple;
	bh=1/obNBmfgbEUlkhPNI09hyxW62s1WVVa2qziRLM8ueA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WX8E94Kqfi0ioEPvfiu5vMStTaD1m1g2vSZD1ZTm7rmvZm9OuxhfBnSw8McIazwxb6ReoWGUCYqTbYP6YT2pESANqZd6tUxgzzBjnCKTVd7yPoxF8sxjbn+4jI/WWI0H4zDcOidRzjLJz8y0bmBotf7GpglfVhp81hpfJCRGf90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Du5cUdds; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Du5cUdds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750857478; x=1782393478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/obNBmfgbEUlkhPNI09hyxW62s1WVVa2qziRLM8ueA=;
  b=Du5cUddsMkMypkKlf3E9ZnzSntBDgKejnenmOw8TXpjM5OffhXWSELH2
   5JSPfquBMiumksRq8Ob68Ug3XmR6W+GGhI0QFnfQ596LuEwJABTupit4Y
   g02YUt/uIOx8bUL2MV/18jXDNHRw7ZECEeoo1tqBm2gXL5fnbL4fw0srz
   6XBEgXsds/lRn68w8ZiW4M7Nrq+yY/z1s4t6GT94hG4DPzEtSxR7MGvTt
   B/Bord3QP5VJF0+rOxTdNxk39cLDi2ly2Pkavsni5swpQck8BubXC6CVQ
   UvqTfASP7dFh/bjwN3Lc0wlUzBhP157TOLhgSNGjoPs+s7Xq++W3YZU75
   w==;
X-CSE-ConnectionGUID: K3lmTp1wQvCDPQ3iAKCiHg==
X-CSE-MsgGUID: tjhzg+2oRJSKdWd6AtB7KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="40746627"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="40746627"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 06:17:57 -0700
X-CSE-ConnectionGUID: JLraKz6cSvqtXe6igzQysQ==
X-CSE-MsgGUID: z1xITdyTRbSRlD/yH3obXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; 
   d="scan'208";a="156787944"
Received: from igk-lkp-server01.igk.intel.com (HELO c09d3523614d) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 25 Jun 2025 06:17:56 -0700
Received: from kbuild by c09d3523614d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUQ0f-00003z-1J;
	Wed, 25 Jun 2025 13:17:53 +0000
Date: Wed, 25 Jun 2025 21:17:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195] mm/oom_kill.c:316: warning: expecting
 prototype for We choose the task in low(). Prototype was for oom_next_task()
 instead
Message-ID: <202506252122.xPcMNYLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   3160da23afe10e66040ac00ed17174cb467c79b3
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [2195/2195] memcg: support priority for oom
config: x86_64-randconfig-2002-20250501 (https://download.01.org/0day-ci/archive/20250625/202506252122.xPcMNYLC-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506252122.xPcMNYLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506252122.xPcMNYLC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/oom_kill.c:316: warning: Function parameter or member 'task' not described in 'oom_next_task'
   mm/oom_kill.c:316: warning: Function parameter or member 'oc' not described in 'oom_next_task'
   mm/oom_kill.c:316: warning: Function parameter or member 'points' not described in 'oom_next_task'
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
