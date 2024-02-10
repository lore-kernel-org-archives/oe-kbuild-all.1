Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB51F13ACC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 05:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707541807; cv=none; b=aPKCGIn5YGAso4Uv3/DRPpV3J9IkTpf7agNZDVgJt3aHAYLFwZlgFIsJ5NpRz1VV1grQ3zqzQF1FwSqWIwOO4fnY3DvwYmtofj9nCYWaZd2Sr+x3CbUvmeXnOy51Nuh4W8tORDjVGU24m0xkA3SPEPCLImrhuVjrzr3IqIcUmg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707541807; c=relaxed/simple;
	bh=HulRH5uxtakzhOuWp8z2Yk9jSPAZVCkuSYkKi6MVUiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N6/MtrTKj82MzeJTj7lkNBCIo5OXTY3UizLPXxQHR4g3RvGs0e7pUq22is1ks2Q86lhc2zrnigINBpVsAWyzCeCECSFJZiKHijJiuB73GO+XEEuffAKeCBFcN7zeM+w8RAem4H9t72RHBmWFY0R2skz0an0USm8ZBGCgkDCZT/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFISl0lb; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFISl0lb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707541806; x=1739077806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HulRH5uxtakzhOuWp8z2Yk9jSPAZVCkuSYkKi6MVUiE=;
  b=gFISl0lbNr8JJww/hpLWCBxbXIuDpfqI21Ov+p2K8VDIS8lrEupCPvSS
   8sjDFwUa0ejbqoJHtJ69jfJcfY/wakCOSXOwOEuYPnTuDolREAracMYe5
   Y2aFzSH3iWlXIyGgkCG1XroKnpr6YGqljRZ/lWTwrXB0VN/NuZPV56N4H
   kPfH2dGI676p/YWBG5leja835nNu1+dmtAOnoF9KHRNtc+xTHIjoXwJOp
   IMyh5DMBjJevIrWSqgwmgVu79vNwHtPej89RrhLcatRHSTqfartmVUmCA
   h0U2GCf54Kn6VFTHXUaGCij1MdofoZ9maCdVL2CTa/MH9rKDx/NL8AFXi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1426038"
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="1426038"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 21:10:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,258,1701158400"; 
   d="scan'208";a="6756299"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Feb 2024 21:10:04 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYfcn-0005MU-23;
	Sat, 10 Feb 2024 05:10:01 +0000
Date: Sat, 10 Feb 2024 13:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Frederic Weisbecker <frederic@kernel.org>
Subject: [frederic-dynticks:timers/anna 23/29]
 kernel/time/timer_migration.c:1379: warning: Function parameter or struct
 member 'nextevt' not described in 'tmigr_quick_check'
Message-ID: <202402101310.rPIZXVPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/anna
head:   9a654aebd02182bcaff7e5a26b632ee20a1536ad
commit: a7631399e1db94d34d3cc5bae11e1bfcbb02db30 [23/29] do not forget quick check
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240210/202402101310.rPIZXVPJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402101310.rPIZXVPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402101310.rPIZXVPJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/timer_migration.c:1379: warning: Function parameter or struct member 'nextevt' not described in 'tmigr_quick_check'
>> kernel/time/timer_migration.c:1379: warning: Excess function parameter 'nextexp' description in 'tmigr_quick_check'


vim +1379 kernel/time/timer_migration.c

0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1359  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1360  /**
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1361   * tmigr_quick_check() - Quick forecast of next tmigr event when CPU wants to
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1362   *			 go idle
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1363   * @nextexp:	The next global timer expiry of the current CPU
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1364   *
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1365   * Return:
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1366   * * KTIME_MAX		- when it is probable that nothing has to be done (not
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1367   *	 		  the only one in the level 0 group; and if it is the
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1368   *	 		  only one in level 0 group, but there are more than a
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1369   *	 		  single group active on the way to top level)
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1370   * * nextevt		- when CPU is offline and has to handle timer on his own
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1371   *			  or when on the way to top in every group only a single
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1372   *			  child is active and but @nextevt is before next_expiry
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1373   *			  of top level group
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1374    * * next_expiry (top)	- value of top level group, when on the way to top in
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1375   * 			  every group only a single child is active and @nextevt
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1376   * 			  is after this value active child.
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1377   */
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1378  u64 tmigr_quick_check(u64 nextevt)
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09 @1379  {
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1380  	struct tmigr_cpu *tmc = this_cpu_ptr(&tmigr_cpu);
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1381  	struct tmigr_group *group = tmc->tmgroup;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1382  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1383  	if (tmigr_is_not_available(tmc))
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1384  		return nextevt;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1385  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1386  	if (WARN_ON_ONCE(tmc->idle))
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1387  		return nextevt;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1388  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1389  	if (!tmigr_check_migrator_and_lonely(tmc->tmgroup, tmc->childmask))
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1390  		return KTIME_MAX;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1391  
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1392  	do {
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1393  		if (!tmigr_check_lonely(group)) {
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1394  			return KTIME_MAX;
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1395  		} else if (!group->parent) {
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1396  			u64 first_global = READ_ONCE(group->next_expiry);
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1397  			return min_t(u64, nextevt, first_global);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1398  		}
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1399  		group = group->parent;
a7631399e1db94 Anna-Maria Behnsen 2024-02-09  1400  	} while (group);
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1401  
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1402  	return KTIME_MAX;
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1403  }
0a3bafadcf1c9d Anna-Maria Behnsen 2024-02-09  1404  

:::::: The code at line 1379 was first introduced by commit
:::::: 0a3bafadcf1c9d0de98b840e6e906e8f86167a12 timers: Implement the hierarchical pull model

:::::: TO: Anna-Maria Behnsen <anna-maria@linutronix.de>
:::::: CC: Frederic Weisbecker <frederic@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
