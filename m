Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4440DFA6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 05:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773207284; cv=none; b=Gh4SxcNE3lOXZoxpYinYHvoVl2iJI9ycgx/KwUWUj0RXjabkALbvKEnVjeKfQfGbAX2FYN7iYm8NAvaXvPeCkKQmOqGbd4agupb3xLBjC+sv1+T5uhGdpzb5HWfEQSUljlrhJNzAvJpe+8KqElMC/TodTTRTXNXHQnoy/C9fnHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773207284; c=relaxed/simple;
	bh=ZHjR2G6uZqOltvhHdwV3Dn2ZTKhUSDYmXQjw89wLcTw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GAE9Htb9kxAbUE1PdmH4hgV8o7Bo8MHe3lYlA7UFBXs6zOLVh8oH4HbG5pRaZqO9EIYN9eafHj7XhU5z5l7R2dM5fvQrv3+FFUBniYGmThaZE4EN/3UnhlmFnupqrwxa5rxJ2jmdRQbxhyQ/ARzrN5wjChv+h7IwoXo0sNdxGsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IjCFvsLm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IjCFvsLm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773207282; x=1804743282;
  h=date:from:to:cc:subject:message-id;
  bh=ZHjR2G6uZqOltvhHdwV3Dn2ZTKhUSDYmXQjw89wLcTw=;
  b=IjCFvsLmfo/tJEbvG9pZDcCx56VODuLCAZqhl/mEZJKYNoRVlQWV115u
   K31tWiCz2e7mjC5bHguewYi9rdMlYdTXm6v4t4H4U7Q3Jk7sgVHyilrI+
   7quDBQmLuWl/lp7qpYm9XbPel8TGOjIoFOMiDji5/KryCLpGVHCG/Sc6x
   enTgC7Ziu7QQ4Exy1ZlqiJ5wMUK2UmtGjPW9nmrxAlI5006GWQOfxyZrN
   tj8T5M6YVo6nwh+U4ILHv1CZdAKLR5xTM8fOCWdsnGviuqSr/+ginylr4
   g7Uhz5QqzZ0umlxRN8O16rYq9HrXCVyWdUl7Q8UCtwqIt44c7t2o32G9T
   w==;
X-CSE-ConnectionGUID: frmNoGmtSMOzMOonZrJHdA==
X-CSE-MsgGUID: 6bmpmGbkS6y+1nLZfE9r+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="74143266"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74143266"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 22:34:42 -0700
X-CSE-ConnectionGUID: ArWXnIaaTSGPEHQ2m+E+6Q==
X-CSE-MsgGUID: H/c3P5RySkKsGwkrZQjDRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="258268883"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Mar 2026 22:34:39 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0CDL-000000000k5-0DOG;
	Wed, 11 Mar 2026 05:34:35 +0000
Date: Wed, 11 Mar 2026 13:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: include/linux/compiler_types.h:557:38: error: call to
 '__compiletime_assert_321' declared with attribute error: BUILD_BUG_ON
 failed: !__builtin_constant_p(type)
Message-ID: <202603111303.HpZwsyZb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Thorsten,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b29fb8829bff243512bb8c8908fd39406f9fd4c3
commit: 1518474b70d663baf7757ccd1b1c229c077d9b3e KVM: powerpc: Enable commented out BUILD_BUG_ON() assertion
date:   11 months ago
config: powerpc64-randconfig-r051-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111303.HpZwsyZb-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111303.HpZwsyZb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111303.HpZwsyZb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'kvmppc_account_exit_stat',
       inlined from 'kvmppc_account_exit' at arch/powerpc/kvm/timing.h:92:2:
>> include/linux/compiler_types.h:557:38: error: call to '__compiletime_assert_321' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(type)
     557 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                      ^
   include/linux/compiler_types.h:538:4: note: in definition of macro '__compiletime_assert'
     538 |    prefix ## suffix();    \
         |    ^~~~~~
   include/linux/compiler_types.h:557:2: note: in expansion of macro '_compiletime_assert'
     557 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |  BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |  ^~~~~~~~~~~~~~~~
   arch/powerpc/kvm/timing.h:41:2: note: in expansion of macro 'BUILD_BUG_ON'
      41 |  BUILD_BUG_ON(!__builtin_constant_p(type));
         |  ^~~~~~~~~~~~


vim +/__compiletime_assert_321 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2d Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2d Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2d Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2d Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2d Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2d Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2d Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2d Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2d Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2d Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2d Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
