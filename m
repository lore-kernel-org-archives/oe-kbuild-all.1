Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1F422422A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 15:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755529528; cv=none; b=cnZn2B+uHV0aEcIS4GGGQKTjbo3n7vYAsToklN5y8Vx5BNrbPwk+BRWmgz9T9oerorUj5Gx/WsdYzRYiy6XBZ/8JnopvZ/oOM9nMLCXmevwrK2Dc1OPfQ825+3uLwBx8ae4L4Ko0hMF8G+o2iMPFSIhmFUR1dm601HDSf0qINeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755529528; c=relaxed/simple;
	bh=A2J8iQOvQwKs3ifqUZ4LMqaCXu/STsQj+KUr35ybcjw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Th7vHMO2cq4rQHIKIgiuRAW3p2ougNDDcBnPuzhRlrtAKlVO7t7u5mBi30uiBVAuvHTXfVGM2FXxH7yBsDOQabiVF3msroAhmXW9NnDy0uEjdSJf9heRuhaQjcjKJuUWuhAbjCYsNkmktDI+HkspwaIUYI2yGBFpefneRBjGte8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fftBBIA2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fftBBIA2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755529526; x=1787065526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A2J8iQOvQwKs3ifqUZ4LMqaCXu/STsQj+KUr35ybcjw=;
  b=fftBBIA2TPFFGukEBoNo8ebU64jeGGG8OH0976a1ai+sXaSpCmOrZNsv
   37IYJZrL/nklYp5fhOzIOjBzluG0MzjJ1wwS9nYgUohcPTNWb9NzOiP/p
   FjqXOzjox8xT/owKyPhYJgCByPQMUk8d7/zfW+V1+hTQMALwZW7EhpO29
   sMyuWeolyM88rKVWQ9Ekt33YI32b7ksSAQR5DHEQpY4NDg0rzxhaUInbe
   iqfMAlASXEQQy4f1kEtL6XcGf7fikZggT501YLoWedGldXMMRm+I9S/Cw
   ad6eW9JR8VwCvPr6zAOBe5IfV7PcYH9fhpV6H/TLxahuKwuqNm75TpJxH
   Q==;
X-CSE-ConnectionGUID: iqQUIPivRmOai/Jomt/USQ==
X-CSE-MsgGUID: 2Zs4Fu4JTDak+hrlT0YwrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61381510"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="61381510"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 08:05:25 -0700
X-CSE-ConnectionGUID: BQrWj756SHWm6OTGwYUKAg==
X-CSE-MsgGUID: r4y5ZVLZSLGqrkWYQWsYpg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 18 Aug 2025 08:05:24 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uo1QI-00016J-01;
	Mon, 18 Aug 2025 15:05:22 +0000
Date: Mon, 18 Aug 2025 17:04:29 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] mm/oom_kill.c:316: warning: expecting
 prototype for We choose the task in low(). Prototype was for oom_next_task()
 instead
Message-ID: <202508181712.NHUv50Nj-lkp@intel.com>
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
head:   dc90c923fed4944f134644261022885c12631518
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [2687/2687] memcg: support priority for oom
config: x86_64-buildonly-randconfig-2001-20250818 (https://download.01.org/0day-ci/archive/20250818/202508181712.NHUv50Nj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508181712.NHUv50Nj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508181712.NHUv50Nj-lkp@intel.com/

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
