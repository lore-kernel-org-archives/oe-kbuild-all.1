Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAC3335094
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 02:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762826840; cv=none; b=mtAkLwYEbUjV9Ez2yELzhQ2jXiSm3hBpPLq5drXDXOZBde1GcnKXmQXRO7y5W5/TwspMsFeYLi7O8DYNq3p6Ow6RV41Kb5v97MRThdvgnWR/NB3u0Iqbe6S0nAOz9ARGZ76Z3O7Jw0ZTgp5nQC2cqORW80CKt5ps+PCdgvUDKTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762826840; c=relaxed/simple;
	bh=B/atlUk965oK2ZIVai1/Y1GWMyxe/M+JVIxMKyWUm/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AHWSM+KClbQUqGEMocikY3DK661h4MwVquDHYAdixMsAV+Vy7m+rga71ufo2iHDtQmrClHvvrsMU9QDd2gCX6SkIP1TkEfDnemGq6L8y6uRX68TwptnyoZ0hH80E73gbqQ5Xo1NsBH3ZASneRTlfTOmOwLdZyM16bM8ZEZtc/40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kzcwK/l5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kzcwK/l5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762826838; x=1794362838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/atlUk965oK2ZIVai1/Y1GWMyxe/M+JVIxMKyWUm/k=;
  b=kzcwK/l5IB844DecrvAtn3RokPdaxJ+s1+mz56pIZ0zr9EVx2MBRXLeE
   ONnLeMHDkWGivRdm74o3zN0AVjBNSwLgEN8fjp1Fu3VOB6eznYnZsxNM2
   u+VyAvwUzP46L1NRGmyjs7oevcguC18bxTSMR+M3/JMuvHJZ3R/X2rYX9
   Fn1dsVqfwomteGvxvcyunvWAInCaNeLgDbcSHXIfBjOTIrpakjbjpkSlF
   8K1IReLPTB3kEFKR271BQLZmVVTavhC+H8ZiXiuwxoXfi0Tomdmne1CIr
   18swHhZWtkg0iVbO2ql0BF9zh/H7EqVDi+KGLlFE//uRaoosvy3cD3i4a
   w==;
X-CSE-ConnectionGUID: E925ucDHRyGTKpCNe3ggyw==
X-CSE-MsgGUID: gSgZYYYvTrKO+nngjbSatQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="90355131"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="90355131"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 18:07:17 -0800
X-CSE-ConnectionGUID: OvZrKfK8SWCCf8scRm0pfw==
X-CSE-MsgGUID: Tb+iXEdYQSSq6jEm7tAkag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; 
   d="scan'208";a="219486474"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Nov 2025 18:07:16 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIdmr-0002Wf-2f;
	Tue, 11 Nov 2025 02:07:13 +0000
Date: Tue, 11 Nov 2025 10:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: include/linux/compiler_types.h:557:45: error: call to
 '__compiletime_assert_308' declared with attribute error: BUILD_BUG_ON
 failed: !__builtin_constant_p(type)
Message-ID: <202511111047.GZRksgk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4ea7c1717f3f2344f7a1cdab4f5875cfa89c87a9
commit: 1518474b70d663baf7757ccd1b1c229c077d9b3e KVM: powerpc: Enable commented out BUILD_BUG_ON() assertion
date:   7 months ago
config: powerpc64-randconfig-002-20251111 (https://download.01.org/0day-ci/archive/20251111/202511111047.GZRksgk7-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511111047.GZRksgk7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511111047.GZRksgk7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'kvmppc_account_exit_stat',
       inlined from 'kvmppc_account_exit' at arch/powerpc/kvm/timing.h:92:2:
>> include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_308' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(type)
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
     538 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
     557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/powerpc/kvm/timing.h:41:9: note: in expansion of macro 'BUILD_BUG_ON'
      41 |         BUILD_BUG_ON(!__builtin_constant_p(type));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_308 +557 include/linux/compiler_types.h

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
