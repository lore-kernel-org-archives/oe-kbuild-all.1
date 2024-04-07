Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EAD39AC4
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Apr 2024 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712498113; cv=none; b=kKp0/7qMCDEFM5KJtRlu/YQ3ozRiVcZBpMayhGFSNcE7BlzeIh9ymwgwa8NB03I6QMxF7Ily+/lqCzdT548JuvVqR9sHmpMHcJoa5/wuHNPVF7g7ONReXnyWZ2TCMJyLJkuk7pg9XF+K1NZm32gI09KUAAlnjJllPGaNFM4/i2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712498113; c=relaxed/simple;
	bh=888uh1bwRSf18AZDAo3aKr7KkxhTamJG75bi1SMo3X4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kIcdfi3STMM0OpwbHdCekUQM5qAFvr/duY/cwKHBokR9gOKFJMgXkywQyxmFFTR6bQDtJ3ZFBjgrlK3h+uorfwzbhGw1z8wipEPd7LjCffONtC2GbZjJItzH47WH2sYQyjKhlQP14ZG3udVt2mV8snsXvZrRrq8NfPt33pK0mVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E0PCYMw/; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E0PCYMw/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712498112; x=1744034112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=888uh1bwRSf18AZDAo3aKr7KkxhTamJG75bi1SMo3X4=;
  b=E0PCYMw/rMROV8KIKFE9fKlDjahV1UhGXPrA0xz6sexXKF8Wj/u9ffZb
   CUjR3ROvDRKKWSTwu2i8O41WD0IKYZdiTpe6bu0pSprlhWSneeUpvY+nu
   G03GJ7mAwWzJGmA/AoTvac64vB09G1ZOuK6wKXf82Li/bJ7Hm1Ie2ElPI
   ul3BFiS/VJJJYXFi/g96+EpN7oH35fMlo1Ui80Hf9r1YVPWDqblSmDC54
   fjAlq8L/69/rnwlrnqvVbMQcXFZmSo5TZHhu4PiCZXwXLt/wS0nAwOImu
   rXBtgNi6wlzEwcn768HXWYhcqvrOq0gWL1YmXC1G0bUpcsTknNe1/itVf
   A==;
X-CSE-ConnectionGUID: DuDtgW3OS/KbRl2KUmgL9g==
X-CSE-MsgGUID: uvhc4vguSc+/gDksUkQuqA==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7683912"
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="7683912"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2024 06:55:11 -0700
X-CSE-ConnectionGUID: Mf4YHTh2TSSAHxAVT0J5ug==
X-CSE-MsgGUID: U5wXGk/TTOyvb5oiuPZodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,185,1708416000"; 
   d="scan'208";a="57097428"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Apr 2024 06:55:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtSzE-0004OQ-04;
	Sun, 07 Apr 2024 13:55:08 +0000
Date: Sun, 7 Apr 2024 21:54:36 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:358:45: error: call to
 '__compiletime_assert_969' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(struct ieee80211_rx_status) > sizeof(skb->cb)
Message-ID: <202404072115.AWjHM1sP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Johannes,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2f80ac809875855ac843f9e5e7480604b5cbff5
commit: f66c48af7a110c0d694c4ac4a1257affb272a2ea mac80211: support minimal EHT rate reporting on RX
date:   1 year, 3 months ago
config: arm-randconfig-r132-20240407 (https://download.01.org/0day-ci/archive/20240407/202404072115.AWjHM1sP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240407/202404072115.AWjHM1sP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404072115.AWjHM1sP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   net/mac80211/rx.c: In function 'ieee80211_rx_irqsafe':
>> include/linux/compiler_types.h:358:45: error: call to '__compiletime_assert_969' declared with attribute error: BUILD_BUG_ON failed: sizeof(struct ieee80211_rx_status) > sizeof(skb->cb)
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:339:25: note: in definition of macro '__compiletime_assert'
     339 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   net/mac80211/rx.c:5283:9: note: in expansion of macro 'BUILD_BUG_ON'
    5283 |         BUILD_BUG_ON(sizeof(struct ieee80211_rx_status) > sizeof(skb->cb));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_969 +358 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  344  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  345  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  346  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  347  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  348  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  349   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  350   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  351   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  352   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  353   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  354   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  355   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  356   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  357  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @358  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  359  

:::::: The code at line 358 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
