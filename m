Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624DA33FE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Mar 2024 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710060187; cv=none; b=NCMi3OlDybMtWF0rj/NOcYMtJ8Oi8+YqFndVxT4fyNic+Ec31dCJouftslO5ri+jPETnMdBi9SlJAQegxK9iAjEJpptwk6UB/HCk2cWL6auA7AtVg3JVkMkeN7EZPkUPJvaGjhBXkCJbyg3CwAPH2UJu6AK0ZkafplK7MQEnAyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710060187; c=relaxed/simple;
	bh=T1zFwLpnZoUq7q1sdc+YYCGTo6GsXEevGQPBAyVFroE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzZXDCtsGKQ//ZHqww1b77gt0txPu0eOdTGO+D4fOpx74JeVY07Gwa95bRsg8upYzL7uVky3ViBCy8E4ouVyWSxvJnhfqGuHWMpuZLFddgEjugJMjruTR21g5XZOPTM7JYOHi3xQAwYFZMZ+836/s+RMLhDmXWcTc2jdI7sv0XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xc/XLmL0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xc/XLmL0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710060184; x=1741596184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T1zFwLpnZoUq7q1sdc+YYCGTo6GsXEevGQPBAyVFroE=;
  b=Xc/XLmL0zeIkL8PeG6GQppYCj9Il7c4abQUdEfrawB4WN1ZxIzEftmoY
   558ekPiuSEj++2nP7PivA9v+isheZ3za8Bmi1FOEesYhU54GqGCjrdSuH
   4wgSZ5lJmJbv3GfULo4DvrZCr/SNEH+T2c7/HXim5HSx9tCcFvS6uAf1W
   zgQagl1m6bLhfsDTvQsO8Cxt6L8mTAVXXSKbDJTiH2o5TOhNMkMq7QF0n
   r9xDsf0oetlfE7zXVI3Hhp9hxvja4hKxXGypsjcDCCpc3nZVpeaOPM4yv
   onpJISXhcGHVQnIxEs0m1EMFTqjys65e923z41SijGnOG1aqV58hqwXta
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="15466736"
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="15466736"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2024 00:43:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,114,1708416000"; 
   d="scan'208";a="10781508"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 10 Mar 2024 00:43:01 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjElm-000871-0u;
	Sun, 10 Mar 2024 08:42:58 +0000
Date: Sun, 10 Mar 2024 16:42:03 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: include/linux/compiler.h:417:45: error: call to
 '__compiletime_assert_147' declared with attribute error: BUILD_BUG failed
Message-ID: <202403101618.yRbLubnk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   e07182766e467ad9f34911579d25d705e0647e76
commit: bdf97d5c82aa99f1cfe187884d4151cbc962fbd4 Build report error when config IOASID disable
date:   8 months ago
config: x86_64-buildonly-randconfig-001-20240310 (https://download.01.org/0day-ci/archive/20240310/202403101618.yRbLubnk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403101618.yRbLubnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403101618.yRbLubnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/init.h:5,
                    from drivers/dma/idxd/dma.c:3:
   drivers/dma/idxd/dma.c: In function 'idxd_register_dma_device':
>> include/linux/compiler.h:417:45: error: call to '__compiletime_assert_147' declared with attribute error: BUILD_BUG failed
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


vim +/__compiletime_assert_147 +417 include/linux/compiler.h

^590eaf1fec755 Kaixu Xia     2021-03-16  403  
^590eaf1fec755 Kaixu Xia     2021-03-16  404  #define _compiletime_assert(condition, msg, prefix, suffix) \
^590eaf1fec755 Kaixu Xia     2021-03-16  405  	__compiletime_assert(condition, msg, prefix, suffix)
^590eaf1fec755 Kaixu Xia     2021-03-16  406  
^590eaf1fec755 Kaixu Xia     2021-03-16  407  /**
^590eaf1fec755 Kaixu Xia     2021-03-16  408   * compiletime_assert - break build and emit msg if condition is false
^590eaf1fec755 Kaixu Xia     2021-03-16  409   * @condition: a compile-time constant condition to check
^590eaf1fec755 Kaixu Xia     2021-03-16  410   * @msg:       a message to emit if condition is false
^590eaf1fec755 Kaixu Xia     2021-03-16  411   *
^590eaf1fec755 Kaixu Xia     2021-03-16  412   * In tradition of POSIX assert, this macro will break the build if the
^590eaf1fec755 Kaixu Xia     2021-03-16  413   * supplied condition is *false*, emitting the supplied error message if the
^590eaf1fec755 Kaixu Xia     2021-03-16  414   * compiler has support to do so.
^590eaf1fec755 Kaixu Xia     2021-03-16  415   */
^590eaf1fec755 Kaixu Xia     2021-03-16  416  #define compiletime_assert(condition, msg) \
b45caaf67608c8 Vegard Nossum 2020-04-06 @417  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
^590eaf1fec755 Kaixu Xia     2021-03-16  418  

:::::: The code at line 417 was first introduced by commit
:::::: b45caaf67608c86d9a4e586a8a99919220a9c8c8 compiler.h: fix error in BUILD_BUG_ON() reporting

:::::: TO: Vegard Nossum <vegard.nossum@oracle.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
