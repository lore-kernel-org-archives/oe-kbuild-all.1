Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A14519AF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 07:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789458904; cv=none; b=ISls/Yb4qXxcdm0CGPjiuFDz/hFdCS+z1wK4/9Ibl8RlyK+yBbYVlV+KdeGk0cBipfRy/CTd1vinTXRtdpqpEO5PNVvVl7XxiAOWFP8WxyhWSvb9nXaz+sWCtZcWsoKFmE12AYLFY+Kzs7yxGveFkoMzBBTR3Wx+zVlHkgFLxIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789458904; c=relaxed/simple;
	bh=VfGbXURTWEJDEpAlE1PtCOQRVGZoorfKLuTzFOJHQ5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YosSO7PwK/prfxhvkLe/yH8mUHNQ8sX7qtZsgE/3oYkdzt18SoRFNJgjXwzfh+l1j6Zvth4DVJHHzSkMKVKgPCGAHYEb+NiE6oljLT+/iLuuPG30lfKEs895x+KXXeyHPUzoadnnOYHMbPDVgYeXKMfNgL3lDOig9oZOyAwjPko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NjLRmz/A; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NjLRmz/A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789458902; x=1820994902;
  h=date:from:to:cc:subject:message-id;
  bh=VfGbXURTWEJDEpAlE1PtCOQRVGZoorfKLuTzFOJHQ5s=;
  b=NjLRmz/AnNhxF7VH8N/emwSiB2W0wVPwEiEw1rHEbBn9ng06bUeE+aEO
   5/FIuqdgs5iAZH/CxV7MOkyvM4RID2AB6zs/NV8tHmknQJyHcOdrqf54e
   erEykCxuices2kck/QjSCpSVdXNlHGPLVHWrj0oCAoY+LfM5E7f0EjLbk
   W5lICtdD1ukUgeFTImUmn+1icP5Z3Dxb0VZIEhLglHaGMSsF5tGp7wKUk
   78iBOB70NYr8HoSR+/g31LmeSqkQRHTlut5LJyh8N6v1RMilICEka3Mry
   VZwNJjQ0MEOwfElq0ga8rgj24PabN8y4DAHSL/MkT6Z5c06txENEzZUCO
   A==;
X-CSE-ConnectionGUID: Tm+lunmuQVmEwOoGGDgXcw==
X-CSE-MsgGUID: hoANY2NMTNquC7gvbOP5uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="112582049"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="112582049"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 00:54:51 -0700
X-CSE-ConnectionGUID: 1ZBxu/IXRMapXZj/VQ0YXA==
X-CSE-MsgGUID: 6DAvFib5Ru6Sp43cvagpoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="270256141"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 Sep 2026 00:54:50 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6O08-000000000XV-0hnK;
	Tue, 15 Sep 2026 07:54:48 +0000
Date: Tue, 15 Sep 2026 09:54:34 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 118/118] kernel/sched/alt_core.c:5356:6:
 warning: no previous prototype for 'rt_mutex_futex_pre_schedule'
Message-ID: <202609150948.xf4VLXJU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   ecdb5900a34a8291a8457c0e29cca911c55dbf67
commit: ecdb5900a34a8291a8457c0e29cca911c55dbf67 [118/118] sched/alt: [Sync] b715872ef0cc futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260915/202609150948.xf4VLXJU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260915/202609150948.xf4VLXJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609150948.xf4VLXJU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/alt_core.c:5356:6: warning: no previous prototype for 'rt_mutex_futex_pre_schedule' [-Wmissing-prototypes]
    5356 | void rt_mutex_futex_pre_schedule(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/alt_core.c:5375:6: warning: no previous prototype for 'rt_mutex_futex_post_schedule' [-Wmissing-prototypes]
    5375 | void rt_mutex_futex_post_schedule(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rt_mutex_futex_pre_schedule +5356 kernel/sched/alt_core.c

  5351	
  5352	/*
  5353	 * Used within the futex syscall context, skips sched_submit_work() because none
  5354	 * its work will be done. Asserts ensure that it is indeed the case.
  5355	 */
> 5356	void rt_mutex_futex_pre_schedule(void)
  5357	{
  5358		lockdep_assert(!(current->flags & (PF_WQ_WORKER | PF_IO_WORKER)));
  5359		lockdep_assert(!current->plug);
  5360		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  5361	}
  5362	
  5363	void rt_mutex_schedule(void)
  5364	{
  5365		lockdep_assert(current->sched_rt_mutex);
  5366		__schedule_loop(SM_NONE);
  5367	}
  5368	
  5369	void rt_mutex_post_schedule(void)
  5370	{
  5371		sched_update_worker(current);
  5372		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5373	}
  5374	
> 5375	void rt_mutex_futex_post_schedule(void)
  5376	{
  5377		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5378	}
  5379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
