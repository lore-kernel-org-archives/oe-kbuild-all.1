Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A23623394D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 01:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791336306; cv=none; b=foo6UKrK6Wi1RdoQjbQe8F3EmiXP+NmgEY3HUBBh4u1wc4M4KrgNNu9x5UOhUiuCi6gtZtqQsEeWWV5u1NQ69NqhIHQ14BBHHOIRaQgCu1YA1OP1U8q6+5KkuX/mv2BW8qGUxJVfwzaoVLMN1lYyCYrTFMNU4uo8IPtSpsYO05c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791336306; c=relaxed/simple;
	bh=1A2Etz7BPut/LXEdZangJN8k5m1Zz5tSMUYAENsq9/c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EDov8JstoJwjvN8/SE107pCeoFcySTH3eTv+n8zOqOJVyrmT6cRZSrrREMNfjtR/0+x9k+ZyVdDwHwKImSj/Isua6dgAceTNBYwmWYCdz4A7XbBTtmJcSmddtVbonVhGxdcBfIB6jebT/TmD/5JnssFKAbsoguOytEooPskfQ4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXohL/Pb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXohL/Pb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791336305; x=1822872305;
  h=date:from:to:cc:subject:message-id;
  bh=1A2Etz7BPut/LXEdZangJN8k5m1Zz5tSMUYAENsq9/c=;
  b=NXohL/Pb2uW+zqZd5CVC9DPS19vmuh54+RjNTnLzXYezFLYDZJVqnQEq
   iT3agOaHQMR+Gbjrba8kIBcAEqQrdKDo74U9zRWA4Zp9PGLmg/FM5LYE+
   VUZh6O6FmFDG3LLSLygS44iudwI2OMrEN0CD68xtHtW/AcZo2ezwiWR/6
   juhpNkYkT31Roe4Qs2xBkWDtC87LvjsFZlTNjkFjvuyjG6IiYsc75fQwM
   +2DMSZG8tn6Zuj0bLiZgF1ddZ1E8eQjJjY0uzF4rIvgDvTEIR64ZeZQww
   WdZax5Z+2dA3W7OjPuvZsuNp4Bc0lX7dVG3kEcPY00OVMZ8icfX0m5In/
   A==;
X-CSE-ConnectionGUID: pYhnYOCbQDy2L0m/FuhgXA==
X-CSE-MsgGUID: 043V78umQtSGtWLh+jggZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="81649"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="81649"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 18:25:05 -0700
X-CSE-ConnectionGUID: K18V2Hd5TyqbIugfb0H3Ww==
X-CSE-MsgGUID: LKBMjLuCRQeUNAFAZruVgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="275954779"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Oct 2026 18:25:02 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEGOy-000000002Df-0P5s;
	Wed, 07 Oct 2026 01:25:00 +0000
Date: Wed, 07 Oct 2026 03:24:30 +0200
From: kernel test robot <lkp@intel.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 9354/14724]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_545' declared with attribute error: FIELD_MODIFY: value
 too large for the field
Message-ID: <202610070334.bYvBJSpj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   eea3fef32a9cf36abcb5975a5a594e4135a6b026
commit: 86f80884fb7f4601a49444a3c36df894b218336e [9354/14724] drm/msm/a6xx: Clamp MX dependency vote
config: sparc-randconfig-r2303-20261006 (https://download.01.org/0day-ci/archive/20261007/202610070334.bYvBJSpj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610070334.bYvBJSpj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610070334.bYvBJSpj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'a6xx_gmu_rpmh_dep_votes_init',
       inlined from 'a6xx_gmu_rpmh_votes_init' at drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1892:9,
       inlined from 'a6xx_gmu_pwrlevels_probe' at drivers/gpu/drm/msm/adreno/a6xx_gmu.c:2010:9,
       inlined from 'a6xx_gmu_init' at drivers/gpu/drm/msm/adreno/a6xx_gmu.c:2488:2:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_545' declared with attribute error: FIELD_MODIFY: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:85:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:209:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");  \
      ^~~~~~~~~~~~~~~~
   drivers/gpu/drm/msm/adreno/a6xx_gmu.c:1857:3: note: in expansion of macro 'FIELD_MODIFY'
      FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
      ^~~~~~~~~~~~
--
   In file included from <command-line>:
   In function 'a6xx_gmu_rpmh_dep_votes_init',
       inlined from 'a6xx_gmu_rpmh_votes_init' at adreno/a6xx_gmu.c:1892:9,
       inlined from 'a6xx_gmu_pwrlevels_probe' at adreno/a6xx_gmu.c:2010:9,
       inlined from 'a6xx_gmu_init' at adreno/a6xx_gmu.c:2488:2:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_545' declared with attribute error: FIELD_MODIFY: value too large for the field
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:70:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
      ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:85:3: note: in expansion of macro '__BF_FIELD_CHECK_MASK'
      __BF_FIELD_CHECK_MASK(mask, val, pfx);   \
      ^~~~~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:209:3: note: in expansion of macro '__BF_FIELD_CHECK'
      __BF_FIELD_CHECK(_mask, *(_reg_p), _val, "FIELD_MODIFY: ");  \
      ^~~~~~~~~~~~~~~~
   adreno/a6xx_gmu.c:1857:3: note: in expansion of macro 'FIELD_MODIFY'
      FIELD_MODIFY(GMU_BX_MASK, &votes[i], bx);
      ^~~~~~~~~~~~


vim +/__compiletime_assert_545 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
