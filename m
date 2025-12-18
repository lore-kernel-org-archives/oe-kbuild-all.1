Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60B333CE92
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766052897; cv=none; b=QfiE5vzPZbZ8jjqNeHarpZEmWzDgPZOPnv73mIIf4U+axn9j6LsD2uF6PxqMs1CzJxMPzM+4LBgsRmlabsU8sJc6JqAOHUGRcXC5IN9mgXP1ofl9w1m+fjh8JMmdY2QP9XnRb8wkW33YEQJF2tA5sB662vnLYzstrh1cHO2MFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766052897; c=relaxed/simple;
	bh=D86Wr6iShEC6VMoBxfIknCOibuXQHlu+RVaMJ4V58Gc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qFSzLCjJH1av+upR//S06ByDzPPqeQOUsWhL7945Lhf8w7tuq+4t8NxqWi2iG2lN0aFdNgwbISoKm6QLlBe42fkLDkO7CR1fZ2pS5DSOIt1T6UMk9HfAdVy9zuUENsE66oRBtcFskwhLySQavdBM4otOYffGpkmc+aN1FYUkDyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n8gH9i3a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n8gH9i3a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766052896; x=1797588896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D86Wr6iShEC6VMoBxfIknCOibuXQHlu+RVaMJ4V58Gc=;
  b=n8gH9i3amwo3HFL5JMmdfHOsJ5ZRYG6QYuJyb6V/ZCwijy46wF0JRF0e
   Sq1yEnbz8lW0jpMJfz4GOCtl2f/8HV3AfayhXKpnkF3w+/K9tRjUm/p6a
   y30yN+ZDUW/o5N2UKUdJGVTVAYxqO9QJNjJFenfsCm1NwvrJfMiFHx+88
   p4CpCWZDZFOwW8KumxWMcckLXJatnfCUNOV966H21BJASE2CaLRgXCBSL
   3kz+9J92puW7dBDe9uHp32d1IuqSn503+eVCwclSOD5o3kQmMNkCQtxdH
   FcYVR4v5eHTe1GMaHfOF0FNnmGn7yD5qsJr4KkrhheIRVJt/j27Se+Q55
   Q==;
X-CSE-ConnectionGUID: 5uRGhhGuRhOT+a43o1iBWA==
X-CSE-MsgGUID: HXvgTtweSJyk6UWSThZ72w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="55578846"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="55578846"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 02:14:55 -0800
X-CSE-ConnectionGUID: wFGu6TdHRqm8VI9l/yzUCg==
X-CSE-MsgGUID: JPV3EzSlTXqHkb2W6VRk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="221954058"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Dec 2025 02:14:54 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWB23-000000001vt-3udD;
	Thu, 18 Dec 2025 10:14:51 +0000
Date: Thu, 18 Dec 2025 18:14:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-06 2/2]
 drivers/mmc/host/mmci.c:53:21: warning: 'fmax' defined but not used
Message-ID: <202512181800.FHmdi6Xa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-06
head:   9968d642dad11d8b20e29a3d250be16b57fd1dde
commit: 24f685a927c5a41df01d66069493bee40a5fb60e [2/2] UPSTREAM: block: add a rq_list type
config: arm-randconfig-003-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181800.FHmdi6Xa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181800.FHmdi6Xa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181800.FHmdi6Xa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   include/linux/compiler_types.h:84:22: note: in expansion of macro '___PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/compiler.h:166:37: note: in expansion of macro '__PASTE'
     166 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                                     ^~~~~~~
   include/linux/minmax.h:105:55: note: in expansion of macro '__UNIQUE_ID'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   include/linux/minmax.h:77:36: error: first argument to '__builtin_choose_expr' not a constant
      77 |   #define __signed_type(ux) typeof(__builtin_choose_expr(sizeof(ux)>4,1LL,1L))
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:516:23: note: in definition of macro '__compiletime_assert'
     516 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:536:9: note: in expansion of macro '_compiletime_assert'
     536 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:100:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:79:27: note: in expansion of macro 'statically_true'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                           ^~~~~~~~~~~~~~~
   include/linux/minmax.h:79:44: note: in expansion of macro '__signed_type'
      79 | #define __is_nonneg(x,ux) statically_true((__signed_type(ux))(x)>=0)
         |                                            ^~~~~~~~~~~~~
   include/linux/minmax.h:54:36: note: in expansion of macro '__is_nonneg'
      54 | #define __signed_type_use(x,ux) (2+__is_nonneg(x,ux))
         |                                    ^~~~~~~~~~~
   include/linux/minmax.h:57:9: note: in expansion of macro '__signed_type_use'
      57 |         __signed_type_use(x,ux):__unsigned_type_use(x,ux))
         |         ^~~~~~~~~~~~~~~~~
   include/linux/minmax.h:82:29: note: in expansion of macro '__sign_use'
      82 |         (__sign_use(x,ux) & __sign_use(y,uy))
         |                             ^~~~~~~~~~
   include/linux/minmax.h:100:27: note: in expansion of macro '__types_ok'
     100 |         BUILD_BUG_ON_MSG(!__types_ok(x,y,ux,uy),        \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:105:9: note: in expansion of macro '__careful_cmp_once'
     105 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:129:25: note: in expansion of macro '__careful_cmp'
     129 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/mmc/host/mmci.c:2333:40: note: in expansion of macro 'min'
    2333 |                                 fmax : min(host->mclk, fmax);
         |                                        ^~~
   drivers/mmc/host/mmci.c: At top level:
>> drivers/mmc/host/mmci.c:53:21: warning: 'fmax' defined but not used [-Wunused-variable]
      53 | static unsigned int fmax = 515633;
         |                     ^~~~


vim +/fmax +53 drivers/mmc/host/mmci.c

c3647fdc6a5a48 drivers/mmc/host/mmci.c Ludovic Barre  2018-10-08  52  
^1da177e4c3f41 drivers/mmc/mmci.c      Linus Torvalds 2005-04-16 @53  static unsigned int fmax = 515633;
^1da177e4c3f41 drivers/mmc/mmci.c      Linus Torvalds 2005-04-16  54  

:::::: The code at line 53 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
