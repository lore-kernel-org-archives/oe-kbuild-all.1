Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F93C26AC3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 00:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779582185; cv=none; b=dIsvC8AJYpEKGSDe9XONWcZjAsHrRKLwHDD7bwyBbfdItGoQP12NokUkFdXIYv14eQAO0B39VCb2zIahfoKIWk4JYbuBWHCaI0+JtLuQOf6fBvliMgqrEZo2p++r3ZsotSsG+Webhuxx146OEkDEhAMouphFHgfdq7Wk/f9Zylg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779582185; c=relaxed/simple;
	bh=XUJ0pnOHDdx21dAKFvEj1PgMzQDUi4MFH0tx08s0Guo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V77vsiPsLAxXv54vYYU6Vz2+cX1sUohvw7v6ArMEadaKOtMlr12WqtCx7vX+1MzdCMBH0jnxFA/OTiTyMdErRNe9nZu001hmWZxejf0p7dD/vaT1plBrQcdhM4zdUv5iaZmt+e7FBY8ru4BTJ2PTY3FbIhRyxw9qd5OhWNNXkQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYEQL6XF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYEQL6XF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779582183; x=1811118183;
  h=date:from:to:cc:subject:message-id;
  bh=XUJ0pnOHDdx21dAKFvEj1PgMzQDUi4MFH0tx08s0Guo=;
  b=fYEQL6XFd40NN6CwL2w72CwFIV2boCF0qfpl/1mxTG0P20vDSBR4FyVA
   1rpoP9/Ju52/euqI36R5Pkfdv4E+h7msDj/oAFnoyTRzJkcTQoL5RPxvM
   MSIGAc5xHlqF6QFsdiRldoYvdkFI3J3j2I9YlaRerBaP5bn75+ASPTVf9
   //Pz/+nu2gvyD2p2zmaf/GiHtjFWHutVTNe5091xhFUn2oUa4wsS4y4A+
   7Z56zIKtHulwsya7BS9KJeqIaxlAerDBxYtUrtA6llWE3Eh35aulYbY4O
   w0ACgrXAGxKoD2Wjc5dgDQhM59zKvpMcuKeLEyV19lwf3zOqWmGYv0out
   w==;
X-CSE-ConnectionGUID: YHcyQNVURW2S63HpUe+fbg==
X-CSE-MsgGUID: iDeRwWebTwe5HNLopADD3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="67985097"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="67985097"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 17:23:03 -0700
X-CSE-ConnectionGUID: jcI4ipupTUe0H0lly7C+eQ==
X-CSE-MsgGUID: Ag0U97LNTymix0fu8jW3ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="240415828"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 May 2026 17:23:01 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQwcM-000000000TN-2sEX;
	Sun, 24 May 2026 00:22:58 +0000
Date: Sun, 24 May 2026 08:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 235/235]
 include/linux/compiler_types.h:309:45: error: call to
 '__compiletime_assert_432' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Message-ID: <202605240823.61BKi5P0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   8c66939857f7c1785dcf957b4374265db31c6af5
commit: 530278140b21c18bf53392ce59ee2f46b094286b [235/235] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: i386-randconfig-012-20260524 (https://download.01.org/0day-ci/archive/20260524/202605240823.61BKi5P0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605240823.61BKi5P0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605240823.61BKi5P0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_panel.c: In function 'scale':
>> include/linux/compiler_types.h:309:45: error: call to '__compiletime_assert_432' declared with attribute error: clamp() low limit source_min greater than high limit source_max
     309 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:290:25: note: in definition of macro '__compiletime_assert'
     290 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:309:9: note: in expansion of macro '_compiletime_assert'
     309 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:109:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     109 |         BUILD_BUG_ON_MSG(statically_true(ulo > uhi),                            \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:116:9: note: in expansion of macro '__clamp_once'
     116 |         __clamp_once(val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_), __UNIQUE_ID(h_))
         |         ^~~~~~~~~~~~
   include/linux/minmax.h:192:28: note: in expansion of macro '__careful_clamp'
     192 | #define clamp(val, lo, hi) __careful_clamp(val, lo, hi)
         |                            ^~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_panel.c:479:22: note: in expansion of macro 'clamp'
     479 |         source_val = clamp(source_val, source_min, source_max);
         |                      ^~~~~


vim +/__compiletime_assert_432 +309 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  295  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  296  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  297  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  298  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  299  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  300   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  301   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  302   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  303   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  304   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  305   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  306   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  307   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  308  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @309  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  310  

:::::: The code at line 309 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
