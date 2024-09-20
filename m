Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC6F5339F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 10:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726826923; cv=none; b=UCq0ZExlnix4AaiLIztAp0FWEHY1VqxUbv1OJ3AxS40shfyayzH3G/XMoSq7q32Kq2rJhWeKeU2jXGRbijQV5NmRnZ3q6WC3I2i6CNmNP5x8QtyZIdNJnCRcIaELWETxIpVdtHumniaxf/4ae6YP0tkzk/D79JfBgVP9yB5i5hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726826923; c=relaxed/simple;
	bh=osQpKCKRSgiXyNp5LpfExb3NzsdiPC4M/TZ/e7Djeac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUywYNzgL7jCb6R0n/sTz14HHioMjpfGSXjob5bFO3uJpXCL5FnHyzT3fO9NyNkQ72j+nDEgR7HpZjb9fL4j+vmFCEegVI38RO1kaWL7KUrzHlbPcNd02eesLk6cuFqu/mT6F1bBrmNSlItwIQu3PKJcxeSCxpdqERZ6xU8COyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=isB7Zhcu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="isB7Zhcu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726826923; x=1758362923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=osQpKCKRSgiXyNp5LpfExb3NzsdiPC4M/TZ/e7Djeac=;
  b=isB7Zhcu6e6fJXafD2bLvZjfw1AiOjUYqTf8umGTkRwalDt/MKfdNR5J
   7bl8IZkA0Xh2QLNw/iRufenGKM7EHbVN1CL6QpTxGRlz9NLAyFGzHVsqn
   9rZqS0NZKcJE+v1QKkiQa6oUqb5w4eqBgG2I39hDDICXwE9Bq6Rpc5AOw
   +1p3HHfyoG3d0wlrzOPwJLXLw4wwhu21QpYbXFxmE9NE5OHWYZlmQlADN
   3Swuheki3QrAmP+0NAF4F5airz0rEHu5IZ7atLMMxSBi+HWoGeI9UFHwK
   AO0ptgWpstPs6kDAiptVv67wE3HIVzFmSNWehghfr5gfr7/YEFXwPit2f
   w==;
X-CSE-ConnectionGUID: LvqRluMXTBms8cWTV+ZL+Q==
X-CSE-MsgGUID: Bfk24zeiQNy3WFo04Z3Slw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25976404"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25976404"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 03:08:42 -0700
X-CSE-ConnectionGUID: 1oLVBFDTSuaIGeXqJPRpdA==
X-CSE-MsgGUID: kWP59HNRT1Cgw9DkEtPVHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="69851028"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2024 03:08:40 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sraZ3-000EGh-1x;
	Fri, 20 Sep 2024 10:08:37 +0000
Date: Fri, 20 Sep 2024 18:08:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: include/linux/compiler_types.h:510:45: error: call to
 '__compiletime_assert_495' declared with attribute error: BUILD_BUG_ON
 failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
Message-ID: <202409201842.sdYULOZc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Christophe,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   baeb9a7d8b60b021d907127509c44507539c15e5
commit: 2f2b9a3adc66e978a1248ffb38df8477e8e97c57 powerpc/32s: Reduce default size of module/execmem area
date:   3 weeks ago
config: powerpc-randconfig-r013-20220912 (https://download.01.org/0day-ci/archive/20240920/202409201842.sdYULOZc-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201842.sdYULOZc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201842.sdYULOZc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/powerpc/mm/book3s32/mmu.c: In function 'mmu_mark_initmem_nx':
>> include/linux/compiler_types.h:510:45: error: call to '__compiletime_assert_495' declared with attribute error: BUILD_BUG_ON failed: ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:491:25: note: in definition of macro '__compiletime_assert'
     491 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:510:9: note: in expansion of macro '_compiletime_assert'
     510 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   arch/powerpc/mm/book3s32/mmu.c:226:9: note: in expansion of macro 'BUILD_BUG_ON'
     226 |         BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_495 +510 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  496  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  497  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  498  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  499  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  500  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  501   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  502   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  503   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  504   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  505   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  506   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  507   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  508   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  509  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @510  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  511  

:::::: The code at line 510 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
