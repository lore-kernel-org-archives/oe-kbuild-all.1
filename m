Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DFD1E480
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 12:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739537235; cv=none; b=AnV7E+m8a+IZzA7G6jDva40izwnBVwMU5VaZFoOts4pcL5cGg2XPb2chIxRDtunqYXbLvSoY9ypZCmdbFmTZX/1lce9wjMWZviinYOz9zixnGBzo+eoPwGOQO+t7Nv5sn0YYwpQ6Zv1m69jUqyrclsxzZBPaBq1Asmie2fHD6ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739537235; c=relaxed/simple;
	bh=DMmvi5eX71QwyZ90LbB3/steIBtX5jhd2Mj8/oQ/L28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i48vpPUKW9YIsgg8d1PvTqVIQva26yAkBxly7tr3xWDYSa26gwSUMEml7Q/s1W3qSFKIKqiijbmQD5ggxaXUh2A1V6nauG5e0RdEucy57qmvmp9lnAkD7hzsU3r9T7u8GMeNVxBajT4nVaN/DsFI4QE0fedbtRYstoc46GkWTI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVp9JUX3; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVp9JUX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739537233; x=1771073233;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DMmvi5eX71QwyZ90LbB3/steIBtX5jhd2Mj8/oQ/L28=;
  b=GVp9JUX3f5PdKWRrqaZhDsW2tOg7YMmPyrwPFPuo+P8yINQOuHOMqt9v
   E4EspRQbBQZvVJHIkivZftIIf6P05pbWDpMEhl5pz+m0qbeANQ3l5KTYF
   oSr1/WzLMb+2YJVvvvJobKrpFngeEvLo3MUBL/+3fom/B/HjtICMIb2u4
   5YfjObpp/1XT3qPASWzLqHkw0IQyYDwZPVd919atbce/xDQ0rwUmBytF8
   Z4/KdH4RPdKP2RqfJaKwqz9zgm35jnGMqak9KQTMfYnAhpphhIX4lAEyH
   +4u2IwLRuNUhsGSw8UHMqqwszLEfOCZmyJ9BDwCy/Xb0q9OjnTVI0QpFj
   Q==;
X-CSE-ConnectionGUID: IuRL402tQKqORFYnHCJB6A==
X-CSE-MsgGUID: BsE3XR+iRXWcdWjbVQgelQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39468292"
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="39468292"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 04:47:12 -0800
X-CSE-ConnectionGUID: oJPSo2GYR8OQYeJ2tUechQ==
X-CSE-MsgGUID: hEN7uSOPSwu1qTPH/zLneQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,285,1732608000"; 
   d="scan'208";a="113637728"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Feb 2025 04:47:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiv65-0019YJ-2o;
	Fri, 14 Feb 2025 12:47:09 +0000
Date: Fri, 14 Feb 2025 20:46:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1924/1924] mm/oom_kill.c:316: warning: Function
 parameter or member 'task' not described in 'oom_next_task'
Message-ID: <202502142019.HSCMUy5Y-lkp@intel.com>
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
head:   254b433462607f511039b75693d9314822538f20
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [1924/1924] memcg: support priority for oom
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250214/202502142019.HSCMUy5Y-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250214/202502142019.HSCMUy5Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502142019.HSCMUy5Y-lkp@intel.com/

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
