Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBEB25E460
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 14:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742827961; cv=none; b=ZMdSGM6X4KL4mdXa/xK284Sgg12rIBEIF/tWmutl+j5yztOKZ13dA0ZTUz3aOwwKcFqrvc9shY3Hll3UzGvHqwGWZIrvd5DWIuxDP+LLQ8XmIA+0Y3/uwMo9/N49lkdv3YEACL1G5V6xheoPnZQx+JAejppVukm6BckZW7t7l1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742827961; c=relaxed/simple;
	bh=vyerLS2nK/+sahdMm+wrUFJJjSkkeduq+vimHspjwjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBpvWUYVZsuE+lZ47P1UduokWs0fJSX3UOCom9z+ON42esgniGte7KjweTTlA8lWTjkqaPz4oN3X1X3AbXBWIfBL2KTVPquyfMYGrGz0TYr0VSMB9pA35938V+pFtu4/ZT950l60fzCPN0Wpom1/dCGi/BBvp3ZR/N6j0yjBDEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZbHSbRs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZbHSbRs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742827960; x=1774363960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vyerLS2nK/+sahdMm+wrUFJJjSkkeduq+vimHspjwjk=;
  b=cZbHSbRsNQtFPQ4/5fPZntpX/STaTUdrkail3DOAahURacI/pU3F1W5R
   Uduq1zl7Co16St6/4bAdBs/GhZO6fsVLMCGQFnhfQUOTLTZtTYlJSlZP8
   2qeaDyXVhvFvWtruR+8yVOufUq/geDv2Qi5MY9Wk4aE6w+0Lgt1cqK89w
   FkyijB0GA4NlEY2OMXlZ8LwRBeJfjF1Un7cOP45xaY5T9Cb1MC8uVGzU1
   YI/jn9nZAEl0lCcQ7evgVcWyUP8lKBEUvOLTZje3wdpmhSxEnlb+Iopkq
   26GS7hVri3O++sCpwnqm3doiu82MaTK1W/zq2r3VuRHBX8HrsuDreh48m
   w==;
X-CSE-ConnectionGUID: q7TY8WQMSUi6OW19t0BDpw==
X-CSE-MsgGUID: adMGRm0bTPimiXKvpNnjyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43274265"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="43274265"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 07:52:39 -0700
X-CSE-ConnectionGUID: 2aNNZ2yeT7eIJLpzaGHCXw==
X-CSE-MsgGUID: auTTer+JQ5ymGpXb0jvFXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; 
   d="scan'208";a="128762378"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Mar 2025 07:52:38 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twjAA-0003gI-1S;
	Mon, 24 Mar 2025 14:52:28 +0000
Date: Mon, 24 Mar 2025 22:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/hrtick 3/4] kernel/time/hrtimer.c:1991:27:
 error: 'TIF_REARM' undeclared
Message-ID: <202503242207.v0uuLg8d-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/hrtick
head:   adf71785ae176daaf2d8c0de6cac055d18c35d96
commit: a88605da40649a8343a20b492a5ebed89e25fcb8 [3/4] entry,hrtimer,x86: Push reprogramming timers into the interrupt return path
config: csky-randconfig-002-20250324 (https://download.01.org/0day-ci/archive/20250324/202503242207.v0uuLg8d-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250324/202503242207.v0uuLg8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503242207.v0uuLg8d-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/current.h:6,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/hrtimer.c:25:
   kernel/time/hrtimer.c: In function 'hrtimer_rearm':
>> kernel/time/hrtimer.c:1991:27: error: 'TIF_REARM' undeclared (first use in this function)
    1991 |         clear_thread_flag(TIF_REARM);
         |                           ^~~~~~~~~
   include/linux/thread_info.h:141:53: note: in definition of macro 'clear_thread_flag'
     141 |         clear_ti_thread_flag(current_thread_info(), flag)
         |                                                     ^~~~
   kernel/time/hrtimer.c:1991:27: note: each undeclared identifier is reported only once for each function it appears in
    1991 |         clear_thread_flag(TIF_REARM);
         |                           ^~~~~~~~~
   include/linux/thread_info.h:141:53: note: in definition of macro 'clear_thread_flag'
     141 |         clear_ti_thread_flag(current_thread_info(), flag)
         |                                                     ^~~~


vim +/TIF_REARM +1991 kernel/time/hrtimer.c

  1980	
  1981	void hrtimer_rearm(void)
  1982	{
  1983		struct hrtimer_cpu_base *cpu_base = this_cpu_ptr(&hrtimer_bases);
  1984		unsigned long flags;
  1985		ktime_t now;
  1986	
  1987		raw_spin_lock_irqsave(&cpu_base->lock, flags);
  1988		now = hrtimer_update_base(cpu_base);
  1989		__hrtimer_rearm(cpu_base, now);
  1990		raw_spin_unlock_irqrestore(&cpu_base->lock, flags);
> 1991		clear_thread_flag(TIF_REARM);
  1992	}
  1993	#endif /* !CONFIG_HIGH_RES_TIMERS */
  1994	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
