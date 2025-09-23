Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644A42874F5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758628101; cv=none; b=LBhUm5OKftW20QyYNtSwqVEVrS7txzvX4TxEr7P3i40mFjVikIxhK9DnkVnohbvFP0YkxO5dizGCDhho49gPbFicvHyfhnRPJS6LjZu+guubzqowmTUSYSupkOdqH3pfluo2BQU+0D0VuicjdJUOHho1lZWuC6NvL9zYrCbnBKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758628101; c=relaxed/simple;
	bh=dOxWcHTtCYDd2+p9m22VhOdG2v3YNQg8h6gVGnovHJU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j4Re/OYPjFUGI5ZQ6g4EP22CsENiUAeQwq0xj710dnzR/2hvVs12Z80AqZiLCzFtdNnmimi0HBtzOUQ2KeZcGaujY/5fUEpL7UvSU1vL58vJiGcu4Qmqtk+gwE1O2kbvORlJ//EUpOwdSwoP09r5lLD2lrDRm6Gm+fV71AHAibQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QgdNRlu2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QgdNRlu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628099; x=1790164099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dOxWcHTtCYDd2+p9m22VhOdG2v3YNQg8h6gVGnovHJU=;
  b=QgdNRlu2qPrYg0L9GwyXVmYQUAsOR2eTUYNVO+W6XxIiJd2pHoH/9zab
   2jOkSbJlo7E2ZK113EA3Qq/ZYC5XOU2oRgEfIbLDrUjuz3G6rh4+pQIlv
   2xEf3u7NDPJdOHVJhpG8d7AYl8foer4pRrWcN+v/7UWbcsRy0olPz3Sgu
   Qr5i8be7Hp3toazTknUfOvMDNpvDytWtQIA5d3AEvu5VAIUSwk2odHry7
   ojkedOKKMPO11UWTA/wnpIgQEOEzw4SSV3XoSdbe2mTRuSJYf9KRCsChA
   2oLGrmXLl6UnMuZdX01M73oaOIQd3NTEWV+VLSIhQf/VG299zqAENoQHP
   g==;
X-CSE-ConnectionGUID: jC0M5OKCRw26Yu/xztdRNg==
X-CSE-MsgGUID: IDURk/UuRW62P3F1e5ZtdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="78344826"
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="78344826"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:48:17 -0700
X-CSE-ConnectionGUID: ZG/L75aIRGG2GGiNka42fQ==
X-CSE-MsgGUID: rw0CZU6sSt2eZRFVHT7w/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="176828495"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 23 Sep 2025 04:48:16 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v11VG-00034v-0U;
	Tue, 23 Sep 2025 11:48:14 +0000
Date: Tue, 23 Sep 2025 19:47:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3207/3207]
 include/linux/compiler_types.h:323:38: error: call to
 '__compiletime_assert_183' declared with attribute error: BUILD_BUG failed
Message-ID: <202509231925.VzrKhKii-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   3838d60c6f0bda86f712fbcee935bfb42e07b8bb
commit: 611b93b7366a1e0c9df51c4628ea51bfe6db74d9 [3207/3207] clocksource/arm_arch_timer: Add build-time guards for unhandled register accesses
config: arm64-randconfig-003-20250923 (https://download.01.org/0day-ci/archive/20250923/202509231925.VzrKhKii-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231925.VzrKhKii-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231925.VzrKhKii-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:0:0:
   In function 'arch_timer_reg_read_cp15',
       inlined from 'erratum_set_next_event_tval_generic' at drivers/clocksource/arm_arch_timer.c:157:7:
>> include/linux/compiler_types.h:323:38: error: call to '__compiletime_assert_183' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:304:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/arch_timer.h:159:2: note: in expansion of macro 'BUILD_BUG'
     BUILD_BUG();
     ^~~~~~~~~
   In function 'arch_timer_reg_write_cp15',
       inlined from 'erratum_set_next_event_tval_generic' at drivers/clocksource/arm_arch_timer.c:122:3:
   include/linux/compiler_types.h:323:38: error: call to '__compiletime_assert_180' declared with attribute error: BUILD_BUG failed
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:304:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:323:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:59:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
    #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                        ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/arch_timer.h:130:3: note: in expansion of macro 'BUILD_BUG'
      BUILD_BUG();
      ^~~~~~~~~


vim +/__compiletime_assert_183 +323 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  309  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  310  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  311  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  312  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  313  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  314   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  315   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  316   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  317   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  318   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  319   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  320   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  321   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  322  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @323  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  324  

:::::: The code at line 323 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
