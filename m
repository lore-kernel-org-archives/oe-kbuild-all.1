Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06B33E3C5F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Mar 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773787255; cv=none; b=oRmlwA0rMmUP3BdD8+8WMJADYLOil7cbKJUpgAHOdlS1kcCMYt8/1nk/cBvbU7sPP28eV1qogAM9x4oxgHYIfyrgUeA1XBueJIIhjVi04etRoiKWp4EyjcVG+L6y3kY8ftd/icH8w8cR+zUZPOC4D+SZ24V9cZ04mxtt6VFL7QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773787255; c=relaxed/simple;
	bh=UlXCe1u29qqPaTXbZmfpjYwqNrDWXfGSvrcekMf5W6Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P0dGSEVRdqqC8qbIyia7C+0GitE2RWeLA1cwyOjmAAF+0aUQDxPsVia+jD+nruuKMHxryScbbA4QIhU/swPgxUIqmwKQl4xd9uhtk5/keMUQq6Q69W/hw+6rTuEoY0SYaozyucCKgjLv8egj99A9TRYH540IENSyMkJAOfpPtss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E35bfxOX; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E35bfxOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773787254; x=1805323254;
  h=date:from:to:cc:subject:message-id;
  bh=UlXCe1u29qqPaTXbZmfpjYwqNrDWXfGSvrcekMf5W6Q=;
  b=E35bfxOXbkrU921Fnawj9WY1bdq5JpK4Cg5nQNIbkxqfE8QNRL6IsJhH
   PQe+XOZND1Lm2uX9nskIVZxdSJ9IJDQQ+Z3ABhwJjBInCcqQAByDHyXcD
   uj17zxPep6C6MalMZB29t67IB2fN8EzNB2ZUGVgjK5CFSr8xEFfe9PCiz
   dWN2DgVrCkEIOheHlwdy2fNe78biRAUwaQj1OPs+Ax93/GRRbIoFph05p
   emzg3+YwR7zcfHhiSC7dTU0BN1D4ObVR0gmvF/gxfPdHKt0vfYm17hhea
   j/LMmk2zNffxY2O2d3HgE8Lp8x+cih0J6vMj1JHMy36PmIRkvgoeiUV4Z
   g==;
X-CSE-ConnectionGUID: ZYtwNln4Ty6SSC2r/rBQOQ==
X-CSE-MsgGUID: cQtRPdALR6GZhImKY8eOQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74914666"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="74914666"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 15:40:53 -0700
X-CSE-ConnectionGUID: 2QT+a0uHR1ebcZmxZ7/9Zg==
X-CSE-MsgGUID: wrwNyQFiRy+EXNUg1x3pyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="222464717"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Mar 2026 15:40:51 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2d5k-00000000281-1CX7;
	Tue, 17 Mar 2026 22:40:48 +0000
Date: Wed, 18 Mar 2026 06:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: include/linux/compiler_types.h:568:45: error: call to
 '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON
 failed: sizeof(priv_tbl->probs) % 16
Message-ID: <202603180603.Hs4sVzie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Detlev,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0caa1d49cc07b30a7e2f104d3853ec6dc1c3cad
commit: d968e50b5c26642754492dea23cbd3592bde62d8 media: rkvdec: Unstage the driver
date:   8 months ago
config: arm-randconfig-r062-20260318 (https://download.01.org/0day-ci/archive/20260318/202603180603.Hs4sVzie-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603180603.Hs4sVzie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603180603.Hs4sVzie-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c: In function 'rkvdec_vp9_start':
>> include/linux/compiler_types.h:568:45: error: call to '__compiletime_assert_542' declared with attribute error: BUILD_BUG_ON failed: sizeof(priv_tbl->probs) % 16
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
   include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   drivers/media/platform/rockchip/rkvdec/rkvdec-vp9.c:1010:9: note: in expansion of macro 'BUILD_BUG_ON'
    1010 |         BUILD_BUG_ON(sizeof(priv_tbl->probs) % 16); /* ensure probs size is 128-bit aligned */
         |         ^~~~~~~~~~~~


vim +/__compiletime_assert_542 +568 include/linux/compiler_types.h

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
