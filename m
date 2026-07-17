Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B938C385D97
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784274220; cv=none; b=KwXhRD+gV9XGz9dl2IXe4Ihv9yWHie7LpzxU9SMRxecq3qFLyH6GrZiN6suBBlEIzIsVrCDWN74SMO3n5lNnJXJoNmBhDSZNOVfGzoq+c9r5SavFNl8Bbpl7XbhrV0589EOGSR3/BPsC2LEwrEkdcfYeXAMNsf94zFbcnXmgxRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784274220; c=relaxed/simple;
	bh=3QLoiat+2AGW/V4j8jzsUIEfRKsqEQGIRWBULL3M1Zw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oy4qkjUd9jEkKYAIZeXIeJyIHNiBweOgdG07EaAueV9kECylAfnc81JfPXVP2T4HAGTZI0JOMnb4tWMeOQReDjzl+dm8+pZF0j3uZGttfAloDx6Hy98RVTgzlKs0ExpACmqUyhqEZ4YCA/5jmLr/QzmthrjxrJFpcWvMdedI0pA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HhWdaw/T; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HhWdaw/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784274218; x=1815810218;
  h=date:from:to:cc:subject:message-id;
  bh=3QLoiat+2AGW/V4j8jzsUIEfRKsqEQGIRWBULL3M1Zw=;
  b=HhWdaw/TytM6mpT4FAPHPzcbsJ93W/XNi+hxb+QxFZuLh7rhM/xWpzNR
   iks62HfDwWeUtMUK13SSDbcokoCnZabCMSjT741+Cfh5Ebzm94EbIpAhF
   PCHi/VoUxnKl0W6CQwHwdEu/ClLVyvEneiNGeKf3PwOGxo94skgss4lGj
   DEoz+Vzmxz1qgdfufPoy44Kyr9wzbRIt2fWh/lFzzpBmf1VqN/LpIqHcy
   +Ww0wsw+/ZV5mZtnjgZ02s5NIN9lr1I7piyrrIOHELaBcFeSW5wa138UU
   Nk80B68KmJtEVsPcF7Ktzj3GLn/ZyZsATq2NZTD/gof6WYMzy9Rtq/1jI
   g==;
X-CSE-ConnectionGUID: Jb6S3u5eTJOUy6hvx4Ys0A==
X-CSE-MsgGUID: qiOPDf6RSkq21hl8lgHxLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="102494823"
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="102494823"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 00:43:37 -0700
X-CSE-ConnectionGUID: 3HGHzZbeSciufr/7G2ymsw==
X-CSE-MsgGUID: vd0zyechRSCpvw3SDEI/hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,168,1779174000"; 
   d="scan'208";a="250372232"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jul 2026 00:43:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkdEK-00000000SXo-1ivK;
	Fri, 17 Jul 2026 07:43:32 +0000
Date: Fri, 17 Jul 2026 15:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: Joanne Koong <joannelkoong@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Miklos Szeredi <mszeredi@redhat.com>,
 Jingbo Xu <jefflexu@linux.alibaba.com>,
 "Darrick J. Wong" <djwong@kernel.org>
Subject: include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_403' declared with attribute error: min(outarg.size,
 ((loff_t)(~0UL) << 12) - pos) signedness error
Message-ID: <202607171555.0VfEUIFx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Joanne,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
commit: 25307ca50b815c14a21f82fc5b10e8a621af32ad fuse: simplify logic in fuse_notify_store() and fuse_retrieve()
date:   5 months ago
config: parisc-randconfig-r051-20260717 (https://download.01.org/0day-ci/archive/20260717/202607171555.0VfEUIFx-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607171555.0VfEUIFx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 25307ca50b81 ("fuse: simplify logic in fuse_notify_store() and fuse_retrieve()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607171555.0VfEUIFx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/fuse/dev.c: In function 'fuse_notify_store':
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_403' declared with attribute error: min(outarg.size, ((loff_t)(~0UL) << 12) - pos) signedness error
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/fuse/dev.c:1790:15: note: in expansion of macro 'min'
    1790 |         num = min(outarg.size, MAX_LFS_FILESIZE - pos);
         |               ^~~


vim +/__compiletime_assert_403 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
