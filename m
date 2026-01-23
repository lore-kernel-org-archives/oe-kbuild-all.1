Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD41031A045
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 00:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769129918; cv=none; b=ddj1/yXyrPg9CSBEciiskIeL2WtwT/wRbMAaFOPYyE/uRvkeQ5LsRsIOjVHLxG8nsx8mGUOjkgLElhD4FkKwrBUGP26d/wNIj79IaDLnbuWPjPzvn6xNL+RIBmDVDfkM52eU0lQS2JkgWuzTd8iTth9WADElweECTf8WbQHAT0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769129918; c=relaxed/simple;
	bh=t1H3GzkTYkZOaN4mgNjiFniqVfyDevFqLR/FsAAoJCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mzQavskt8YAJYxmDkFujswum+DZV+1O0+MIoBNiwizy+lQZ+S5ZcFCHfPUzFtS9+hqXJxXm1HdD9pdkvtdpw/4twtAxovFiAfzBiLi3+oMp+8RR5wBV/7rVHYgscKH0S/bDw2uz1ybmHPh0Ymc7vmxrRdBr215Z6avVhZvMJlvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4KLwBpJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4KLwBpJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769129913; x=1800665913;
  h=date:from:to:cc:subject:message-id;
  bh=t1H3GzkTYkZOaN4mgNjiFniqVfyDevFqLR/FsAAoJCM=;
  b=J4KLwBpJJZ2n/e9FtT0u6ZRQ8M5hIvlbB+qXVd6X0OKaMqs5dpbkjc5g
   ZPQ4wq0lXveU7xOmfcIz0EqllXG36WcEphLi58X3iBK3j7pqzZSMwI4Fs
   2SlE03vj1SIsInWYSp+U9qKKmuq9r//cAzIBI97QJtSdZlqvw8pertY3B
   tTC6NpaZq0AiUQETB/12KnEqivTvIEQcbWb9bDnmA3poUa/+axXr2sui/
   4SPFJNAijiHW5un0USLRFhQbqrSW1o+H7b31bu1xRr8KziCauoLC5Wz4g
   js2ijTioVFSZlpJx4qH42ggOpAJkUZ9UNBhYsUZYGQk5bzAXC1orExKs9
   A==;
X-CSE-ConnectionGUID: zwltNR3hQQGk1TfiBHD9Dw==
X-CSE-MsgGUID: YLm5CL4jTOmTcNPk8nl95A==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="70103542"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="70103542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 16:58:28 -0800
X-CSE-ConnectionGUID: RM8R3nepTJGcC7ZsTjtX6g==
X-CSE-MsgGUID: R5+jCUe+SGm5LUHmbD7Y6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="206935541"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jan 2026 16:58:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vj5VH-00000000TNS-3UVc;
	Fri, 23 Jan 2026 00:58:23 +0000
Date: Fri, 23 Jan 2026 08:58:22 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_495' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202601230809.FBjF6OrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Marek,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a66191c590b3b58eaff05d2277971f854772bd5b
commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
date:   3 months ago
config: arc-randconfig-r053-20260123 (https://download.01.org/0day-ci/archive/20260123/202601230809.FBjF6OrH-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230809.FBjF6OrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601230809.FBjF6OrH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.6':
>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_495' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:578:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:597:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi_regs.h:259:29: note: in expansion of macro 'FIELD_PREP'
    #define VCLKSET_DIV_V4H(n)  FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
                                ^~~~~~~~~~
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
      vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
                 ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_495 +597 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  583  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  584  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  585  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  586  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  587  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  588   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  589   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  590   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  591   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  592   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  593   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  594   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  595   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  596  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @597  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  598  

:::::: The code at line 597 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
