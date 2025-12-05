Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A365A2F5A13
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 10:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764929871; cv=none; b=TEsvVdhNqp5H5o64SI3F8WLxNuWWgkQ+fNJp711suel4CiwaTxLhElVXV82mN9LZRI1B5q9dPC0DUjrskOmDVI9WIBTGZ/9KDoVurTPHdG3siex9hW5qoHsOyYtuBPbsUPh+0VhPcR+Fhdk1Lgzo3FZdrxRSDHDqWZ6G6kwL4qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764929871; c=relaxed/simple;
	bh=kpOQrmyZ6IL5vC7nd8bA7fD2WKQnoulaQQ/edM4PgE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ThTeJdmmw4L7z8eZZVm56zI6XCSFbsCPSWaipXRgapQa2BTaPgt+ztHL0jsLJngKIbNLHGdcRKARTECBrBgEBdCv/H0c4o9pgd4IlFniRAZ+/lltcKPLVdzj6x6zxLwNzAxWBPAWyiCGwFA71pzcelJhDvQqGShujsMqeH+qtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UC5ruJaF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UC5ruJaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764929867; x=1796465867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpOQrmyZ6IL5vC7nd8bA7fD2WKQnoulaQQ/edM4PgE8=;
  b=UC5ruJaFKKOA5pUBiMeFvc5O4cV+SZjiSHaIVZAFLBA6yXV7n+9tkfty
   2qyYy6eUK9ozYmewR6ere2Qn1ojSx4FHsWsKFZfen1X9bizw2U6GluYGS
   LDv/8pq3IJZQuD455fu8WyfbFYoIUHthL+ieAyw1A1CU7ElxuAq3fIg7l
   sX78EY3hd/cFaG6hCqb5EvJ5yKZGg8+ZB/xmn1mxvuXkf7uXkHAUgACCR
   xKaWiTAAQmmN8HwqyeuYu6h/NwD4CYIDWcCJrCggzFi+YkhgEZF6uUFjJ
   kGbExnAoBXWVvTGWm0Drx6E/N9j2HqOXbtSWlvll+i/5CHg3AxdGTkxzd
   g==;
X-CSE-ConnectionGUID: cWxv61QsTBSiw+7HoeGvow==
X-CSE-MsgGUID: u7l3xqqhSYKKsjPkO6PfpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="89612731"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="89612731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 02:17:41 -0800
X-CSE-ConnectionGUID: DYtaqCUhRNuO8olgEbIfkA==
X-CSE-MsgGUID: fv9GcycySLG3zX8Kt6/xjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195080090"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 05 Dec 2025 02:17:39 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRSsb-00000000Ert-0JvH;
	Fri, 05 Dec 2025 10:17:37 +0000
Date: Fri, 5 Dec 2025 18:16:52 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: include/linux/compiler_types.h:597:38: error: call to
 '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202512051834.bESvhDiG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2061f18ad76ecaddf8ed17df81b8611ea88dbddd
commit: 4f716a1db661cfb31502a0a6d7e62c06daf2e603 drm/rcar-du: dsi: Convert register bitfields to GENMASK() macro
date:   5 weeks ago
config: arc-randconfig-001-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051834.bESvhDiG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051834.bESvhDiG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.4':
>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value too large for the field
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
--
   In file included from <command-line>:
   rcar_mipi_dsi.c: In function 'rcar_mipi_dsi_startup.isra.4':
>> include/linux/compiler_types.h:597:38: error: call to '__compiletime_assert_437' declared with attribute error: FIELD_PREP: value too large for the field
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
   rcar_mipi_dsi_regs.h:259:29: note: in expansion of macro 'FIELD_PREP'
    #define VCLKSET_DIV_V4H(n)  FIELD_PREP(VCLKSET_DIV_V4H_MASK, (n))
                                ^~~~~~~~~~
   rcar_mipi_dsi.c:660:14: note: in expansion of macro 'VCLKSET_DIV_V4H'
      vclkset |= VCLKSET_DIV_V4H(__ffs(setup_info.vclk_divider) - 1);
                 ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_437 +597 include/linux/compiler_types.h

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
