Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C792472A8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765398274; cv=none; b=moSThQsJp+5kXuxscTuvX3GxpmXt2cvp9bQKV+qfQSoKSKFuwcwUSwpQUsdjT+HbJt6xeN7FJEu2C2cuZDZxo37ZRcegEGI3Q5gNeDx4o1XCPt3c2stub1OojRmGlttWcRvzsSLDvVmNrdHYhutePDJY0z9pBUxN7BsLhcklkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765398274; c=relaxed/simple;
	bh=SsZt3A1+coAT3A8QRfxgK5Rj8klXPkQOnqSOeMJ+uqU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHeaKGTg/Hsd93mxsya7i0ZKypZMj8dgYdMvu4cKLiYK/bxJyG9E3LlzA/P1BFeEspw2CInEkCt1y879+aJkQSgNW7Tps2EezDpZLMucLWLSQb58yvNJydqCcJ5GUTpOnqMIgJe22/hhq8iXV9t77whu6OqpQXR/WKx30jk3JXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E+FHi5LR; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E+FHi5LR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765398273; x=1796934273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsZt3A1+coAT3A8QRfxgK5Rj8klXPkQOnqSOeMJ+uqU=;
  b=E+FHi5LRmq9EygU4UMk+oODwK6zW8Alle2MoB58EPRSjUc5OeE5wPYYu
   EbWNhCockCEYYUCUfHovvu80n2QqpfAGZ0xA3Ncakx5RjWYxbFC8XTDvf
   /X3v6D3ggpUfW8MzFT4HKCwMBe5UTHl2DYIQeHO5urKQLZRMy35oN/Rhh
   ZAwVQvtshbY/PNFbmqP3l4MuRJK4dYvvjVlE6MyNiWkvkAhUw0Qu6Px/e
   bDS3pQkd4dz+XMAHPHX6MTIihAt2pdeH6WSTuRpMRGXEb9fHgcI1nkyho
   22MF+bvZitua5HSV23v/UxiUqY/Zvs1qS/IFZrMffYUEUx8XYDDlSeCbs
   Q==;
X-CSE-ConnectionGUID: 0kl5E7trQ+avuOm8kRmrOA==
X-CSE-MsgGUID: 9UtT5es8Qj+jsmdkopgs2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67313310"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67313310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 12:24:32 -0800
X-CSE-ConnectionGUID: Xi87U31eSFGyoUMP1eCtHA==
X-CSE-MsgGUID: DJhm3BU7SMixbW9IGNGpGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="197097128"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 10 Dec 2025 12:24:30 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTQjc-000000000lk-3elM;
	Wed, 10 Dec 2025 20:24:28 +0000
Date: Wed, 10 Dec 2025 21:24:02 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3508/3508] mm/oom_kill.c:316: warning: expecting
 prototype for We choose the task in low(). Prototype was for oom_next_task()
 instead
Message-ID: <202512102145.t68IBy9Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jing,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d281438782e3c28a3df71a64513a3312d43dcf01
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [3508/3508] memcg: support priority for oom
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251210/202512102145.t68IBy9Y-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512102145.t68IBy9Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512102145.t68IBy9Y-lkp@intel.com/

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
