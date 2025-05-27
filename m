Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C027E1C6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 16:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748362237; cv=none; b=UI2tGrL+7Wob5cec87toAHBH4ODDdMgQ6GNt4Qne4v64SPjs8SwpSskn852B15yioMC+DCim4kPZwevoALFM7nlSonn/nxN6TtLuXgIKAFB8BC5xf5BW8lOlmF+hRi3hTqipx5GGUM1Cf+fCzn7S87wbhS7mICYI1NnIZNhAoFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748362237; c=relaxed/simple;
	bh=JFFzXyyJ0EB1uOtTc8pGbCd5i49u32xH8h+qHucCLSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NfVHkvXqbqHhrSFu8IXd1l229eeZo8JQIwpKHm97QxG9BCiA7+YtT0G/sOZMXbiYeH7ewB61iF+f/fgfQZA7mA1qNwtZB4bd/yIedNsd9esVJlPIX/z0nWLfmuMDTp5O+/s4q0D527ytMhs4DoFeRaJiNZJIbkj5g4kUPiIsRnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxVTIZQ1; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxVTIZQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748362235; x=1779898235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFFzXyyJ0EB1uOtTc8pGbCd5i49u32xH8h+qHucCLSM=;
  b=jxVTIZQ1klZWD9kefDQ+nyXtwjX5PkUiZHu/2xQGfDdnByJuPVQJO4QR
   /SIc52P9e57xOVOAOMJ50RLCH1COm3UP1lSwvKb8c+HjHAX3ke6ZXzXYn
   sCiHvvQH+R0u9ELYiCpAz7r9a8dF77se4S4f+phEGrY2RGk1kPFt685i0
   fab7mwsZAA50hp/pvtqxsrHex5g/vDK6BEHRCni23FX0hkeE8GDRPaKNl
   Pyaa6hbOlYZo6nG3Qt0MQWMmBJQDKRUI2yLdRLx71DOC71TaoBcS8Znp+
   yujjVTeU7dYj/xALajD724OVKy2eUbcs3M4eAh7qFKfUEGbo56DHVL3qy
   g==;
X-CSE-ConnectionGUID: PVP+THPIS2irmC+DhK/IQg==
X-CSE-MsgGUID: q4B8+vADSQuTCxXiiAM9RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="52982596"
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="52982596"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 09:10:34 -0700
X-CSE-ConnectionGUID: xeVKYibsT7iT2sMTlsaQ8w==
X-CSE-MsgGUID: gU506OylQVCojoA2uACKFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,318,1739865600"; 
   d="scan'208";a="146748963"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 May 2025 09:10:33 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJwsp-000TKY-09;
	Tue, 27 May 2025 16:10:31 +0000
Date: Wed, 28 May 2025 00:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2304/2304] mm/oom_kill.c:316: warning: Function
 parameter or member 'task' not described in 'oom_next_task'
Message-ID: <202505280056.91YNE6dg-lkp@intel.com>
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
head:   35c5792a71f249ce79eba3cbb546d1ece7c4f3ee
commit: be8d95530886b0aaa5a59b5c43a285667c9eebc6 [2304/2304] memcg: support priority for oom
config: x86_64-buildonly-randconfig-005-20250527 (https://download.01.org/0day-ci/archive/20250528/202505280056.91YNE6dg-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280056.91YNE6dg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505280056.91YNE6dg-lkp@intel.com/

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
