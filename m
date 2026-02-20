Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405B41E5B7A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Feb 2026 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771548056; cv=none; b=TtPJxfmBtq9rUooCkSc+mWZmpPKW7UFBuh4CCg+4PNVceuic8RUhYIwqNknirxI/W37o9DXZ3kHVM12o+P+hbuo1xd8lZxtSnL5I/A1OljazkPFhoUTZyG5v68CNs1laJBkdzK9/45wXCjk2uYw1qRSXW/0m7UlkfWjs9T2vhn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771548056; c=relaxed/simple;
	bh=mG3fvGqp1t7gBCjctykf6s2+zCl4sa9XEf4koa7ydrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L25jmxzaidVzQ/vVA4ghBkD7pYVjwZXE5XXYH4xSJjtGqPpPdoU2SAB7X+Vns5/Lo+SHPQNuQmTryBRCjr/o/P79ZCqXN/zkVmB6MsRYeHiSVEf9Nutj+S769P5CCjq8AoM7cx8n0mUua7PGge/I66SjmvGYLAvr4DzDM7O/FQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a5CF2OiN; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a5CF2OiN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771548055; x=1803084055;
  h=date:from:to:cc:subject:message-id;
  bh=mG3fvGqp1t7gBCjctykf6s2+zCl4sa9XEf4koa7ydrA=;
  b=a5CF2OiNCdDP17Fs6+j7bRjQ7O3KGisCVFYw3GEz35X5aWCk/5I29Lr8
   fZ621XnANmSZogspc3EaQ0oviG0pQG1ghL+KJGB2DyN98Nu0QEszqMZR4
   G8eA97sT2Aog00IVyH5P+R2Yv3wSyIH8ka0Nq29WHuhlhi3llrstKOPQz
   19Lf+xEdrVh/LhCQV+/9WKqPy302KEDdXi3897Vcu0xAtvja9jTJARV6S
   XaLiKKXR8ogIZHwv36RW05F8vJUtVi5hVkSphiRdaUho+UHM59IEMOLIT
   ZLClc/Gdpy1JOLc5ZgxLrjhznollLNg07GHywFR8uRohWHjYJ2iCI7vOM
   A==;
X-CSE-ConnectionGUID: /IofsvkXS3a9pjtAahmlqw==
X-CSE-MsgGUID: sbk+mAelRWi2jx+eDCEXrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="60222015"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="60222015"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 16:40:55 -0800
X-CSE-ConnectionGUID: Cx49xq4ZQaasFCN5tZZh9A==
X-CSE-MsgGUID: T2mmFSPMTZKi24E1hkQZdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="219708753"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Feb 2026 16:40:53 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vtEZf-000000013fi-0EqN;
	Fri, 20 Feb 2026 00:40:51 +0000
Date: Fri, 20 Feb 2026 08:40:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 25/42]
 kernel/time/hrtimer.c:1252:16: error: too many arguments to function
 'hrtimer_prefer_local'
Message-ID: <202602200801.XSdyR0RE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   999dcca32838c24ad84b897eff67f18554b21aa2
commit: 8a407a52a7bbadb7e60638bdc055bdf5cc8a3311 [25/42] hrtimer: Optimize for local timers
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260220/202602200801.XSdyR0RE-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200801.XSdyR0RE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200801.XSdyR0RE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/hrtimer.c: In function 'hrtimer_keep_base':
>> kernel/time/hrtimer.c:1252:16: error: too many arguments to function 'hrtimer_prefer_local'
    1252 |         return hrtimer_prefer_local(is_local, is_first, is_pinned);
         |                ^~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:1239:29: note: declared here
    1239 | static __always_inline bool hrtimer_prefer_local(bool is_local)
         |                             ^~~~~~~~~~~~~~~~~~~~


vim +/hrtimer_prefer_local +1252 kernel/time/hrtimer.c

  1244	
  1245	static inline bool hrtimer_keep_base(struct hrtimer *timer, bool is_local, bool is_first,
  1246					     bool is_pinned)
  1247	{
  1248		/* If the timer is running the callback it has to stay on its CPU base. */
  1249		if (unlikely(timer->base->running == timer))
  1250			return true;
  1251	
> 1252		return hrtimer_prefer_local(is_local, is_first, is_pinned);
  1253	}
  1254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
