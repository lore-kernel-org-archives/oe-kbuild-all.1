Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B24A08
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 16:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747152039; cv=none; b=K3L05DboGD5+cIhVpNMHimoHBWiGBkyZ/WzXrJVXTu+NAMfNBQ/rjbwjXisNDp53r681ucp8JZuDtPtSHYvNlxl/mJW8DsF5pSKCPlUlWA9lT75PgfRtJj5qRO6atIFj855muTx+uN2uf/PFkBggF4HQ6XpMy1ude7CyCwz+0A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747152039; c=relaxed/simple;
	bh=rq9Pnx4u8xrDRe3jE0ihKOvy9882z7bueE39NsJNy9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+wUaSjv5Q6qzL//e0F3cA+GHCNMq1oxxyi6AEUAofLoL3zml/mDG02MBSNgSlLCqXJXYNRffdmE8n4JMO1JmA1zZSJArFHqXXajE0Xe5YTBbe0038DNGQKD9fezBKlpbl3QIZ7ZtwnjV1x4kDYsTL0xCRc90S+EwLwq1+N5Y88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g6NkZeHP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g6NkZeHP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747152037; x=1778688037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rq9Pnx4u8xrDRe3jE0ihKOvy9882z7bueE39NsJNy9M=;
  b=g6NkZeHPWJMFaVESszq02TLLUbz9ewmtvYooepHRG44S4ORMya9Quf6c
   IZp86/cA1+7nFMDq1eyu0FlG60aIZmNdCUvlRJfeRv4zN3EcvhB5/JzEM
   S/Mji+EpSkCJwEhECvXBnEVmhVswqnwd/6D0gh9FJYmdAcEO4rDVK6RiP
   FPP91+KcCO+vKgOv6yuQhO3dsBSd9feYuxwxfjFvUTccKMQikgVHevrfc
   f9vSLkoXtCYT8hjX5wkyW+qvXkNQWQgFry3ZNeq1Uy8nqwDx104/yRy4v
   E7sG1lm/2Auhp3MH+Yl1XbeeS9Na9NfX/2P5+NGZL0ArK/Fdc+wmauiyK
   A==;
X-CSE-ConnectionGUID: VRpFHKVpSVeF+CyJUBAAmg==
X-CSE-MsgGUID: rNewbe80Sk6uHn9/cUACOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49127620"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49127620"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 09:00:36 -0700
X-CSE-ConnectionGUID: gpwpCEkNTZOdAeimUa/Ghg==
X-CSE-MsgGUID: nhtV6JgoSsC7i7IaVGAD0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138728403"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 09:00:36 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEs3V-00010Y-2B;
	Tue, 13 May 2025 16:00:33 +0000
Date: Tue, 13 May 2025 23:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.coredump.socket.tmp 12/17]
 include/linux/compiler_types.h:557:45: error: call to
 '__compiletime_assert_419' declared with attribute error: Need native word
 sized stores/loads for atomicity.
Message-ID: <202505132316.mHWip0p1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.coredump.socket.tmp
head:   35c4ddb37fc4f2ba3ada4ef8eb64e849f82c702b
commit: f4d791098be37448a5552aaf97191618ada89a2d [12/17] pidfs, coredump: add PIDFD_INFO_COREDUMP
config: i386-buildonly-randconfig-2002-20250513 (https://download.01.org/0day-ci/archive/20250513/202505132316.mHWip0p1-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505132316.mHWip0p1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505132316.mHWip0p1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   fs/pidfs.c: In function 'pidfs_coredump_cookie':
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_419' declared with attribute error: Need native word sized stores/loads for atomicity.
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:560:9: note: in expansion of macro 'compiletime_assert'
     560 |         compiletime_assert(__native_word(t),                            \
         |         ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/barrier.h:61:9: note: in expansion of macro 'compiletime_assert_atomic_type'
      61 |         compiletime_assert_atomic_type(*p);                             \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/barrier.h:172:55: note: in expansion of macro '__smp_store_release'
     172 | #define smp_store_release(p, v) do { kcsan_release(); __smp_store_release(p, v); } while (0)
         |                                                       ^~~~~~~~~~~~~~~~~~~
   fs/pidfs.c:608:9: note: in expansion of macro 'smp_store_release'
     608 |         smp_store_release(&exit_info->coredump_cookie, coredump_cookie);
         |         ^~~~~~~~~~~~~~~~~


vim +/__compiletime_assert_419 +557 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  543  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  544  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  545  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  546  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  547  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  548   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  549   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  550   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  551   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  552   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  553   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  554   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @557  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  

:::::: The code at line 557 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
