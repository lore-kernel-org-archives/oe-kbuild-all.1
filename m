Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794947398;
	b=TONu4PJCwY8wewmnLQhI0zpwEeX2ZhgVMiu2B/BXeYX9tMKQfXeTGyU2CY0ts+yhe8HH
	 fMHTi3lN6nlG3gi339jfO/qoV/TqHUgid+1/8GcaP+jbZfFOiHTcNr0WxBvJnHUgjNdeK
	 yUEMd46AKlJZqt+f+hSoVDK3jrhRx2AWVceVYWpA9qpmMJ3/haVeJZOcI9NYOlmVoFF82
	 qhvmSbvrYlq5AuhcCrJTg3vWeT/dhISlSfkHwTUw89FzIdQkHKhXgWnP7RBDOlFzGsBdS
	 Y65zup/T40O/JByPddJ9nyY7mygD7O4mdqwYZlREQAhE/X6DLShEM6mWEgvQzLWk5UQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794947398;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=xJysmxGYDDggIgOqwyN0NGnYKedDIYharSEN91oksbg=;
	b=oJ4jBm96fg+qj7FrEr+Pum/UvGwUNtWAf4oYRrvZxoa+45jChHn5ribcsB6EmEw/Gaf7
	 mTUM5I+Zk40q7LIpNSxrP2cQ/2gZzI35ijZ4CDTP1WLIU/T9AthTVIHe9GqCstl45o/JQ
	 OURRXlLhwlC/eibXAnK/TI/h7OdcUbpdDy8rmYG7Nbm1CDg1BQu6x3y/9irns73DkgS0z
	 S5OJ40tvgdXmksdGIO1aKRuCEGzeEfgSAZXJaSsDQuzXOPu+cIcZMIFx9WzGjAJf9gmS1
	 r0y7+y7XAYSq4x8kgrcvlp3dUheEl4241obLN93Zb70SBkBFIOrDwVGV7NGrLhhPGvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mbF2Au4e;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19014606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 20:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19014606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mbF2Au4e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794947397; x=1826483397;
  h=date:from:to:cc:subject:message-id;
  bh=pKFUT+5ZWvzufbL2Pm5Vv5p5B3GO1ABNZhlamRFMqb4=;
  b=mbF2Au4eSyMDH56RnyKXSnimTkRDrHBPhqput/ipJQKHWL4a9F9qiUGs
   IC0x3fpc7nY4pUkvoaxqn/4Ds2XpZsvvNPFqXHM0Q0AcvNg++GgQ+NqJt
   JsB33b2BgBQghCOKnPnPnOlISrR/1WpaOxpGJFMlMosfP3O20ny7UtWoH
   NknDbyi1pOtTesAvYVhWq5SoD6NjqwZJXlpBT6kOYZh5X9UYWBq3J/Mxr
   EpiAYNvPiQe270LMbnCkmz3mqXMmjZRtunrFldmgzuDPpjqYjZ/d/TTXd
   uienOE44oZUfUyX7/D+p0YSyC6IVxnNSZcc+yViUf/yX0FW0R6p8+SFSV
   Q==;
X-CSE-ConnectionGUID: 9sYwn308TPGoxrAoKrdRow==
X-CSE-MsgGUID: wRcssFRGRsWHZcYrgJRVXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3814307"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3814307"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 12:29:57 -0800
X-CSE-ConnectionGUID: 2uCDyzUaRVKBMYVp2WFMbA==
X-CSE-MsgGUID: L3pZOx2bRsWGNYZmlIyicw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9994913"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2026 12:29:56 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTPoO-000000003C6-3eM1;
	Tue, 17 Nov 2026 20:29:52 +0000
Date: Tue, 17 Nov 2026 21:29:16 +0100
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_dir_access 1/13]
 include/linux/compiler_types.h:702:45: error: call to
 '__compiletime_assert_336' declared with attribute error: BUILD_BUG_ON
 failed: offsetof(struct fanotify_perm_event, fae) + sizeof(struct
 fanotify_event) != sizeof(*pevent)
Message-ID: <20261117211903.KxPbFqrl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/amir73il/linux fan_pre_dir_access
head:   cfc22130c59cc87392fe9ce601cd5823dff2781d
commit: 3e98f5014729b25c3a63378cd7a72eae85ff3921 [1/13] fanotify: add support for a variable length permission event
config: parisc-randconfig-2001-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117211903.KxPbFqrl-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117211903.KxPbFqrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117211903.KxPbFqrl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/notify/fanotify/fanotify.c: In function 'fanotify_alloc_name_event.constprop':
>> include/linux/compiler_types.h:702:45: error: call to '__compiletime_assert_336' declared with attribute error: BUILD_BUG_ON failed: offsetof(struct fanotify_perm_event, fae) + sizeof(struct fanotify_event) != sizeof(*pevent)
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:683:25: note: in definition of macro '__compiletime_assert'
     683 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   fs/notify/fanotify/fanotify.c:671:17: note: in expansion of macro 'BUILD_BUG_ON'
     671 |                 BUILD_BUG_ON(offsetof(struct fanotify_perm_event, fae) +
         |                 ^~~~~~~~~~~~


vim +/__compiletime_assert_336 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
