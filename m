Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C473A19340A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Sep 2024 08:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726389463; cv=none; b=rTmQmxIQ8KDaymetOSaxCZY6m9iWxzICDdV+/ORGJD/CNcPdPQV/2sN9BpP+QVFSPrKiIBGzBoaGHXSmeNfrCzRXkXBPzMa+ebvFIYQMfdU+5gsb5XH7bNGRrYRSm3ckgUbDH+jAdw0uYK+UgzNPe7OTfNem/IG1jeP3WYj6u7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726389463; c=relaxed/simple;
	bh=FthG0Sk1hY2hbKD/1wblTWyxSHYnMENGGPBLfDbEyzo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p9Ef0VdAGN572EkB7JbFfAANb2BUPjsYhjBr0uu59VFyoebTkDhGxFEil+EGnLClPt75DyD1FUmRy0HKPr+2s4IUq6EEBm7J0WVyUrwKIt6gSQIySQONf8yKs2fhcCkeHOYecJwaNDzhTgLWXE5Q2v7V6qbFE83K/74KJbyMm4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mlv0Upxc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mlv0Upxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726389462; x=1757925462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FthG0Sk1hY2hbKD/1wblTWyxSHYnMENGGPBLfDbEyzo=;
  b=Mlv0Upxc6lVs8dvwnZjDEUyXrOqxh15jXYVCIyeKosZ7Gs2l4++SwcTx
   T93smDAXA+2VdCguamXKMdk9KjPZF0co0NrhfQYZSFmld+2hXMGnDXqh+
   frahVA5N+W84ldjiApZMtM5EIdimTkksTT/IvGOYmDmhASU5r0vmDfGJ6
   HX+1IXnfu2976ljk0jBJsOc3Wq3YsyvgpGKdonUyJqTSmHzYMWVY2gakF
   hvlQLWPK91nDnUY7D51uritXzXK/HFCXaOMnxh7uwPNQ39DsdRfkCFnsk
   4OxVA8cPm9B6wJpc8SF0R/SYqQYH4KhxSSwApGEnfX2RZxy2wm8C7uB7+
   Q==;
X-CSE-ConnectionGUID: nOJAqXR6QTS1Id7gierplw==
X-CSE-MsgGUID: ulMV9APURtm7+6dqAX26Ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11195"; a="47757485"
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="47757485"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 01:37:39 -0700
X-CSE-ConnectionGUID: SNuNZdr3Siyhnlvj+Bgx2w==
X-CSE-MsgGUID: xt5oEU7/RGu02eYY0RUnQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,230,1719903600"; 
   d="scan'208";a="69348278"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 Sep 2024 01:37:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spklC-0008X4-30;
	Sun, 15 Sep 2024 08:37:34 +0000
Date: Sun, 15 Sep 2024 16:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@uclinux.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:armnommu 3/3] include/linux/compiler_types.h:510:45:
 error: call to '__compiletime_assert_311' declared with attribute error:
 BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
Message-ID: <202409151608.3NlECWXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   efa144551cae4460d9824939792ec9d8e88c25ff
commit: efa144551cae4460d9824939792ec9d8e88c25ff [3/3] ARM: versatile: support configuring versatile machine for no-MMU
config: arm-randconfig-r112-20240915 (https://download.01.org/0day-ci/archive/20240915/202409151608.3NlECWXO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240915/202409151608.3NlECWXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409151608.3NlECWXO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/staging/media/rkvdec/rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_311' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/staging/media/rkvdec/rkvdec-vp9.c:1010:9: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |         BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |         ^~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> arch/arm/mach-versatile/versatile.c:89:23: sparse: sparse: symbol 'versatile_auxdata_lookup' was not declared. Should it be static?

vim +/__compiletime_assert_311 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
