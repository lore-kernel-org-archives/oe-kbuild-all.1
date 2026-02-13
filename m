Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE0333CEB5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 23:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771026116; cv=none; b=Bles99S6MAtYa+z7HGeewOam0mIfyceNrDfSBwCmtZJRYYZU8nVo5Snn90zK+byUfICXSKkZP9c4s5PTWtcLqBu7ixdK8SI42tohmt5V6vyMEaGTm+NkwmhrbHxAeFRS6UiIHb9K2fJWZMeGBuVbpM4SQwYILYr3a3R5QK1bcWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771026116; c=relaxed/simple;
	bh=yASuWK+CWH+gssb5uQAHDoMq3+351P6dL5i94/uWRWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ewZCyNLKd6tJpNiq25T6YCTzJkwbqIYrWJ2QBbtIdDmO2ZXUsYkiLyqITjvEQx+w2sja6DDSVJjeY81CagawrwNqznTjT1cWKxbmEBnQZZAiZ5nasnlX5uK0tCtNo5uqakW5D0HoNOo4RSQYDngHTrbJ+WXiS8IP3K2If9euKew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HjSMukP6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HjSMukP6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771026115; x=1802562115;
  h=date:from:to:cc:subject:message-id;
  bh=yASuWK+CWH+gssb5uQAHDoMq3+351P6dL5i94/uWRWE=;
  b=HjSMukP6b+f1z5kKNrLARbQ9X3DstlfOsm6IRxDLvbgkz2MQyz7wzn7P
   mFe6UNYdraBk7A7TAullEHB5dALcGVNxfuVDrj1l/bM/EMCqIilUTgtGw
   g+1Z+BkuWwz98dk+l0IzVut8tXTfCVyhw85OPuscfQokSEASSJDv1rdXR
   0Wk53eVRJPIuGvDLb5vcEOm1BIk2Mj8BGYnPqBG/G5xHN8+KmdyOc8kq7
   /jKHomw/qYkSQc8UGv3HHIX5qhb9yCMWHjQKph4Rzt0b0MbvzkCbws4cG
   4rGbkASomYGaQe1lCOr1S2zEAJOd+oNGsVPxDr8gAGDNfl54YRU6s0MvR
   g==;
X-CSE-ConnectionGUID: 8jyRsRwCSB6Zs87WWi3kzQ==
X-CSE-MsgGUID: BLOOQ0XSTfq+ymeZoezy8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11700"; a="89803622"
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="89803622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 15:41:53 -0800
X-CSE-ConnectionGUID: d2KKUASPTN2okwXAkklxqA==
X-CSE-MsgGUID: 8kJTPdBHTaWSxLpD3A7+eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,289,1763452800"; 
   d="scan'208";a="212894226"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 15:41:51 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vr2nE-00000000vus-3ABG;
	Fri, 13 Feb 2026 23:41:48 +0000
Date: Sat, 14 Feb 2026 07:41:29 +0800
From: kernel test robot <lkp@intel.com>
To: CL Wang <cl634@andestech.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
Subject: include/linux/compiler_types.h:630:38: error: call to
 '__compiletime_assert_332' declared with attribute error: FIELD_PREP: value
 too large for the field
Message-ID: <202602140738.P7ZozxzI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44331bd6a6107a33f8082521b227ffa4ec063a40
commit: 34e3815ea4597131d4324a4aa243d2201e672005 spi: atcspi200: Add ATCSPI200 SPI controller driver
date:   8 weeks ago
config: riscv-randconfig-001-20260214 (https://download.01.org/0day-ci/archive/20260214/202602140738.P7ZozxzI-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260214/202602140738.P7ZozxzI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602140738.P7ZozxzI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'atcspi_set_trans_ctl',
       inlined from 'atcspi_prepare_trans' at drivers/spi/spi-atcspi200.c:242:2,
       inlined from 'atcspi_exec_mem_op' at drivers/spi/spi-atcspi200.c:365:2:
>> include/linux/compiler_types.h:630:38: error: call to '__compiletime_assert_332' declared with attribute error: FIELD_PREP: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:611:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:630:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:69:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:90:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:137:3: note: in expansion of macro '__FIELD_PREP'
      __FIELD_PREP(_mask, _val, "FIELD_PREP: ");  \
      ^~~~~~~~~~~~
   drivers/spi/spi-atcspi200.c:55:28: note: in expansion of macro 'FIELD_PREP'
    #define TRANS_DUAL_QUAD(x) FIELD_PREP(GENMASK(23, 22), (x))
                               ^~~~~~~~~~
   drivers/spi/spi-atcspi200.c:198:9: note: in expansion of macro 'TRANS_DUAL_QUAD'
      tc |= TRANS_DUAL_QUAD(ffs(op->data.buswidth) - 1);
            ^~~~~~~~~~~~~~~


vim +/__compiletime_assert_332 +630 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  616  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  617  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  618  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  619  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  620  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  621   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  622   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  623   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  624   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  625   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  626   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  627   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  628   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  629  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @630  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  631  

:::::: The code at line 630 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
