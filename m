Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B65327C08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 19:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776107073; cv=none; b=FUsFZQ3QnamhEuexVlL8DpFxyDbiNy1FXQ4OMwtRzVpzNE55Wa88gxxhNoCK5Z1+pBHpSwcJyfsM7tAdlmXUOp3a8i96afuvpzWjpqot/IelMgPCM8SYgeq1DrgfiUFzhURw2+dhmp2k2ddTPzpUXX+WINcjt/zjds5isAzBgk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776107073; c=relaxed/simple;
	bh=jn6xWTxciiAEnItR5bjtfA0yMvt8iTbLUQUSG5szPbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=lXwGbsF83B529RTTuYuLGzCKrVfQbxb7T4y0N0an4IwyDbV3J4yNwLoAmmq1LRFAGMcY16a+VDI44o/+QLbO5QNKO40If82AOJhA+SpUu9YQEUR37brgs1iUAaC2rK4QcRuhp2jTybAa8VQaVpb4JcwMDXgpTdVeWmErErGRh00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TFT3AYsa; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TFT3AYsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776107072; x=1807643072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jn6xWTxciiAEnItR5bjtfA0yMvt8iTbLUQUSG5szPbQ=;
  b=TFT3AYsaeBupXcetTsc2vnHmZVGuPF3XdfoHRwf+bGhXs65jfB5IT1Nq
   lStfPL7vOeUFUtfb0A2+CcH0Lo9HdVT3iqi2WdwREl0g5BFqrobQOUmcr
   vVs6V79u8SeUyyHP+jg4VNlCJqhiyLVMJpChxs1P0eI2ZvVdFWNtEaPHA
   o92+aG7T/yZAkH58PtqwM/lDkNvBvrrW3tMy8Q8ZKoISGyPFeZA8fi7mE
   QpCUoKRJPStELzF/LbyyMyqxHIS4UFUIcKnJNOZxV518Zh5f7T+NC+eVp
   UkPgpo6f/LoGn2CrAu/5dUXixLHq/0xo8P/y8zM9UdbRdXEQF1cctCPpH
   A==;
X-CSE-ConnectionGUID: uhErkB75T/uyhtEkYP7ueg==
X-CSE-MsgGUID: 8TwdY1gCSkCZbjeCNJuYZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="88498895"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="88498895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 12:04:32 -0700
X-CSE-ConnectionGUID: kTRfm9hAQc2LsOFcIe4s0g==
X-CSE-MsgGUID: ijiVWbh2QSmbejQ1kur8AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="229805074"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Apr 2026 12:04:31 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCMaB-000000000ln-3M2X;
	Mon, 13 Apr 2026 19:04:27 +0000
Date: Tue, 14 Apr 2026 03:03:45 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 "Thomas =?utf-8?Q?Hellstr=C3=B6m"?= <thomas.hellstrom@linux.intel.com>
Subject: [drm-misc:drm-misc-next 1/5]
 include/linux/compiler_types.h:706:45: error: call to
 '__compiletime_assert_354' declared with attribute error: BUILD_BUG failed
Message-ID: <202604140222.WtXCFc4A-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   5f183b0588eb508ab49022e26923d91698447226
commit: 37ad039fb3674a36dbf082fa5c864af1b791eccd [1/5] drm/gpusvm: Use dma-map IOVA alloc, link, and sync API in GPU SVM
config: openrisc-randconfig-r054-20260413 (https://download.01.org/0day-ci/archive/20260414/202604140222.WtXCFc4A-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140222.WtXCFc4A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140222.WtXCFc4A-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/gpu/drm/drm_gpusvm.c: In function 'drm_gpusvm_get_pages':
>> include/linux/compiler_types.h:706:45: error: call to '__compiletime_assert_354' declared with attribute error: BUILD_BUG failed
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:687:25: note: in definition of macro '__compiletime_assert'
     687 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_compiletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:60:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      60 | #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
         |                     ^~~~~~~~~~~~~~~~
   include/linux/huge_mm.h:113:28: note: in expansion of macro 'BUILD_BUG'
     113 | #define HPAGE_PMD_SHIFT ({ BUILD_BUG(); 0; })
         |                            ^~~~~~~~~
   include/linux/huge_mm.h:120:35: note: in expansion of macro 'HPAGE_PMD_SHIFT'
     120 | #define HPAGE_PMD_SIZE  ((1UL) << HPAGE_PMD_SHIFT)
         |                                   ^~~~~~~~~~~~~~~
   drivers/gpu/drm/drm_gpusvm.c:1555:52: note: in expansion of macro 'HPAGE_PMD_SIZE'
    1555 |                                                    HPAGE_PMD_SIZE ?
         |                                                    ^~~~~~~~~~~~~~


vim +/__compiletime_assert_354 +706 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  702   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  704   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  705  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @706  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  707  

:::::: The code at line 706 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
