Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99085256C7A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 21:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999836; cv=none; b=d5kB+0FnX1TkhRf6gr1xy27eQj7aNfiTVjq8G+Ju9pb9pGZ1W2kB0FFz4h1ZnX+NLioj/1Ax9eSOLrmu/hVtVNp58qyw+Vivlj3Qd1XH1FYhX2frMIxuLU1QZGuIpPJkJXU3WeImhLxLWngHcWa6/Ms6Oryxbd4wX7Jluto0kA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999836; c=relaxed/simple;
	bh=VuulFy/cRzk64+E+MPM5QK2bLdmicsxj/SmC1rxZE7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u62wzk3ldVOxnOGVuUcV6S39FUpnOYn0MqO3SiH4ch+St3lxZG/HvdTQkzVcgnshndyAYMh5F3F9tIhbdYr7g9eqhGGCLYGOn9W+HRB1QTeo6Kdd3JdCDfQtgR+3wGXOuQT1O/Dt6IBbWEMJ1/nwOEzlDMCtUSCH3RC+eJ2wx/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UPX17QVA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UPX17QVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739999835; x=1771535835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VuulFy/cRzk64+E+MPM5QK2bLdmicsxj/SmC1rxZE7s=;
  b=UPX17QVAczivYXdBsV1EOfi14us03Od3jWebcLGuhu4vEhsSGWLy1rXa
   A3EXPTSfq8Pq4jbhlZUTtPEkKzrQoIT/eNRjdhkmsdagL7fCovct1Qotm
   EmK89dZKzuGw3ASc66qqgiqvh+otQRAxYCsSL7+SbCtVlFN9+xa9gXtSs
   v5yZmMQzMJL7781Z2Xh/1aqmRT4/LsneLoVAoy2gCf8RHqZw7eamnzkYu
   ZEdq0dbHD5F+oGoWZOAZxJTdak257EKkbwSlJmHcfK+Z0eyi6bo3Y2Vh2
   10EU/b6UxBFwtJX+4zOb70XSTeqtLTCDadq6DTlTl5FFj5xUaKVMdwij0
   w==;
X-CSE-ConnectionGUID: uc0rL8DLRjyz5ZBcm4tfHw==
X-CSE-MsgGUID: B+h29MkPThWdg0pAcjdBgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="41016706"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="41016706"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 13:17:11 -0800
X-CSE-ConnectionGUID: Q/rYfcN9ToiPVCJRL8fVSg==
X-CSE-MsgGUID: wncB81c2S/yMBs8i/P9x2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114777451"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 19 Feb 2025 13:17:08 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkrRJ-0003UF-1P;
	Wed, 19 Feb 2025 21:17:05 +0000
Date: Thu, 20 Feb 2025 05:16:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 421/421]
 include/linux/compiler.h:350:45: error: call to '__compiletime_assert_2084'
 declared with attribute error: BUILD_BUG_ON failed: PAGE_SIZE !=
 INCFS_DATA_FILE_BLOCK_SIZE
Message-ID: <202502200507.1axUD3wh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   d5c9e7913fb58286e57e6a63882b704d8c5596ce
commit: 1be052b20ba04b635cf87bcff80de5314697953e [421/421] ANDROID: Initial commit of Incremental FS
config: arm64-randconfig-002-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200507.1axUD3wh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200507.1axUD3wh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200507.1axUD3wh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/incfs/vfs.c:2058:16: warning: no previous prototype for 'incfs_mount_fs' [-Wmissing-prototypes]
    2058 | struct dentry *incfs_mount_fs(struct file_system_type *type, int flags,
         |                ^~~~~~~~~~~~~~
   fs/incfs/vfs.c:2177:6: warning: no previous prototype for 'incfs_kill_sb' [-Wmissing-prototypes]
    2177 | void incfs_kill_sb(struct super_block *sb)
         |      ^~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/blkdev.h:5,
                    from fs/incfs/vfs.c:6:
   fs/incfs/vfs.c: In function 'incfs_mount_fs':
>> include/linux/compiler.h:350:45: error: call to '__compiletime_assert_2084' declared with attribute error: BUILD_BUG_ON failed: PAGE_SIZE != INCFS_DATA_FILE_BLOCK_SIZE
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |                                             ^
   include/linux/compiler.h:331:25: note: in definition of macro '__compiletime_assert'
     331 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler.h:350:9: note: in expansion of macro '_compiletime_assert'
     350 |         _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/incfs/vfs.c:2084:9: note: in expansion of macro 'BUILD_BUG_ON'
    2084 |         BUILD_BUG_ON(PAGE_SIZE != INCFS_DATA_FILE_BLOCK_SIZE);
         |         ^~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


vim +/__compiletime_assert_2084 +350 include/linux/compiler.h

9a8ab1c39970a49 Daniel Santos 2013-02-21  336  
9a8ab1c39970a49 Daniel Santos 2013-02-21  337  #define _compiletime_assert(condition, msg, prefix, suffix) \
9a8ab1c39970a49 Daniel Santos 2013-02-21  338  	__compiletime_assert(condition, msg, prefix, suffix)
9a8ab1c39970a49 Daniel Santos 2013-02-21  339  
9a8ab1c39970a49 Daniel Santos 2013-02-21  340  /**
9a8ab1c39970a49 Daniel Santos 2013-02-21  341   * compiletime_assert - break build and emit msg if condition is false
9a8ab1c39970a49 Daniel Santos 2013-02-21  342   * @condition: a compile-time constant condition to check
9a8ab1c39970a49 Daniel Santos 2013-02-21  343   * @msg:       a message to emit if condition is false
9a8ab1c39970a49 Daniel Santos 2013-02-21  344   *
9a8ab1c39970a49 Daniel Santos 2013-02-21  345   * In tradition of POSIX assert, this macro will break the build if the
9a8ab1c39970a49 Daniel Santos 2013-02-21  346   * supplied condition is *false*, emitting the supplied error message if the
9a8ab1c39970a49 Daniel Santos 2013-02-21  347   * compiler has support to do so.
9a8ab1c39970a49 Daniel Santos 2013-02-21  348   */
9a8ab1c39970a49 Daniel Santos 2013-02-21  349  #define compiletime_assert(condition, msg) \
9a8ab1c39970a49 Daniel Santos 2013-02-21 @350  	_compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
9a8ab1c39970a49 Daniel Santos 2013-02-21  351  

:::::: The code at line 350 was first introduced by commit
:::::: 9a8ab1c39970a4938a72d94e6fd13be88a797590 bug.h, compiler.h: introduce compiletime_assert & BUILD_BUG_ON_MSG

:::::: TO: Daniel Santos <daniel.santos@pobox.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
