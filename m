Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9026BDB6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Feb 2025 07:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257766; cv=none; b=dn3RCgg9KXfYLg5/XglMwFd5BFZuISyGYAwKv6go+/18fDJi+IbtN/8S+1HwBZ7uJ26XuVgfk7qbs++qSG3kxYrDO2vXoNvNDQih1tadnW0BWCU1fvKLJo8G+mUT5kMX35kc+30vYvQp527aK+XUpMLvq7bDyZEatb47KopUW2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257766; c=relaxed/simple;
	bh=MsGEqMN4CYtm2oHqmsYIkHT/tMmVvD6TG/evO6l1miI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7Kf6iMxjgnFMudC2kCuySuDEwgFEPidAvwNOIDyecO/h08Q+W8i71Alu3B8Ax2YFo/bM7nDINO/IJ8BiqrFuutlleVUgun4KjiShQPUsgqKnlypSJj0vkfulTvqBz9Hlze04NYzLm/6RcG1y32uC4sZa3J0wyGWc3pkGACxCfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U6aHH0+d; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U6aHH0+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739257764; x=1770793764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MsGEqMN4CYtm2oHqmsYIkHT/tMmVvD6TG/evO6l1miI=;
  b=U6aHH0+dqsQaZvA5dpVxQmPlPIoCFf5iGeFJ3jSH4DP/XWLH/1wx2L27
   T6jsPcuv47HBoPIQavDk9Cm2FcsmE2MHSteXupj+gh4kz/TMZfhT4EERt
   Cc1ZrXpw1Fz5LJD3e27Ap+l8xaQIL2VFts14qVv879n/XqiukypXXWmU8
   rQHUqDkrtPpfBmscq5u0cqa0tSNk+oWZxqsoA6J8dXE5EKAookAExn8Io
   t/z4hm9rBqVApM5zLWk4CrmAxXAAtnUvGwZLyb+QucW1igaYneHOzFwWU
   Y7REwguuCo+fBfFt7JfegaQJ4Ennpdxdsgb2ZRPOn4S8ChG3zmQ2wRmsS
   g==;
X-CSE-ConnectionGUID: 4wxRLmkpQr+oQtg00mxpqA==
X-CSE-MsgGUID: S4/uqof3S26nqqffLIFgGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43523367"
X-IronPort-AV: E=Sophos;i="6.13,276,1732608000"; 
   d="scan'208";a="43523367"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 23:09:23 -0800
X-CSE-ConnectionGUID: bTcf0tLrQC2FjCaSjs9m2g==
X-CSE-MsgGUID: MggbYkHiQ1WhFh0KmEf2sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112284386"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 10 Feb 2025 23:09:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thkOW-0013rb-28;
	Tue, 11 Feb 2025 07:09:20 +0000
Date: Tue, 11 Feb 2025 15:08:37 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:cpusetisolation 2/5] include/linux/sched/isolation.h:61:17:
 error: implicit declaration of function 'housekeeping_cpu'; did you mean
 'housekeeping_init'?
Message-ID: <202502111552.6Em6nvOB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git cpusetisolation
head:   9861605548c2952b76f12b4ff62edaa42e6cb61e
commit: 74b420e55b3d622b3e1c580efada25dedfc9c2d3 [2/5] sched/isolation: merge housekeeping_cpu() and housekeeping_test_cpu()
config: i386-buildonly-randconfig-003-20250211 (https://download.01.org/0day-ci/archive/20250211/202502111552.6Em6nvOB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502111552.6Em6nvOB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502111552.6Em6nvOB-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/time/hrtimer.c:41:
   include/linux/sched/isolation.h: In function 'cpu_is_isolated':
>> include/linux/sched/isolation.h:61:17: error: implicit declaration of function 'housekeeping_cpu'; did you mean 'housekeeping_init'? [-Werror=implicit-function-declaration]
      61 |         return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
         |                 ^~~~~~~~~~~~~~~~
         |                 housekeeping_init
   kernel/time/hrtimer.c: At top level:
   kernel/time/hrtimer.c:124:35: warning: initialized field overwritten [-Woverride-init]
     124 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:124:35: note: (near initialization for 'hrtimer_clock_to_base_table[0]')
   kernel/time/hrtimer.c:125:35: warning: initialized field overwritten [-Woverride-init]
     125 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:125:35: note: (near initialization for 'hrtimer_clock_to_base_table[1]')
   kernel/time/hrtimer.c:126:35: warning: initialized field overwritten [-Woverride-init]
     126 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:126:35: note: (near initialization for 'hrtimer_clock_to_base_table[7]')
   kernel/time/hrtimer.c:127:35: warning: initialized field overwritten [-Woverride-init]
     127 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
         |                                   ^~~~~~~~~~~~~~~~
   kernel/time/hrtimer.c:127:35: note: (near initialization for 'hrtimer_clock_to_base_table[11]')
   cc1: some warnings being treated as errors


vim +61 include/linux/sched/isolation.h

    58	
    59	static inline bool cpu_is_isolated(int cpu)
    60	{
  > 61		return !housekeeping_cpu(cpu, HK_TYPE_DOMAIN) ||
    62		       !housekeeping_cpu(cpu, HK_TYPE_TICK) ||
    63		       cpuset_cpu_is_isolated(cpu);
    64	}
    65	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
