Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06AF19C54A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 10:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732097432; cv=none; b=ehIBYUo2GqK/poWb6cWVEA6VccpLqSlFO6b3n/qgZ/MjhPwatIsa9KajdY/L8YC5RtQTyhKVYk5RCG9bH77pNZYfoWVuDAhc6Q14+qr1opgOEAsRzyFNC9f1tjDIIBTQqnTptfbQephtkFy+2Jz3L1uvUzvp/w6v9AoXNWuN2+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732097432; c=relaxed/simple;
	bh=de4MEA4LuIJnYvuyPPhNzC3I1uErjKLWcwCfUyEPHSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JR4o/HSZawZ7c6lge0sytHeuPAC64LAb9WkTHOCP8YNwqpYANXRf3LtL9+jVwVelFcdhWZ8JHcgEe7+5FkCG0UTo1hus001kxgNS/RByY/1fiQQkL4WpraKKhehzY17rXePHFo38hKoX0YuZQPDYzFER/36AYpu/9izfpfbu7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2aH9pd1; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2aH9pd1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732097431; x=1763633431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=de4MEA4LuIJnYvuyPPhNzC3I1uErjKLWcwCfUyEPHSo=;
  b=T2aH9pd1WyykyYdY5bLe4rhaB6MIm+2jKMY35tuXkr4IDpGov98XuY71
   bg7E97QcLWleop2Law3pAA3x3pbubeW4EgjH8dBPN99CCpOcUY1ebW/dO
   Q0GKXuF+uIAnGd/D+9P17DuohVaJ2fbgD9GLkCiL8rD/kxEx/EZ26PLQM
   d3TEr0Yrbu/+hmQdrXrlLN05wwTKtM0T1TszkMIvJ89aIlWsVINVDVCKH
   djk/+LhHyoIj57u9dAmfDAgnd/0jdAVyRhRtMPW2mDeNy7CL/cqRCGIdO
   maw1PsMvJR0jFHY41WortnbKUb3bhbAilQWQTTC1ESuSML+A5iz5fva+R
   g==;
X-CSE-ConnectionGUID: /9102MoSTXOWCHA+faWUUQ==
X-CSE-MsgGUID: ZonrPXgVTTmugmm+GQRNNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31517221"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="31517221"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:10:30 -0800
X-CSE-ConnectionGUID: SaBFF+rSS5aV9ULg/iXQKw==
X-CSE-MsgGUID: AfJqQCUxTFa1bwjy8aWpYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89978908"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 20 Nov 2024 02:10:29 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDhfG-0000ki-1u;
	Wed, 20 Nov 2024 10:10:26 +0000
Date: Wed, 20 Nov 2024 18:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>
Subject: [linux-next:master 7083/12380]
 include/linux/compiler_types.h:517:45: error: call to
 '__compiletime_assert_845' declared with attribute error: BUILD_BUG_ON
 failed: !__builtin_constant_p(sr)
Message-ID: <202411201857.ZNudtGJl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ac24e26aa08fe026804f678599f805eb13374a5d
commit: a0162020095e2a34a59fc64c07183cc039e759f6 [7083/12380] KVM: arm64: Extend masking facility to arbitrary registers
config: arm64-randconfig-004-20241120 (https://download.01.org/0day-ci/archive/20241120/202411201857.ZNudtGJl-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241120/202411201857.ZNudtGJl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411201857.ZNudtGJl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/arm64/kvm/nested.c: In function 'set_sysreg_masks':
>> include/linux/compiler_types.h:517:45: error: call to '__compiletime_assert_845' declared with attribute error: BUILD_BUG_ON failed: !__builtin_constant_p(sr)
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:498:25: note: in definition of macro '__compiletime_assert'
     498 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:517:9: note: in expansion of macro '_compiletime_assert'
     517 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/nested.c:957:9: note: in expansion of macro 'BUILD_BUG_ON'
     957 |         BUILD_BUG_ON(!__builtin_constant_p(sr));
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_845 +517 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  503  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  510   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  512   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  513   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  514   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  515   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  516  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @517  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  518  

:::::: The code at line 517 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
