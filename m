Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BC519AD85
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727459442; cv=none; b=iNsFP26MVTbAHssqLnUB4gl8j3gm0o4nlu8VKHOXPKDSKOG9vSkz0DMMU9S35lgz9VIONEb/cQmYloN4UPVghM9iRMzIVeZ+9CoSRcNgJSORbxjnGKEvhv3fVwJpHtvsIcGkH5ndKs+yRfm1gvgMVkEnFT1FU74Hf+sC6LuMas8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727459442; c=relaxed/simple;
	bh=nTxZ/PYjDffAeNozv7/RTvihY4OwB2WRej0sK1UdwgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S4n4WBW/sS1RqNw7X6OGt32mx28AaW9n6qC8XvaxR+AQzYMC1pyFCO4lx2hOIY9a0CO8tYO4WQFx0ASUrwR0uV6L2cnsWzQvA6c3TXaXljU5sJp3zy/mCMy9vuFMLs5emd4qJsS6ocvAdvcb5w7ZBSoUe+qPEKPuNKdTqfLgJKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjHE2tdM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjHE2tdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727459440; x=1758995440;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nTxZ/PYjDffAeNozv7/RTvihY4OwB2WRej0sK1UdwgE=;
  b=UjHE2tdMyC+PjOc82UeIAU0olilHksjroq4ewAmZIzH59HEeGnVu2aEz
   4KA1v/blOEnzyCcfeD1mir7zRINFcUxyL5+H6HAB2mHvDWsoUv75PjRK7
   GqXBSUKnelzouZOSGrxzHz4j1jhUyNAUxyP0Su6+Pm9TtX/IUQ28nUZ+j
   AkroVZHv9B2YlUn/FZMKD7rRcq0WZ1Krqnhaedi0HRIc4XNFtvqTn5Fv/
   zaSkSNkS1c+bjWlNSpKOWHpORBdP2KaWp2jlc0dT8O2Csah4LLQS57bUp
   t316ykM6BOVrAZ/+5uSNwo3v9LY7w7SSYtHkq+O8PHNeKfuEAefM+W5wJ
   w==;
X-CSE-ConnectionGUID: b7OZ2UpyTzSrEir6Gir3kA==
X-CSE-MsgGUID: 3Jj54pKPS/+sA547Bl8uWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="52027522"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="52027522"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 10:50:39 -0700
X-CSE-ConnectionGUID: PdSU4k9wSmGflF5SAPNI4Q==
X-CSE-MsgGUID: A1Fbzq9EQdarbOxwZWf67g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="110097375"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Sep 2024 10:50:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suF6v-000MRa-1W;
	Fri, 27 Sep 2024 17:50:33 +0000
Date: Sat, 28 Sep 2024 01:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 2211/2444]
 include/linux/compiler.h:417:45: error: call to '__compiletime_assert_160'
 declared with attribute error: BUILD_BUG failed
Message-ID: <202409280130.74xxlJ1x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   aabcc6dc6d7f9e12baf1f117341469c84afd545d
commit: 7ed14911c89112b6b74bc41a23e143e1699c53ee [2211/2444] Build report error when config IOASID disable
config: x86_64-randconfig-075-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280130.74xxlJ1x-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280130.74xxlJ1x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280130.74xxlJ1x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/dma/idxd/dma.c:5:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/init.h:5,
                    from drivers/dma/idxd/dma.c:3:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
   drivers/dma/idxd/dma.c: In function 'idxd_register_dma_device':
>> include/linux/compiler.h:417:45: error: call to '__compiletime_assert_160' declared with attribute error: BUILD_BUG failed
     417 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler.h:398:25: note: in definition of macro '__compiletime_assert'
     398 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler.h:417:9: note: in expansion of macro '_compiletime_assert'
     417 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      59 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:287:27: note: in expansion of macro 'BUILD_BUG'
     287 | #define HPAGE_PMD_SIZE ({ BUILD_BUG(); 0; })
         |                           ^~~~~~~~~
   drivers/dma/idxd/dma.c:394:48: note: in expansion of macro 'HPAGE_PMD_SIZE'
     394 |         idxd_dma->dma_parms.max_segment_size = HPAGE_PMD_SIZE;
         |                                                ^~~~~~~~~~~~~~


vim +/__compiletime_assert_160 +417 include/linux/compiler.h

9a8ab1c39970a4 Daniel Santos 2013-02-21  403  
9a8ab1c39970a4 Daniel Santos 2013-02-21  404  #define _compiletime_assert(condition, msg, prefix, suffix) \
9a8ab1c39970a4 Daniel Santos 2013-02-21  405  	__compiletime_assert(condition, msg, prefix, suffix)
9a8ab1c39970a4 Daniel Santos 2013-02-21  406  
9a8ab1c39970a4 Daniel Santos 2013-02-21  407  /**
9a8ab1c39970a4 Daniel Santos 2013-02-21  408   * compiletime_assert - break build and emit msg if condition is false
9a8ab1c39970a4 Daniel Santos 2013-02-21  409   * @condition: a compile-time constant condition to check
9a8ab1c39970a4 Daniel Santos 2013-02-21  410   * @msg:       a message to emit if condition is false
9a8ab1c39970a4 Daniel Santos 2013-02-21  411   *
9a8ab1c39970a4 Daniel Santos 2013-02-21  412   * In tradition of POSIX assert, this macro will break the build if the
9a8ab1c39970a4 Daniel Santos 2013-02-21  413   * supplied condition is *false*, emitting the supplied error message if the
9a8ab1c39970a4 Daniel Santos 2013-02-21  414   * compiler has support to do so.
9a8ab1c39970a4 Daniel Santos 2013-02-21  415   */
9a8ab1c39970a4 Daniel Santos 2013-02-21  416  #define compiletime_assert(condition, msg) \
c62d6b571d573c Jianping Liu  2024-06-11 @417  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
9a8ab1c39970a4 Daniel Santos 2013-02-21  418  

:::::: The code at line 417 was first introduced by commit
:::::: c62d6b571d573c73ac756831dea55ebcb7921dd1 ock: sync codes to ock 5.4.119-20.0009.21

:::::: TO: Jianping Liu <frankjpliu@tencent.com>
:::::: CC: Jianping Liu <frankjpliu@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
