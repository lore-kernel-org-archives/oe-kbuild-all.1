Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C170E32E135
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766418441; cv=none; b=TXhHE60CzmWnzC8HUrfFRKeGdfX6GEk/tJ4WoWO0iB/M/JHP7Y/UFonVQakWrc/SuJIPr6T5OL4ldutRZjrhTPylzD1aydNxaD+xjW/Dv9GCDF2U+pBHVxP6UwLCwv8QKawvHVorzVY0abQhaGOBa/bq20NF3woS1aT3VzF/Ymw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766418441; c=relaxed/simple;
	bh=VqRmP8UuWnLD91+Ybwaowc9kn0E7+fKcDEjSYt8UVYQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=itqy1Q9h4MK9vNkdsf1/81kqiedwll3rg0yv/MJoV7/MtZt065lxjl4iobLOvAFBRikGpFidlddNzSlcIodJnNz2nV1M7fWDy9Hdy+Co3pydP4K+STZLtn5dgqACRhIf+RBBDjqtsv2Sv6NnDC2IrslQbFVxBPUo3cPFFJZ29kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ex5AMoSJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ex5AMoSJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766418440; x=1797954440;
  h=date:from:to:cc:subject:message-id;
  bh=VqRmP8UuWnLD91+Ybwaowc9kn0E7+fKcDEjSYt8UVYQ=;
  b=Ex5AMoSJ2omw3KVekvz2c9IwD/WkJXSLgpKLI0M3xyqgSGkCI2xORfBZ
   KOQ75+0wcYExN03RwhRci0NUAXQYhuw6U49ODeUYlo/jqVLkxYjGm8YxA
   LtRZF/ZRPYC987C6ZLul66DArgQ3KIEVsmgGeggl+WMhGxeW7PXjpPl+C
   IAOcRzHlVR/V/2v/svZ3/d4Pfm9WaPEk3tjQzxcjrv+UoMI8Pn9hKUrEL
   Zonl9jdbDmPcD27PMIwwnpTwqFNH5JMfYhA4zjie2/ha0gOw2mJy7140M
   HRWx7ohDhVSaF07dMfILOTkcPo5NRbYsW1HO2p4PIiPicHQU6q80t4GSa
   g==;
X-CSE-ConnectionGUID: iFRx1DezQZ6gQ8ClLmwJLA==
X-CSE-MsgGUID: /lj+R+4nT0S5JM83rEJDCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="90934111"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="90934111"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:47:19 -0800
X-CSE-ConnectionGUID: dSWovKtcSZKc5fkL2wbtIA==
X-CSE-MsgGUID: rO1atQ0KR2eNI1stBorWiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199856896"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 22 Dec 2025 07:47:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXi7v-000000000lr-1LRu;
	Mon, 22 Dec 2025 15:47:15 +0000
Date: Mon, 22 Dec 2025 23:46:48 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_483' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202512222321.TeY4VbvK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9448598b22c50c8a5bb77a9103e2d49f134c9578
commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
date:   8 weeks ago
config: arc-randconfig-r053-20251222 (https://download.01.org/0day-ci/archive/20251222/202512222321.TeY4VbvK-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512222321.TeY4VbvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512222321.TeY4VbvK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.0':
>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_483' declared with attribute error: FIELD_PREP: value too large for the field
     597 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:578:4: note: in definition of macro '__compiletime_assert'
     578 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:597:2: note: in expansion of macro '_compiletime_assert'
     597 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      68 |   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
         |   ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
     115 |   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
         |   ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h:259:29: note: in expansion of macro 'FIELD_PREP'
     259 | #define VCLKSET_DIV_V4H(n)  FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
         |                             ^~~~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
     660 |   vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
         |              ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_483 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  598  

:::::: The code at line 597 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
