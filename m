Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C103B1D096C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Sep 2024 12:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725454483; cv=none; b=nteCeSi+3o397T9SehdkpiRPmtMnQzGMu8dffUqom7Pu9CDLEPK1m5j06SpnQdhXHdH6kbPkggJQO3qohYeDa77doXD4u3WysjymlP5sv7+jJD+Ub6V2NqK+iFSHm+dYfeW9okxYTni8gOs/2KZNtfMgQ96EO7i7BhBzBdV5vqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725454483; c=relaxed/simple;
	bh=K/ENDSyE+DljnOczSdlLQ4QSmlCdgEXH5atDGW6FObo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NetSsDM5beIAoaKk0dwuIRPgDWOyQnw5aAmTYbSiOmxEN9RbTuJ2+5d852af2Q74uEFWdBMUoQmSCAAtJ0sv+QhshhNbThO/MNnMCT8CEhYWSEzcn5PQoXWCbCofdU8JI+PU5x+XxVn63SiMjU12Y+ixltcfSeeh/sZC1dOdv8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ij1ZReBb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ij1ZReBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725454481; x=1756990481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K/ENDSyE+DljnOczSdlLQ4QSmlCdgEXH5atDGW6FObo=;
  b=ij1ZReBbTeb9X9MbZ6hAs6WJR+l+dhuvnHRjlbnt+lW0JU1PSO0UJVY2
   l+7oXdM716Uo6oXxV/wIY0ze0WTawkBI3/HEC58BpZIX5sBPvfBsEnRSw
   Ou95EU4ct9aelGD60RWu3TYMxvVZ65vjC0HW7EVMQ3azPT4Cl9njS+vv9
   7E6FH8uo1dXi9aDl59NLE9HtERsibqvaLKMsV2XFf8OfNO+ISwbSczPE+
   FQdJPczeorhHQ0F7tFNshdv0HgNKPGjAhKBnGw5WsYz51HcRzrgNt2wxs
   mPoUsJqMAmEqPzh/hNHHe2d1WAJ3Nt6jhPD/Hpu1Gsfs5gBO8KQ8zHTQd
   A==;
X-CSE-ConnectionGUID: jCNyKeOiQr22e0lP6Re+IA==
X-CSE-MsgGUID: ox5sI2X7TW2Ts/mKgjb7jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="41583773"
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="41583773"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 05:54:17 -0700
X-CSE-ConnectionGUID: k5HOUcg+T3qxfU6L5OLaNA==
X-CSE-MsgGUID: tMhMR5TiTqmS1Zk1rWDpZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,201,1719903600"; 
   d="scan'208";a="102672493"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 04 Sep 2024 05:54:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1slpWY-000859-0w;
	Wed, 04 Sep 2024 12:54:14 +0000
Date: Wed, 4 Sep 2024 20:54:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 13128/15111]
 kernel/time/hrtimer.c:993:6: sparse: sparse: symbol 'hrtimer_switch_to_lres'
 was not declared. Should it be static?
Message-ID: <202409042044.AY4SH3yR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   1a5a24cd6765f47796eb83f368950d5cd158a7a3
commit: b8c2ecf1c5f62ae801b22ed9a75627c1590b7aab [13128/15111] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: i386-randconfig-062-20240904 (https://download.01.org/0day-ci/archive/20240904/202409042044.AY4SH3yR-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240904/202409042044.AY4SH3yR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409042044.AY4SH3yR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/time/hrtimer.c:993:6: sparse: sparse: symbol 'hrtimer_switch_to_lres' was not declared. Should it be static?
   kernel/time/hrtimer.c:257:37: sparse: sparse: self-comparison always evaluates to false
   kernel/time/hrtimer.c:267:37: sparse: sparse: self-comparison always evaluates to false

vim +/hrtimer_switch_to_lres +993 kernel/time/hrtimer.c

   988	
   989	#if defined CONFIG_HIGH_RES_TIMERS && CONFIG_HZ >= 1000
   990	/*
   991	 * Switch to low resolution mode
   992	 */
 > 993	void hrtimer_switch_to_lres(void)
   994	{
   995		struct hrtimer_cpu_base *base = this_cpu_ptr(&hrtimer_bases);
   996	
   997		if (!__hrtimer_hres_active(base))
   998			return;
   999	
  1000		tick_nohz_hres_to_lres();
  1001		base->hres_active = 0;
  1002		hrtimer_resolution = LOW_RES_NSEC;
  1003	}
  1004	#endif
  1005	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
