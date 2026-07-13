Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D753E4502F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 02:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783908133; cv=none; b=L/N2Hxsdn4axPp5j3e0+w03Yjqh3k3W1v4fdwas4eQG6u34pd6jf73lwquiMe+JOThhkPCPCY5r9DxfNDn5+i45F3VPVGvTMfTwU0KXQ60QMLDGh/tKiT6C9GfqYnODs61ukEOaDjzsnIsuoyFgKFC+bULwHXMLT5MMhwB+ehpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783908133; c=relaxed/simple;
	bh=P8OBYkMfgHKfs8/39DHS9exNIJeTGGsno18fB1lPg5E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lg93o1AYm3H2fXNPAuh8kJMd6F0hjqNbomXd0TnYUIhdJ8HHcsvKSpfh9E5fo9V6sxcxOYu18oU9TnVNqc/B5nWYQDHYmjAwUeXk12y1mh4z5NxMmM+PGMNTkaCAJJG/z1xgpqgeDexF58baJie5QixQHn1+Rogy/j82U0/uJys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C6P6Q2l9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C6P6Q2l9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783908131; x=1815444131;
  h=date:from:to:cc:subject:message-id;
  bh=P8OBYkMfgHKfs8/39DHS9exNIJeTGGsno18fB1lPg5E=;
  b=C6P6Q2l9y6IjMZ/GB+2UbPOCTEnLiOYxoOgGhZNBnyOP8CDkqUMFSiDC
   eZw4TJ2KqZlER93lDmkaIqN4/y3RqXDvO56PR/Ucl/UgQ0rzHTRoiAP4t
   qW2/4DOJXKlz8lWlcFkSYagQlCHD0oINbwgODL4YcZbkdfe6f+RdnYJeV
   btF7kY9zlyA2GHzHifXqBmWtklK+v9vznFucs/qGKPx74cJtELPrN9aKy
   YzZdT2af5/OShQTdkd9LEtt8Pjv5YhiDpPWUjKGgVsPevsV2ImTmt7T+6
   ob+JAjg7d6n7Vu14bzk2I3irCUqnrSEdpJAg4YpPp4sW+pr/usvi7SLAR
   w==;
X-CSE-ConnectionGUID: aBvdiu01Qtmf0kohrop7eQ==
X-CSE-MsgGUID: UVAFH9lVQAqsdMci1I9Ffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88340371"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88340371"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 19:02:11 -0700
X-CSE-ConnectionGUID: jlVCw/m/RF6XdKbwq8SCnQ==
X-CSE-MsgGUID: HmrmeG+rSVOJ3Jf+VEYyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="278674795"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Jul 2026 19:02:09 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj5zi-00000000LHX-3Rvt;
	Mon, 13 Jul 2026 02:02:06 +0000
Date: Mon, 13 Jul 2026 10:00:59 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 58/59] kernel/seccomp.c:1439:9:
 error: implicit declaration of function 'disable_TSC'; did you mean
 'disable_irq'?
Message-ID: <202607130849.ENunLLPz-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 27019f00127af90a16c3b8c54e976cdc8a711b0a [58/59] x86: Select ARCH_HAS_RANDOM_ENTROPY
config: x86_64-buildonly-randconfig-006-20260713 (https://download.01.org/0day-ci/archive/20260713/202607130849.ENunLLPz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130849.ENunLLPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130849.ENunLLPz-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/seccomp.c: In function 'seccomp_set_mode_strict':
>> kernel/seccomp.c:1439:9: error: implicit declaration of function 'disable_TSC'; did you mean 'disable_irq'? [-Wimplicit-function-declaration]
    1439 |         disable_TSC();
         |         ^~~~~~~~~~~
         |         disable_irq


vim +1439 kernel/seccomp.c

1d9d02feeee89e Andrea Arcangeli 2007-07-15  1420  
e2cfabdfd07564 Will Drewry      2012-04-12  1421  /**
3b23dd12846215 Kees Cook        2014-06-25  1422   * seccomp_set_mode_strict: internal function for setting strict seccomp
e2cfabdfd07564 Will Drewry      2012-04-12  1423   *
e2cfabdfd07564 Will Drewry      2012-04-12  1424   * Once current->seccomp.mode is non-zero, it may not be changed.
e2cfabdfd07564 Will Drewry      2012-04-12  1425   *
e2cfabdfd07564 Will Drewry      2012-04-12  1426   * Returns 0 on success or -EINVAL on failure.
e2cfabdfd07564 Will Drewry      2012-04-12  1427   */
3b23dd12846215 Kees Cook        2014-06-25  1428  static long seccomp_set_mode_strict(void)
1d9d02feeee89e Andrea Arcangeli 2007-07-15  1429  {
3b23dd12846215 Kees Cook        2014-06-25  1430  	const unsigned long seccomp_mode = SECCOMP_MODE_STRICT;
e2cfabdfd07564 Will Drewry      2012-04-12  1431  	long ret = -EINVAL;
1d9d02feeee89e Andrea Arcangeli 2007-07-15  1432  
dbd952127d11bb Kees Cook        2014-06-27  1433  	spin_lock_irq(&current->sighand->siglock);
dbd952127d11bb Kees Cook        2014-06-27  1434  
1f41b450416e68 Kees Cook        2014-06-25  1435  	if (!seccomp_may_assign_mode(seccomp_mode))
1d9d02feeee89e Andrea Arcangeli 2007-07-15  1436  		goto out;
1d9d02feeee89e Andrea Arcangeli 2007-07-15  1437  
cf99abace7e07d Andrea Arcangeli 2007-07-15  1438  #ifdef TIF_NOTSC
cf99abace7e07d Andrea Arcangeli 2007-07-15 @1439  	disable_TSC();
cf99abace7e07d Andrea Arcangeli 2007-07-15  1440  #endif
00a02d0c502a06 Kees Cook        2018-05-03  1441  	seccomp_assign_mode(current, seccomp_mode, 0);
3b23dd12846215 Kees Cook        2014-06-25  1442  	ret = 0;
3b23dd12846215 Kees Cook        2014-06-25  1443  
3b23dd12846215 Kees Cook        2014-06-25  1444  out:
dbd952127d11bb Kees Cook        2014-06-27  1445  	spin_unlock_irq(&current->sighand->siglock);
3b23dd12846215 Kees Cook        2014-06-25  1446  
3b23dd12846215 Kees Cook        2014-06-25  1447  	return ret;
3b23dd12846215 Kees Cook        2014-06-25  1448  }
3b23dd12846215 Kees Cook        2014-06-25  1449  

:::::: The code at line 1439 was first introduced by commit
:::::: cf99abace7e07dd8491e7093a9a9ef11d48838ed make seccomp zerocost in schedule

:::::: TO: Andrea Arcangeli <andrea@cpushare.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
