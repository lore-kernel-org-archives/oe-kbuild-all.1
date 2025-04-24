Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D43BA221730
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 08:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484175; cv=none; b=PvtQn5T3XceC4R5YB718yDJ7wD9OLivZJNxY7Nu32aIJR4EKy+SXaRloal7GCvq+0Lj0FI6ZgkMrz0SQJ9/kbkNEUoSo5AeDT3FoSi39HKDGQn+iz0nvCmauhs491B9SSvmldyTP6cBoSckhzMc1QtyRunoUNnhsgqBWJTQ4hSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484175; c=relaxed/simple;
	bh=ISP3ks/cMgx3y/zTZnBrgf2Obnhqevmi0hcK3Yy4kQo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncRquQTpMGdWtfWKKUeFv+2HBiJgCHw3ss29PGaW8A74fErNcCB5xbzHrOm3J1CjRsFDyriq9kKL3DKPnjQDnCLKhOpouFtBPjWUdcT6P1dHd7sBFXX4rapAMVU7e3L6f1EQSqklztqi7mhZvC/SVa6JPV1Jbm/dUjbo37/3bso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qln5zuRJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qln5zuRJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745484172; x=1777020172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ISP3ks/cMgx3y/zTZnBrgf2Obnhqevmi0hcK3Yy4kQo=;
  b=Qln5zuRJT7lu/bH42aXdbstnJfmZvd+BEtLe/dbBsDtVPbmKtYfo1vUk
   f9AtembBt7Z/Gry3Lfnc/Mo4bLCZaw+omNupmipxKqnXgepmx+GZMbWud
   H2t+6gTx7Pto4bhyvCxzvDO5iTBMbS0nbfmPQ0fT5HKmn4U0L/Krgog2i
   pN18/q0AF4AecOVt6trl8el9tS4pysWViCfny9gPSCwqGbQfqwjXc8ip7
   vO0mHndM4F0NgzVH2Eg+T6AqzOEAUenHi9zAgTrlDG4yenIQ41Pu8LkEA
   hgMyVCanPQNdRpE8D0Xo1DIJB5WaXrN1wMmE7CdxUWHyRFUEXX67QY7e4
   A==;
X-CSE-ConnectionGUID: GbRKLCwgREOaQlII47TnUQ==
X-CSE-MsgGUID: CDd5Uy6LQSSMgGxDpKexFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="64635916"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="64635916"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 01:42:51 -0700
X-CSE-ConnectionGUID: WfodRGruTh2dvGe3zkXBBA==
X-CSE-MsgGUID: sZUL/pbjSySRsx7e9fnc5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; 
   d="scan'208";a="132457660"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Apr 2025 01:42:49 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7sAQ-0003zX-0K;
	Thu, 24 Apr 2025 08:42:46 +0000
Date: Thu, 24 Apr 2025 16:41:47 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, Josef Bacik <josef@toxicpanda.com>
Subject: [btrfs:pr/1157 92/97] include/linux/kern_levels.h:5:18: warning:
 format '%llu' expects a matching 'long long unsigned int' argument
Message-ID: <202504241638.xAZzdAMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/btrfs/linux.git pr/1157
head:   10c06ead9f79886df92197deb8d5c7bc37d52971
commit: 84a2b22055fafe3ee021f554d3718fa858343563 [92/97] btrfs: use verbose ASSERT() in volumes.c
config: arm-randconfig-001-20250424 (https://download.01.org/0day-ci/archive/20250424/202504241638.xAZzdAMM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504241638.xAZzdAMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504241638.xAZzdAMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.h:634:3: note: in expansion of macro 'ASSERT'
      ASSERT(RB_EMPTY_NODE(&map->rb_node));
      ^~~~~~
   fs/btrfs/volumes.h: In function 'btrfs_chunk_item_size':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.h:687:2: note: in expansion of macro 'ASSERT'
     ASSERT(num_stripes);
     ^~~~~~
   fs/btrfs/zoned.h: In function 'btrfs_zoned_bg_is_full':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/zoned.h:411:2: note: in expansion of macro 'ASSERT'
     ASSERT(btrfs_is_zoned(bg->fs_info));
     ^~~~~~
   fs/btrfs/volumes.c: In function 'find_fsid':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:458:2: note: in expansion of macro 'ASSERT'
     ASSERT(fsid);
     ^~~~~~
   fs/btrfs/volumes.c: In function 'dev_extent_hole_check_zoned':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1643:2: note: in expansion of macro 'ASSERT'
     ASSERT(IS_ALIGNED(*hole_start, zone_size),
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1643:2: note: in expansion of macro 'ASSERT'
     ASSERT(IS_ALIGNED(*hole_start, zone_size),
     ^~~~~~
   fs/btrfs/volumes.c:1644:24: note: format string is defined here
            "hole_start=%llu zone_size=%llu", *hole_start, zone_size);
                        ~~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1643:2: note: in expansion of macro 'ASSERT'
     ASSERT(IS_ALIGNED(*hole_start, zone_size),
     ^~~~~~
   fs/btrfs/volumes.c:1644:39: note: format string is defined here
            "hole_start=%llu zone_size=%llu", *hole_start, zone_size);
                                       ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'find_free_dev_extent':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1895:2: note: in expansion of macro 'ASSERT'
     ASSERT(max_hole_start + max_hole_size <= search_end,
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1895:2: note: in expansion of macro 'ASSERT'
     ASSERT(max_hole_start + max_hole_size <= search_end,
     ^~~~~~
   fs/btrfs/volumes.c:1896:28: note: format string is defined here
            "max_hole_start=%llu max_hole_size=%llu search_end=%llu",
                            ~~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1895:2: note: in expansion of macro 'ASSERT'
     ASSERT(max_hole_start + max_hole_size <= search_end,
     ^~~~~~
   fs/btrfs/volumes.c:1896:47: note: format string is defined here
            "max_hole_start=%llu max_hole_size=%llu search_end=%llu",
                                               ~~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:1895:2: note: in expansion of macro 'ASSERT'
     ASSERT(max_hole_start + max_hole_size <= search_end,
     ^~~~~~
   fs/btrfs/volumes.c:1896:63: note: format string is defined here
            "max_hole_start=%llu max_hole_size=%llu search_end=%llu",
                                                               ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'btrfs_assign_next_active_device':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:2190:2: note: in expansion of macro 'ASSERT'
     ASSERT(next_device);
     ^~~~~~
   fs/btrfs/volumes.c: In function 'btrfs_num_devices':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:2210:3: note: in expansion of macro 'ASSERT'
      ASSERT(num_devices > 1, "num_devices=%llu", num_devices);
      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:2210:3: note: in expansion of macro 'ASSERT'
      ASSERT(num_devices > 1, "num_devices=%llu", num_devices);
      ^~~~~~
   fs/btrfs/volumes.c:2210:43: note: format string is defined here
      ASSERT(num_devices > 1, "num_devices=%llu", num_devices);
                                           ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'btrfs_rm_device':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:2414:3: note: in expansion of macro 'ASSERT'
      ASSERT(cur_devices->opened == 1, "opened=%d", cur_devices->opened);
      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:2414:3: note: in expansion of macro 'ASSERT'
      ASSERT(cur_devices->opened == 1, "opened=%d", cur_devices->opened);
      ^~~~~~
   fs/btrfs/volumes.c:2414:45: note: format string is defined here
      ASSERT(cur_devices->opened == 1, "opened=%d", cur_devices->opened);
                                               ~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'btrfs_rm_dev_replace_free_srcdev':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:2479:3: note: in expansion of macro 'ASSERT'
      ASSERT(fs_devices->seeding);
      ^~~~~~
   fs/btrfs/volumes.c: In function 'btrfs_remove_chunk':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:3344:3: note: in expansion of macro 'ASSERT'
      ASSERT(0);
      ^~~~~~
   fs/btrfs/volumes.c: In function 'btrfs_may_alloc_data_chunk':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:3662:2: note: in expansion of macro 'ASSERT'
     ASSERT(cache);
     ^~~~~~
   fs/btrfs/volumes.c: In function 'reset_balance_state':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:3870:2: note: in expansion of macro 'ASSERT'
     ASSERT(fs_info->balance_ctl);
     ^~~~~~
   fs/btrfs/volumes.c: In function 'btrfs_balance':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:4667:2: note: in expansion of macro 'ASSERT'
     ASSERT(!test_bit(BTRFS_FS_BALANCE_RUNNING, &fs_info->flags));
     ^~~~~~
   fs/btrfs/volumes.c: In function 'btrfs_resume_balance_async':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:4758:2: note: in expansion of macro 'ASSERT'
     ASSERT(fs_info->exclusive_operation == BTRFS_EXCLOP_BALANCE_PAUSED,
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:4758:2: note: in expansion of macro 'ASSERT'
     ASSERT(fs_info->exclusive_operation == BTRFS_EXCLOP_BALANCE_PAUSED,
     ^~~~~~
   fs/btrfs/volumes.c:4759:31: note: format string is defined here
            "exclusive_operation=%d", fs_info->exclusive_operation);
                                 ~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'btrfs_cancel_balance':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:4919:2: note: in expansion of macro 'ASSERT'
     ASSERT(!test_bit(BTRFS_FS_BALANCE_RUNNING, &fs_info->flags));
     ^~~~~~
   fs/btrfs/volumes.c: In function 'init_alloc_chunk_ctl_policy_regular':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5232:2: note: in expansion of macro 'ASSERT'
     ASSERT(space_info);
     ^~~~~~
   fs/btrfs/volumes.c: In function 'decide_stripe_size_zoned':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5442:2: note: in expansion of macro 'ASSERT'
     ASSERT(devices_info[ctl->ndevs - 1].max_avail == ctl->dev_extent_min,
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5442:2: note: in expansion of macro 'ASSERT'
     ASSERT(devices_info[ctl->ndevs - 1].max_avail == ctl->dev_extent_min,
     ^~~~~~
   fs/btrfs/volumes.c:5443:17: note: format string is defined here
            "ndevs=%d max_avail=%llu dev_extent_min=%llu", ctl->ndevs,
                   ~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5442:2: note: in expansion of macro 'ASSERT'
     ASSERT(devices_info[ctl->ndevs - 1].max_avail == ctl->dev_extent_min,
     ^~~~~~
   fs/btrfs/volumes.c:5443:32: note: format string is defined here
            "ndevs=%d max_avail=%llu dev_extent_min=%llu", ctl->ndevs,
                                ~~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5442:2: note: in expansion of macro 'ASSERT'
     ASSERT(devices_info[ctl->ndevs - 1].max_avail == ctl->dev_extent_min,
     ^~~~~~
   fs/btrfs/volumes.c:5443:52: note: format string is defined here
            "ndevs=%d max_avail=%llu dev_extent_min=%llu", ctl->ndevs,
                                                    ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5457:3: note: in expansion of macro 'ASSERT'
      ASSERT(ctl->stripe_size * data_stripes <= ctl->max_chunk_size,
      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5457:3: note: in expansion of macro 'ASSERT'
      ASSERT(ctl->stripe_size * data_stripes <= ctl->max_chunk_size,
      ^~~~~~
   fs/btrfs/volumes.c:5458:26: note: format string is defined here
             "stripe_size=%llu data_stripes=%d max_chunk_size=%llu",
                          ~~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5457:3: note: in expansion of macro 'ASSERT'
      ASSERT(ctl->stripe_size * data_stripes <= ctl->max_chunk_size,
      ^~~~~~
   fs/btrfs/volumes.c:5458:42: note: format string is defined here
             "stripe_size=%llu data_stripes=%d max_chunk_size=%llu",
                                            ~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5457:3: note: in expansion of macro 'ASSERT'
      ASSERT(ctl->stripe_size * data_stripes <= ctl->max_chunk_size,
      ^~~~~~
   fs/btrfs/volumes.c:5458:62: note: format string is defined here
             "stripe_size=%llu data_stripes=%d max_chunk_size=%llu",
                                                              ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'btrfs_create_chunk':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5666:3: note: in expansion of macro 'ASSERT'
      ASSERT(0);
      ^~~~~~
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:5678:3: note: in expansion of macro 'ASSERT'
      ASSERT(0);
      ^~~~~~
   fs/btrfs/volumes.c: In function 'find_live_mirror':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6065:2: note: in expansion of macro 'ASSERT'
     ASSERT((map->type & (BTRFS_BLOCK_GROUP_RAID1_MASK | BTRFS_BLOCK_GROUP_RAID10)),
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6065:2: note: in expansion of macro 'ASSERT'
     ASSERT((map->type & (BTRFS_BLOCK_GROUP_RAID1_MASK | BTRFS_BLOCK_GROUP_RAID10)),
     ^~~~~~
   fs/btrfs/volumes.c:6066:18: note: format string is defined here
            "type=%llu", map->type);
                  ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'handle_ops_on_dev_replace':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6367:2: note: in expansion of macro 'ASSERT'
     ASSERT(nr_extra_stripes <= 2, "nr_extra_stripes=%d", nr_extra_stripes);
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%d' expects a matching 'int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6367:2: note: in expansion of macro 'ASSERT'
     ASSERT(nr_extra_stripes <= 2, "nr_extra_stripes=%d", nr_extra_stripes);
     ^~~~~~
   fs/btrfs/volumes.c:6367:51: note: format string is defined here
     ASSERT(nr_extra_stripes <= 2, "nr_extra_stripes=%d", nr_extra_stripes);
                                                     ~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6378:3: note: in expansion of macro 'ASSERT'
      ASSERT(bioc->map_type & BTRFS_BLOCK_GROUP_DUP,
      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6378:3: note: in expansion of macro 'ASSERT'
      ASSERT(bioc->map_type & BTRFS_BLOCK_GROUP_DUP,
      ^~~~~~
   fs/btrfs/volumes.c:6379:23: note: format string is defined here
             "map_type=%llu", bioc->map_type);
                       ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/volumes.c: In function 'btrfs_max_io_len':
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6406:2: note: in expansion of macro 'ASSERT'
     ASSERT(io_geom->stripe_offset < U32_MAX,
     ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6406:2: note: in expansion of macro 'ASSERT'
     ASSERT(io_geom->stripe_offset < U32_MAX,
     ^~~~~~
   fs/btrfs/volumes.c:6407:27: note: format string is defined here
            "stripe_offset=%llu", io_geom->stripe_offset);
                           ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6425:3: note: in expansion of macro 'ASSERT'
      ASSERT(io_geom->raid56_full_stripe_start + full_stripe_len > offset,
      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6425:3: note: in expansion of macro 'ASSERT'
      ASSERT(io_geom->raid56_full_stripe_start + full_stripe_len > offset,
      ^~~~~~
   fs/btrfs/volumes.c:6426:39: note: format string is defined here
             "raid56_full_stripe_start=%llu full_stripe_len=%lu offset=%llu",
                                       ~~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
>> include/linux/kern_levels.h:5:18: warning: format '%lu' expects a matching 'long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6425:3: note: in expansion of macro 'ASSERT'
      ASSERT(io_geom->raid56_full_stripe_start + full_stripe_len > offset,
      ^~~~~~
   fs/btrfs/volumes.c:6426:59: note: format string is defined here
             "raid56_full_stripe_start=%llu full_stripe_len=%lu offset=%llu",
                                                            ~~^
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
   include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6425:3: note: in expansion of macro 'ASSERT'
      ASSERT(io_geom->raid56_full_stripe_start + full_stripe_len > offset,
      ^~~~~~
   fs/btrfs/volumes.c:6426:71: note: format string is defined here
             "raid56_full_stripe_start=%llu full_stripe_len=%lu offset=%llu",
                                                                       ~~~^
   In file included from fs/btrfs/compression.h:16:0,
                    from fs/btrfs/extent_io.h:15,
                    from fs/btrfs/locking.h:13,
                    from fs/btrfs/ctree.h:19,
                    from fs/btrfs/disk-io.h:11,
                    from fs/btrfs/volumes.c:16:
   fs/btrfs/messages.h:181:29: error: expected ')' before '__VA_OPT__'
    #define __REST_ARGS(_, ...) __VA_OPT__(,) __VA_ARGS__
                                ^
   include/linux/printk.h:479:19: note: in expansion of macro '__REST_ARGS'
      _p_func(_fmt, ##__VA_ARGS__);    \
                      ^~~~~~~~~~~
   include/linux/printk.h:507:26: note: in expansion of macro 'printk_index_wrap'
    #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                             ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \
       ^~~~~~
   fs/btrfs/volumes.c:6428:3: note: in expansion of macro 'ASSERT'
      ASSERT(io_geom->raid56_full_stripe_start <= offset,
      ^~~~~~
   In file included from include/asm-generic/bug.h:22:0,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from fs/btrfs/volumes.c:6:
   include/linux/kern_levels.h:5:18: warning: format '%llu' expects a matching 'long long unsigned int' argument [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^
   include/linux/printk.h:479:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:550:2: note: in expansion of macro 'printk'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:550:9: note: in expansion of macro 'KERN_ERR'
     printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
            ^~~~~~~~
   fs/btrfs/messages.h:211:4: note: in expansion of macro 'pr_err'
       pr_err("assertion failed: %s :: %ld, in %s:%d (" __FIRST_ARG(args) ")\n", \


vim +5 include/linux/kern_levels.h

314ba3520e513a7 Joe Perches 2012-07-30  4  
04d2c8c83d0e3ac Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3ac Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3ac Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
