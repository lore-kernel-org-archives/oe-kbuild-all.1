Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACAE02D46C3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 23:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751584832; cv=none; b=qQKLwVy23Hbkddn5NZaVuFv84e1PjYPQrrumHHmqpqgypQhf2M8rnRQWHb3bYQx19X3je78q2TE21dhME6CdZo8KRsjT6QQUN3t1MD8z3wCDSwoxFQKLULgQStDw27cKj2g65B9+8Enimd32PetSAIQq5ePHkUuC3I44vSvoofQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751584832; c=relaxed/simple;
	bh=iaU49mJDQ/egWSpm6/q/jZ5zJLJoj/v21ybO9/iVqe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8WalLBURU/hsuntrLt4pdroeJcT/2IcBjOMA0hSLOazinH0BZlY3SgjvWT3aL5v8FxZHGFt7ZPhjv3CUTONS0JZfJc/i7D74iU226pCmRWXTy70pcS459YNyi/JYKijp6psyguYHq/z+0jsu6qKIm/7QRQ2XlVf/AdACc7bFkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L04Q37rz; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L04Q37rz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751584831; x=1783120831;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iaU49mJDQ/egWSpm6/q/jZ5zJLJoj/v21ybO9/iVqe0=;
  b=L04Q37rzzG3TSSqybxS8K5YENr8G8enfmPLN4Bk9UM3rXS+GZnuzyEcR
   smD7S77crv/01Iny3/KPDu9Gi2SmzeV2Afe2ti9zUpV1dY6hwOM0ko+FX
   XboJ/IopALAv1Nz60rhtpPOiCT2SZfIyTKvH81Zl8gQRq2o0/ido4narY
   XUYdamtfaAa6+M1mybuJandoLK+P2tK72jLqx3YFiD9izKv1ZwQmCVyc0
   WBryDRoGkESejnNxPODDWK42lqZlYYCo4e/qGtSw7mkOdClX1cDz9ijhG
   PFJGQqv3D/XtAzq2KnBCn4XUFrOviTmBynJHz1JIafOdHQDnDCh3f2qua
   Q==;
X-CSE-ConnectionGUID: iuZU2WUrQGWXvMkNMADZTg==
X-CSE-MsgGUID: SV/P34h6QhafASne8dcvbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53643240"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="53643240"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 16:20:30 -0700
X-CSE-ConnectionGUID: A6DyRzAiR8Kv2K3+f/QxPA==
X-CSE-MsgGUID: 2OPQus1LQP6tTRj7JnMkpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="154257037"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Jul 2025 16:20:29 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXTEA-00036N-1J;
	Thu, 03 Jul 2025 23:20:26 +0000
Date: Fri, 4 Jul 2025 07:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: oe-kbuild-all@lists.linux.dev, Andi Shyti <andi.shyti@kernel.org>
Subject: [andi-shyti:i2c/i2c-host-next 14/15]
 include/linux/compiler_types.h:568:45: error: call to
 '__compiletime_assert_369' declared with attribute error: min(max, 0x8 -
 tx_fstat) signedness error
Message-ID: <202507040752.385GebdM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host-next
head:   9089458addadf2fad4a8f2baf7a5d01def8a1a6d
commit: cbae4d3dd2f7f01fa8fa807c70ad2b304279fd87 [14/15] i2c: busses: Use min() to improve code
config: arc-randconfig-002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040752.385GebdM-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040752.385GebdM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040752.385GebdM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/i2c/busses/i2c-st.c: In function 'st_i2c_rd_fill_tx_fifo':
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_369' declared with attribute error: min(max, 0x8 - tx_fstat) signedness error
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |                                             ^
   include/linux/compiler_types.h:549:25: note: in definition of macro '__compiletime_assert'
     549 |                         prefix ## suffix();                             \
         |                         ^~~~~~
   include/linux/compiler_types.h:568:9: note: in expansion of macro '_compiletime_assert'
     568 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   drivers/i2c/busses/i2c-st.c:453:13: note: in expansion of macro 'min'
     453 |         i = min(max, SSC_TXFIFO_SIZE - tx_fstat);
         |             ^~~


vim +/__compiletime_assert_369 +568 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  554  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  555  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  556  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  557  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  558  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  559   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  560   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  561   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  562   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  563   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  564   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  565   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  566   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  567  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @568  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  569  

:::::: The code at line 568 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
