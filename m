Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B403E835E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 07:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605843; cv=none; b=IdyhlofGDJLoIURkDr9JTvVAmj+y8SzpxgTG+n2r3ROEejN6NQ9HD/sl7bJV5oEmPBy4yvPb2VSOXlD6S/DSrk3fWk4yu6J5evGlIZdxwxKlC6p0V1khhEigB9pzCDLnQh1IcdK7vGCFWEtcYMV4/dkXUHzB9Q9PZbmkqAItB4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605843; c=relaxed/simple;
	bh=t3YtyjB4Em773wPqutLXsTPMheRxuRTFL5tKcyoOmbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o/iQRRrJpv85Ssh58KaWXkFi1LXyHivGrfK35rTZuD0ft1hNLTrP41pDNvoZE/K/w7Un1YyovfakUQvAaeQxuZgr6nd9wNyjUAGnlsKVa28D2zDIyaS5QIFEfpRo4q9pZQQPuzNySzGfPXbFmAjxa0QCdZKfKRrY+p46PzIIc/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nA1kRnyV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nA1kRnyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786605841; x=1818141841;
  h=date:from:to:cc:subject:message-id;
  bh=t3YtyjB4Em773wPqutLXsTPMheRxuRTFL5tKcyoOmbE=;
  b=nA1kRnyVo883xTm3Xjb4zaOHbx0SkLbHRqiFnzPOc0TcNDOyo+TXjZDh
   mt4vfi82GF/Lgzfg6mtMyxqT0TIEFpHwHtA2frqjuic3dEHVp9XCEUkop
   nUiMQkHnbAaEP55HAta0TCVf/Zey1skDdViJsQ1gMoOVb/UnHGFDaeqWJ
   ZjPC6hO5EhG4Wbz3GwvR9455S+YKUnCPDEkbk3Oe57DhHv7fMhU2+XVXj
   pFCKfbzd8iL5YFyZiumdiAaxWOTLF2065XDHdIFw0MMbOwIOzMead27LX
   kc2xVtkOtVxfEV1vWC5UcDgI4PmmW/3t1u3wp9a8ERSUbTFVOOPwxs8Qj
   A==;
X-CSE-ConnectionGUID: tk8eYjTkSaK6G3Y02mHJfw==
X-CSE-MsgGUID: YTVQvqP+SdK29W0Zr7909w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87033544"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87033544"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 00:23:55 -0700
X-CSE-ConnectionGUID: WRNZBfGHQ5KUQypxbprxNA==
X-CSE-MsgGUID: cUR9LOrtTQWGkfgSY2p9Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="265845606"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Aug 2026 00:23:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuPn2-00000000TDC-30hJ;
	Thu, 13 Aug 2026 07:23:48 +0000
Date: Thu, 13 Aug 2026 15:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 272/272]
 include/linux/compiler_types.h:309:45: error: call to
 '__compiletime_assert_402' declared with attribute error: clamp() low limit
 source_min greater than high limit source_max
Message-ID: <202608131505.MttZU0ku-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9c40f45d2c22f05e45bc48b1d7be869adf7e473a
commit: 530278140b21c18bf53392ce59ee2f46b094286b [272/272] minmax.h: use BUILD_BUG_ON_MSG() for the lo < hi test in clamp()
config: i386-buildonly-randconfig-001-20260813 (https://download.01.org/0day-ci/archive/20260813/202608131505.MttZU0ku-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131505.MttZU0ku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131505.MttZU0ku-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/i915/display/intel_panel.c: In function 'scale':
>> include/linux/compiler_types.h:309:45: error: call to '__compiletime_assert_402' declared with attribute error: clamp() low limit source_min greater than high limit source_max
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


vim +/__compiletime_assert_402 +309 include/linux/compiler_types.h

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
