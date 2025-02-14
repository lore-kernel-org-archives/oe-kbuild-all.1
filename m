Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462F21DB92A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 21:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739568562; cv=none; b=Dw0vyFlT/Tsdu2ith7adIsRwC+7TnQ4WzyABiCGAiU7eaAeoH617kS0dHZFzmZx4/qML1VWaZKnAMgFX7wYk4q0ymFRDGNuZ4PZ8Ig45aVDZh+NARWt+lanuWQQiIJVBlHux+puIOG6mun/KnLV5kbkMkCItSFB6MqiyaV0Xh5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739568562; c=relaxed/simple;
	bh=Msh4XqbvejPyjvuT9Nma8aMuoZ+9Qay0PBxKfxiKj8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLBXjJJZm+tawHqG2G+kMf+el2Q6Zpm/kX1e+5lUH52+HoDU9inbTYXvUiN1vGPyK49hmjprYZRVAcKyraNd/VO2NOurdYwNL/56Mv4D1uk2rQK8YjjAMN4dcUo1yp87KG+BBK1dlgfQV2DKBPHRXxIhiY+fl9Mg49sZN/n8UJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0ZumUd/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0ZumUd/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739568560; x=1771104560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Msh4XqbvejPyjvuT9Nma8aMuoZ+9Qay0PBxKfxiKj8I=;
  b=n0ZumUd/Lh6etMp2j977QdyQfso55VAldK09uU40z+9JRCULrb383qCl
   7K2/YweIf+wL7SH3QsiPqSwYtNYdvub+ZzEhWNZQyTW3kCM/5y6C2YAhT
   EPfl3G3IPqE+uwDZ9pHfWNU1KCJe03O3gaGkmOKoSwghSP9VvsqitbdDm
   FkUCNRVLlVqlsJ8sCC8nO6ul4pVfiAKmQOz8XB8vBLzBpXbBrfxIeBmjD
   e1MSA+iD+At2tvZKC0wbwfC8Nh7Ann2uizRfrHTP1mtyMehawekjScUNx
   Vf2OcNETQURZF9E/pPX4wE2UtYgBh5V2o5GVoURF8uU8A1vEvgodrcTL6
   w==;
X-CSE-ConnectionGUID: DMgccfI/THi0wJeRGfu6XQ==
X-CSE-MsgGUID: 4wBFC4T6R7GUnon5hPQZNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40447818"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40447818"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 13:29:18 -0800
X-CSE-ConnectionGUID: NxTYgCXvTb615/hvNU8vRA==
X-CSE-MsgGUID: 7tHwbnGrTMWYvp3TkXSR1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144485094"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Feb 2025 13:29:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj3FL-001ABd-1v;
	Fri, 14 Feb 2025 21:29:15 +0000
Date: Sat, 15 Feb 2025 05:28:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 1/1] include/linux/compiler_types.h:462:45:
 error: call to '__compiletime_assert_396' declared with attribute error:
 FIELD_GET: mask is not constant
Message-ID: <202502150538.vmkh1ZFb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0879c1ab94ac470303ea991cd23a1cec7190d27f
commit: 45b4be677ffae50a63cd2efdb75402857f577133 [1/1] CHROMIUM: memory/mediatek: Add an interface to get current DDR data rate
config: arm64-randconfig-002-20250215 (https://download.01.org/0day-ci/archive/20250215/202502150538.vmkh1ZFb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150538.vmkh1ZFb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150538.vmkh1ZFb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/memory/mediatek/mtk-dramc.c: In function 'read_reg_field':
>> include/linux/compiler_types.h:462:45: error: call to '__compiletime_assert_396' declared with attribute error: FIELD_GET: mask is not constant
     462 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:443:25: note: in definition of macro '__compiletime_assert'
     443 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:462:9: note: in expansion of macro '_compiletime_assert'
     462 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:65:17: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      65 |                 BUILD_BUG_ON_MSG(!__builtin_constant_p(_mask),          \
         |                 ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:154:17: note: in expansion of macro '__BF_FIELD_CHECK'
     154 |                 __BF_FIELD_CHECK(_mask, _reg, 0U, "FIELD_GET: ");       \
         |                 ^~~~~~~~~~~~~~~~
   drivers/memory/mediatek/mtk-dramc.c:51:16: note: in expansion of macro 'FIELD_GET'
      51 |         return FIELD_GET(mask, val);
         |                ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DEVFREQ_THERMAL
   Depends on [n]: THERMAL [=n] && PM_DEVFREQ [=y] && PM_OPP [=y]
   Selected by [m]:
   - MALI_MTK [=m] && HAS_IOMEM [=y] && ARM64 [=y] && !MALI [=n] && MALI [=n]!=m [=m] && MTK_GPU_SUPPORT [=y]


vim +/__compiletime_assert_396 +462 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  448  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  449  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  450  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  451  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  452  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  453   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  454   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  455   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  456   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  457   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  458   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  459   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  460   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  461  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @462  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  463  

:::::: The code at line 462 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
