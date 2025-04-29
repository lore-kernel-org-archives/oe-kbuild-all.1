Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1436F1C3F0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889586; cv=none; b=e+lJFyBZD+wAiei8vdpwX7oByDez+mjqJxXx2hIaIyIIC1qIAXTtnsIJSoucA+NAgtsHUNWNsbKvWdPkD8ko/cJBvsXzu+3jgnS0ZR+LTeiY2bv1M2nIGmppHFBOjKTXEldvPYz4ChhE236H8MxDiWrHfdTeMv+svMOZ5b/OLNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889586; c=relaxed/simple;
	bh=O4uQeJVnANK3NwAg141Cl4zOzJqU1m3yImSasVp+EOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W1Epf+ItZK/hyuYSKGOAX+9st5jFAuvbSOi2mz2u+hE9FHoy+020Wp8S2/N8ykacn1xWx1Ntn6y2mPWN52hkXL6B7VZNodJM8lHexv5iXE7a/IIyXiXiZMGA+Mb882B7DG4qFOxteeBAe6tn6FSGGLkLiifCW3NaLrePPShG3LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=On0k/7T2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="On0k/7T2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889585; x=1777425585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O4uQeJVnANK3NwAg141Cl4zOzJqU1m3yImSasVp+EOc=;
  b=On0k/7T2GIYBPOn9VfEahIFz8JQJS7vXKT/vbhFDW9vs6kD4ImD2MdH6
   8w+APKwXsNAgxUU+CQzXFPDDulf13Z44duwuOoS7sOQJJqb6rmRiudGTr
   zg9ggq52TJQZi2WXn0CtO/zWT1SOQCum6/hs/zyzJ1itsjU5dvjRxPib+
   fPDH/wJ0kO3buSyDfSFJ+xolETrEL+4iX0IYWBBJ7lE4edQXDUlSvsK1G
   dytH8Mhj0pB4hHZeA1A11XeaC6ypHY5twm7iJc2jJYmcsCWbELnfhYetV
   CAKAojFO96FdTVvPaU7OiBwuuxRVHh+ugXsDStgD90VVjXlWVhXSJ+WDL
   Q==;
X-CSE-ConnectionGUID: IHWZylR/QBeuRJO0z2hjiQ==
X-CSE-MsgGUID: QflGpMnfTM+wQSCSZp5NEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51165288"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51165288"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: EN5jU2xbQVylLWIZAQPk0Q==
X-CSE-MsgGUID: KlrklbVGRzyUWTzghzRLuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164775825"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 28 Apr 2025 18:19:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9Zd9-00004c-0z;
	Tue, 29 Apr 2025 01:19:27 +0000
Date: Tue, 29 Apr 2025 08:39:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1] include/linux/kernel.h:843:29:
 warning: comparison of distinct pointer types lacks a cast
Message-ID: <202504290824.yJsXlKcJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 9dcff844c1cb7258bd9a6039d754566b9592d740 [1/1] clk: qcom: clk-rpmh: Fix overflow in BCM vote
config: arm64-randconfig-004-20250429 (https://download.01.org/0day-ci/archive/20250429/202504290824.yJsXlKcJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290824.yJsXlKcJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290824.yJsXlKcJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:9,
                    from include/linux/kobject.h:19,
                    from include/linux/of.h:17,
                    from include/linux/clk-provider.h:9,
                    from drivers/clk/qcom/clk-rpmh.c:6:
   drivers/clk/qcom/clk-rpmh.c: In function 'clk_rpmh_bcm_send_cmd':
>> include/linux/kernel.h:843:29: warning: comparison of distinct pointer types lacks a cast
     843 |   (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                             ^~
   include/linux/kernel.h:857:4: note: in expansion of macro '__typecheck'
     857 |   (__typecheck(x, y) && __no_side_effects(x, y))
         |    ^~~~~~~~~~~
   include/linux/kernel.h:867:24: note: in expansion of macro '__safe_cmp'
     867 |  __builtin_choose_expr(__safe_cmp(x, y), \
         |                        ^~~~~~~~~~
   include/linux/kernel.h:876:19: note: in expansion of macro '__careful_cmp'
     876 | #define min(x, y) __careful_cmp(x, y, <)
         |                   ^~~~~~~~~~~~~
   drivers/clk/qcom/clk-rpmh.c:273:14: note: in expansion of macro 'min'
     273 |  cmd_state = min(cmd_state, BCM_TCS_CMD_VOTE_MASK);
         |              ^~~


vim +843 include/linux/kernel.h

526211bc58c4b3 Ingo Molnar    2009-03-05  829  
^1da177e4c3f41 Linus Torvalds 2005-04-16  830  /*
3c8ba0d61d04ce Kees Cook      2018-03-30  831   * min()/max()/clamp() macros must accomplish three things:
3c8ba0d61d04ce Kees Cook      2018-03-30  832   *
3c8ba0d61d04ce Kees Cook      2018-03-30  833   * - avoid multiple evaluations of the arguments (so side-effects like
3c8ba0d61d04ce Kees Cook      2018-03-30  834   *   "x++" happen only once) when non-constant.
3c8ba0d61d04ce Kees Cook      2018-03-30  835   * - perform strict type-checking (to generate warnings instead of
3c8ba0d61d04ce Kees Cook      2018-03-30  836   *   nasty runtime surprises). See the "unnecessary" pointer comparison
3c8ba0d61d04ce Kees Cook      2018-03-30  837   *   in __typecheck().
3c8ba0d61d04ce Kees Cook      2018-03-30  838   * - retain result as a constant expressions when called with only
3c8ba0d61d04ce Kees Cook      2018-03-30  839   *   constant expressions (to avoid tripping VLA warnings in stack
3c8ba0d61d04ce Kees Cook      2018-03-30  840   *   allocation usage).
3c8ba0d61d04ce Kees Cook      2018-03-30  841   */
3c8ba0d61d04ce Kees Cook      2018-03-30  842  #define __typecheck(x, y) \
3c8ba0d61d04ce Kees Cook      2018-03-30 @843  		(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
3c8ba0d61d04ce Kees Cook      2018-03-30  844  

:::::: The code at line 843 was first introduced by commit
:::::: 3c8ba0d61d04ced9f8d9ff93977995a9e4e96e91 kernel.h: Retain constant expression output for max()/min()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
