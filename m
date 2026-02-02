Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF57EEA8
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Feb 2026 06:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770013051; cv=none; b=Kfcg7+j74b67boSUUMjsDQwTJaGd4TxDSKup5yqwjbIgP7s85aLwe+FVmaUL/1oK1OO9FYuqtVjJ/MDGH3ypeDzbgwkkO4XWJW7XGxbHoJfYwbOSBZhqeYOYscfdIdDQTvVVT8FFebatVlTGA4He0T3ECIwqUcTjKsC/8PGoPn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770013051; c=relaxed/simple;
	bh=rPD9hKHtuXQkp8WlnjMXUP/XJwv2Ve651tnrXTzCeOM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWquJUr3sDTGL2ROKOw6ig7GDzsw1VBVgiuYSxV+8CtZMS+ZfieBxCJNljybbgt0BtgFbUOUSHLR0xcHYifLF30umrOVinqVbbRrpipRWQ7php3kannha8ItmPm2FdncsskEPYbQyzOAJLWJaaFPIiv+qWanvF4LQrPRNOyj0No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RG+x5B/7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RG+x5B/7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770013049; x=1801549049;
  h=date:from:to:cc:subject:message-id;
  bh=rPD9hKHtuXQkp8WlnjMXUP/XJwv2Ve651tnrXTzCeOM=;
  b=RG+x5B/7nVfveKFRAi5xemqgLnkO6NJcF8Q2xO4Hn8ySTymgqNEYeXcj
   ZTSosf9WcSg2nKzhk7rGqSwQeVZKouF0z/exNfkbD2u5uVgEjw4peAhif
   rumIOcM/q21YpcW7Wylzgf1H3krpJYRvjBYnutxqW3oqWRD6Zf0UOXeoU
   qntg8RJtzMKZG8z4oXh3tHyqM+X0JNy89o546h23D+sAZ0ZUgLHM4pVt/
   X5Hdj7ro81cHUjdTIgwul0ZiwOelmyLGoKALwEitNzq/liO4WJDCxSTaB
   MDtnrV/HepuPnwcKrXzIRXrkwKASAoKuWkP9w9bm0rn5gy44/McEmr7k/
   g==;
X-CSE-ConnectionGUID: JA3Ntr/9TTOUYGu8vRTnSg==
X-CSE-MsgGUID: oe66t2BwTricOsBHkTFJqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="71250723"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="71250723"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2026 22:17:29 -0800
X-CSE-ConnectionGUID: qvX+CHxYTo+pDYFTskRp4g==
X-CSE-MsgGUID: pZh5nlYaRwq0LAyei+uf5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; 
   d="scan'208";a="232368155"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Feb 2026 22:17:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmnFU-00000000fHe-3Xru;
	Mon, 02 Feb 2026 06:17:24 +0000
Date: Mon, 02 Feb 2026 14:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Georgia Garcia <georgia.garcia@canonical.com>
Subject: [jj-apparmor:apparmor-next 9/29]
 include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 3 has type 'int'
Message-ID: <202602021427.PvvDjgyL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git apparmor-next
head:   173a18bf6c87bb337d2fe8d59b5a41b3cfa38fda
commit: c140dcd1246bfe705921ca881bbb247ff1ba2bca [9/29] apparmor: make str table more generic and be able to have multiple entries
config: microblaze-randconfig-r073-20260202 (https://download.01.org/0day-ci/archive/20260202/202602021427.PvvDjgyL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260202/202602021427.PvvDjgyL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602021427.PvvDjgyL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from ./arch/microblaze/include/generated/asm/bug.h:1,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/linux/sched.h:14,
                    from include/linux/audit.h:12,
                    from security/apparmor/include/audit.h:14,
                    from security/apparmor/policy_unpack.c:23:
   security/apparmor/policy_unpack.c: In function 'process_strs_entry':
>> include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'int' [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:484:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:706:3: note: in expansion of macro 'printk'
      printk(fmt, ##__VA_ARGS__);    \
      ^~~~~~
   include/linux/printk.h:722:2: note: in expansion of macro 'printk_ratelimited'
     printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:12:22: note: in expansion of macro 'KERN_SOH'
    #define KERN_WARNING KERN_SOH "4" /* warning conditions */
                         ^~~~~~~~
   include/linux/printk.h:722:21: note: in expansion of macro 'KERN_WARNING'
     printk_ratelimited(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
                        ^~~~~~~~~~~~
   security/apparmor/include/lib.h:44:4: note: in expansion of macro 'pr_warn_ratelimited'
       pr_warn_ratelimited("%s: " fmt, __func__, ##args); \
       ^~~~~~~~~~~~~~~~~~~
   security/apparmor/policy_unpack.c:475:5: note: in expansion of macro 'AA_DEBUG'
        AA_DEBUG(DEBUG_UNPACK,
        ^~~~~~~~
   security/apparmor/policy_unpack.c:476:34: note: format string is defined here
          "starting with null save=%lu size %d c=%d",
                                   ~~^
                                   %u

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
