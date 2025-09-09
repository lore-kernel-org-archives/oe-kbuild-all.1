Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FF82D3EC5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Sep 2025 09:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757411627; cv=none; b=WAsnFL51SEVOWfEETSRTgYqg9ScizQe2nVFBFxpbLPz7/kpYpCkuHdW3erlQBJjC2vLOQ3BvOenGzwznVtQD+TkdkvWqE4ffTmQ++Dz2YkHui1PGk51RINCbwb1j0vAKvY03gnrWStVD0Tp1zdHk7cIwKmM6UBADgu6ubpLyW4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757411627; c=relaxed/simple;
	bh=s3ZC2ytSm+9IkEdDRYm9FPjKg88hm5gNuT0vsWnqIek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L0NH8ZdhcQLgFnyeJTfpSOVOrmF+t5xvLEqMWbis+uhbUYhiPvVLSlOwKc/8mpKLC9oo8v+JaJEJ0h7vPMmET99oqKa/2FSB9fJxSpkRroMULaCWAlVCYqFBJVY7dUMHnWZuWRs90oEpb+6g7fAJntXrnzbucHl5B+3sXKt8U8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OJZvW9RE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OJZvW9RE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757411625; x=1788947625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s3ZC2ytSm+9IkEdDRYm9FPjKg88hm5gNuT0vsWnqIek=;
  b=OJZvW9REow6deFdHXciDCnVCACFFpCm3awG8MhEU9FIkNk/1Cc2ac9MQ
   EqTkz5rOqe31QPDqQ7m3BQEKPUOQPdmOsE3omiw2apCECrPktAL2FkXJv
   OcymlapdelhWGiBoe59C/YFAkip2rvY5TnZKMfctvIj1C16wH028eRCuQ
   MH6qZYjB5WHGyKlc3eYYgBqbNyysjMC9Zpc0DBFKg0Ho2XwTuBmxZfsaJ
   WbpzqkNIvsOVKxxAgYUxuDHL97VCbi4N/D0JClHiAXMTtgVVX5gdUUoJD
   bpo+6wMHHxBO4rtN576ZroJueSBiOc4qkjPczC05SkeqUlzEVxkzH56P4
   A==;
X-CSE-ConnectionGUID: IXOWrl9ETDyOCZETeJGsdA==
X-CSE-MsgGUID: xxAT9lQgSWCetww4X2NTig==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59625793"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; 
   d="scan'208";a="59625793"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2025 02:53:43 -0700
X-CSE-ConnectionGUID: 6fODuzMRR2mqL2iTg4RkJQ==
X-CSE-MsgGUID: FDgq+DAVQP+RlD+9+YtcXw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Sep 2025 02:53:42 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvv2i-0004j5-0s;
	Tue, 09 Sep 2025 09:53:40 +0000
Date: Tue, 9 Sep 2025 17:52:43 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2870/2870] mm/oom_kill.c:316: warning: Function
 parameter or member 'task' not described in 'oom_next_task'
Message-ID: <202509091707.YxEsJCE3-lkp@intel.com>
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
head:   56b56ac9eef7eb836517da7cac03b570a664b49b
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [2870/2870] memcg: support priority for oom
config: x86_64-buildonly-randconfig-001-20250909 (https://download.01.org/0day-ci/archive/20250909/202509091707.YxEsJCE3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509091707.YxEsJCE3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509091707.YxEsJCE3-lkp@intel.com/

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
