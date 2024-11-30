Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFB419E960
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 14:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732978744; cv=none; b=qBkQVpL5Xu1PJLwGlhJ4+89yj+FCFNXRNgcMyWTeVmzdBHAutEAgCWCXS04abDGY8JeZbJHe62KQwiB5kLl4z8ccTiLj/zZeJ3lPVGrdUL00nCNclnDyF2lqfgadwv1XGJdM8ip9hGPgrufuv84JNK36Oe9qjO0ZSeJ+64VOFCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732978744; c=relaxed/simple;
	bh=M4COaJeLgoQpfkuf1wH7KRDdzT7RyKJl61QwbMIe3U4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbfAdeevyqQ8lxViXHHrN4xRq/skwVfo7ax6HMl4/F+iQxsHrrC/Mu3YCg+ds3eWnx5TLdMXIy207ffnziqopdDhKS83Cs1Ly7gJ/6eHgqeTyQDwHWW2YaBSNRzxUICMKbJ2ED8qjtIZmf4UtTM4nD+OOVVz+pkLM/OqVdCvu6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTxa4adb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTxa4adb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732978742; x=1764514742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M4COaJeLgoQpfkuf1wH7KRDdzT7RyKJl61QwbMIe3U4=;
  b=XTxa4adbZ4U84FZlvil86RlpDuQncKBSIYzjTTxchGIPy0PvLDi+EAqU
   Sf/A9wnWToTULANDMZ1hQ5kNWgLaSyXnfftJoTU7ZbvKd94EBcJJiOmg7
   chtBK+9YEhzHa6MFL6DxRzG2nhO0IBVpYuVjXetmjkGWvLVZFSYPc/BxW
   Mu6ZtV+NhzdWNwudr4hIiOa18ogtBzZbgyAyFu6Dr+S1fDm61wM4bmXRj
   D5IOE9KNSAkRVRhWivpSuLYeox6BFDdKlFcd7qvhltLGh727UJzTcQzmz
   np9WI20YOtqs5z4044gPpiFL11aIMU5gphmYGg1TBfaVZhukOT2AWTjcC
   A==;
X-CSE-ConnectionGUID: nCw8sByhQ+SUfRZuwDUTKg==
X-CSE-MsgGUID: xEbpBO8bSnigxXEVOmW2sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11272"; a="36043880"
X-IronPort-AV: E=Sophos;i="6.12,198,1728975600"; 
   d="scan'208";a="36043880"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 06:59:02 -0800
X-CSE-ConnectionGUID: dhHVfEiWQJuYSxvePbo4ag==
X-CSE-MsgGUID: 25OJ7FJNRySu4oSPdQTE9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97733213"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 30 Nov 2024 06:59:01 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHOvl-0000kA-2L;
	Sat, 30 Nov 2024 14:58:49 +0000
Date: Sat, 30 Nov 2024 22:57:55 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/linux/compiler_types.h:338:45: error: call to
 '__compiletime_assert_248' declared with attribute error: BUILD_BUG_ON
 failed: (24-12) >= 12
Message-ID: <202411302220.FJF9oo16-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h
date:   4 years, 4 months ago
config: arc-randconfig-r131-20241118 (https://download.01.org/0day-ci/archive/20241130/202411302220.FJF9oo16-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411302220.FJF9oo16-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411302220.FJF9oo16-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   mm/huge_memory.c: In function 'hugepage_init':
>> include/linux/compiler_types.h:338:45: error: call to '__compiletime_assert_248' declared with attribute error: BUILD_BUG_ON failed: (24-12) >= 12
     338 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:319:25: note: in definition of macro '__compiletime_assert'
     319 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:338:9: note: in expansion of macro '_compiletime_assert'
     338 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/bug.h:24:25: note: in expansion of macro 'BUILD_BUG_ON'
      24 |                         BUILD_BUG_ON(cond);             \
         |                         ^~~~~~~~~~~~
   mm/huge_memory.c:403:9: note: in expansion of macro 'MAYBE_BUILD_BUG_ON'
     403 |         MAYBE_BUILD_BUG_ON(HPAGE_PMD_ORDER >= MAX_ORDER);
         |         ^~~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_248 +338 include/linux/compiler_types.h

   324	
   325	#define _compiletime_assert(condition, msg, prefix, suffix) \
   326		__compiletime_assert(condition, msg, prefix, suffix)
   327	
   328	/**
   329	 * compiletime_assert - break build and emit msg if condition is false
   330	 * @condition: a compile-time constant condition to check
   331	 * @msg:       a message to emit if condition is false
   332	 *
   333	 * In tradition of POSIX assert, this macro will break the build if the
   334	 * supplied condition is *false*, emitting the supplied error message if the
   335	 * compiler has support to do so.
   336	 */
   337	#define compiletime_assert(condition, msg) \
 > 338		_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   339	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
