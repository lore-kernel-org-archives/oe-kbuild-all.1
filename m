Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CE34949E8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779187177; cv=none; b=hkVvi6f76iDXkvkl17WhPzrc7cDd5G+Jr6Yyv9GteOZnKcCHptMOkQHPiSCTVBxoQb9EqZi+I0wbYJEjv/zzKKPrlGFnjeUSHvyf0xwrvZD40k41eGeQh5rLAbNtYYndkzTCzbNBI07wj0Scp8axEiU3lGQpiQyu5utHYlOQUe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779187177; c=relaxed/simple;
	bh=doc//i3nc8WewgcZK3qsDB5S4069ZqTwYd1bivEhPXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fo37GhOcQLJ/K/eBB9Xs6rit8LkAsvcseKfbHgoZLNX3lw37QWwP3XzSyKYpo9kax87GBv7P8MRIHFs8pWWv5/2tPVSrUk+O/Jm/75cD1xMt8G9E9gE+BIQobLZnkRnmnRpuCctjEto4WWu58TPJN2NNlkIe4fX1EaWlGKAdDFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CeLkYCXg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CeLkYCXg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779187175; x=1810723175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=doc//i3nc8WewgcZK3qsDB5S4069ZqTwYd1bivEhPXA=;
  b=CeLkYCXgitSwkJkzyG/URI5JaY7FVXrWhU1v7mCaC5H9AWC9Z/Bog1eO
   7k4Pw6gQhOiSGMSgOeqyHi8VI/4yuZyfh/JGUvgH5kltcdRwtnD27aEfn
   kVm58Agf8doCjsfvTKPVMb06Pa5M4vrwOmh1nboVHhOYv8784x5r2A46m
   w4Fhp7M6v9YJMMm2+0P8UBsyJfvc9HKuIGGVJjcGb8MMcBKE+eKAXa9N2
   S40EabQhrM5ko4mx04MoRBM58fk3zDqeLSwWLaHIc17V7tbzvu599cb+8
   GB7w5dsI9bvedgaMS+DXs5tZW7rQy6mVp1JBXjEPLCg8BYNjA/qFCxOOb
   A==;
X-CSE-ConnectionGUID: /6p6e0gLT/i9uLKK6S3nHA==
X-CSE-MsgGUID: mTTN68LAQEOUQMPzEQP+LA==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="97494905"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97494905"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 03:39:35 -0700
X-CSE-ConnectionGUID: UX5MMOydQVKxfDeC5nlk1A==
X-CSE-MsgGUID: mjrriin1Qi6Sp/1HPHgHOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244724749"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2026 03:39:32 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPHqs-000000000td-0sOz;
	Tue, 19 May 2026 10:39:11 +0000
Date: Tue, 19 May 2026 18:38:44 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next 35/58]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/amd?=
 =?us-ascii?Q?gpu=5Fdm=5Fcolorop=5Ftest.c:75:13:?= error: redefinition of
 'dm_test_supported_degam_tfs_no_extra_bits'
Message-ID: <202605191855.CqE8RgiA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   99cbcb3453b7d19cab507db9313ada9a38e82d01
commit: e8a7a8b18646ba5345c1ba26ccd96d3025953e3e [35/58] drm/amd/display: Add KUnit test for colorop TF bitmasks
config: riscv-randconfig-001-20260519 (https://download.01.org/0day-ci/archive/20260519/202605191855.CqE8RgiA-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191855.CqE8RgiA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191855.CqE8RgiA-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c:75:13: error: redefinition of 'dm_test_supported_degam_tfs_no_extra_bits'
    static void dm_test_supported_degam_tfs_no_extra_bits(struct kunit *test)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c:39:13: note: previous definition of 'dm_test_supported_degam_tfs_no_extra_bits' was here
    static void dm_test_supported_degam_tfs_no_extra_bits(struct kunit *test)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c:8:
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c:140:13: error: 'dm_test_supported_shaper_tfs_no_extra_bits' undeclared here (not in a function); did you mean 'dm_test_supported_blnd_tfs_no_extra_bits'?
     KUNIT_CASE(dm_test_supported_shaper_tfs_no_extra_bits),
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:165:17: note: in definition of macro 'KUNIT_CASE'
      { .run_case = test_name, .name = #test_name, \
                    ^~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c:39:13: warning: 'dm_test_supported_degam_tfs_no_extra_bits' defined but not used [-Wunused-function]
    static void dm_test_supported_degam_tfs_no_extra_bits(struct kunit *test)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dm_test_supported_degam_tfs_no_extra_bits +75 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_colorop_test.c

   > 8	#include <kunit/test.h>
     9	#include <drm/drm_colorop.h>
    10	
    11	#include "amdgpu_dm_colorop.h"
    12	
    13	/* Tests for amdgpu_dm_supported_degam_tfs */
    14	
    15	static void dm_test_supported_degam_tfs_has_srgb_eotf(struct kunit *test)
    16	{
    17		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_degam_tfs &
    18				  BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF));
    19	}
    20	
    21	static void dm_test_supported_degam_tfs_has_pq125_eotf(struct kunit *test)
    22	{
    23		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_degam_tfs &
    24				  BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF));
    25	}
    26	
    27	static void dm_test_supported_degam_tfs_has_bt2020_inv_oetf(struct kunit *test)
    28	{
    29		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_degam_tfs &
    30				  BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF));
    31	}
    32	
    33	static void dm_test_supported_degam_tfs_has_gamma22_inv(struct kunit *test)
    34	{
    35		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_degam_tfs &
    36				  BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV));
    37	}
    38	
  > 39	static void dm_test_supported_degam_tfs_no_extra_bits(struct kunit *test)
    40	{
    41		u64 expected = BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
    42			       BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
    43			       BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
    44			       BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
    45	
    46		KUNIT_EXPECT_EQ(test, amdgpu_dm_supported_degam_tfs, expected);
    47	}
    48	
    49	/* Tests for amdgpu_dm_supported_shaper_tfs */
    50	
    51	static void dm_test_supported_shaper_tfs_has_srgb_inv_eotf(struct kunit *test)
    52	{
    53		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_shaper_tfs &
    54				  BIT(DRM_COLOROP_1D_CURVE_SRGB_INV_EOTF));
    55	}
    56	
    57	static void dm_test_supported_shaper_tfs_has_pq125_inv_eotf(struct kunit *test)
    58	{
    59		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_shaper_tfs &
    60				  BIT(DRM_COLOROP_1D_CURVE_PQ_125_INV_EOTF));
    61	}
    62	
    63	static void dm_test_supported_shaper_tfs_has_bt2020_oetf(struct kunit *test)
    64	{
    65		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_shaper_tfs &
    66				  BIT(DRM_COLOROP_1D_CURVE_BT2020_OETF));
    67	}
    68	
    69	static void dm_test_supported_shaper_tfs_has_gamma22(struct kunit *test)
    70	{
    71		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_shaper_tfs &
    72				  BIT(DRM_COLOROP_1D_CURVE_GAMMA22));
    73	}
    74	
  > 75	static void dm_test_supported_degam_tfs_no_extra_bits(struct kunit *test)
    76	{
    77		u64 expected = BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
    78			       BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
    79			       BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
    80			       BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
    81	
    82		KUNIT_EXPECT_EQ(test, amdgpu_dm_supported_shaper_tfs, expected);
    83	}
    84	
    85	/* Tests for amdgpu_dm_supported_blnd_tfs */
    86	
    87	static void dm_test_supported_blnd_tfs_has_srgb_eotf(struct kunit *test)
    88	{
    89		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_blnd_tfs &
    90				  BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF));
    91	}
    92	
    93	static void dm_test_supported_blnd_tfs_has_pq125_eotf(struct kunit *test)
    94	{
    95		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_blnd_tfs &
    96				  BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF));
    97	}
    98	
    99	static void dm_test_supported_blnd_tfs_has_bt2020_inv_oetf(struct kunit *test)
   100	{
   101		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_blnd_tfs &
   102				  BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF));
   103	}
   104	
   105	static void dm_test_supported_blnd_tfs_has_gamma22_inv(struct kunit *test)
   106	{
   107		KUNIT_EXPECT_TRUE(test, amdgpu_dm_supported_blnd_tfs &
   108				  BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV));
   109	}
   110	
   111	static void dm_test_supported_blnd_tfs_no_extra_bits(struct kunit *test)
   112	{
   113		u64 expected = BIT(DRM_COLOROP_1D_CURVE_SRGB_EOTF) |
   114			       BIT(DRM_COLOROP_1D_CURVE_PQ_125_EOTF) |
   115			       BIT(DRM_COLOROP_1D_CURVE_BT2020_INV_OETF) |
   116			       BIT(DRM_COLOROP_1D_CURVE_GAMMA22_INV);
   117	
   118		KUNIT_EXPECT_EQ(test, amdgpu_dm_supported_blnd_tfs, expected);
   119	}
   120	
   121	/* degam and blnd should support the same set of EOTF curves */
   122	static void dm_test_degam_and_blnd_tfs_match(struct kunit *test)
   123	{
   124		KUNIT_EXPECT_EQ(test, amdgpu_dm_supported_degam_tfs,
   125				amdgpu_dm_supported_blnd_tfs);
   126	}
   127	
   128	static struct kunit_case dm_colorop_test_cases[] = {
   129		/* degam TFs */
   130		KUNIT_CASE(dm_test_supported_degam_tfs_has_srgb_eotf),
   131		KUNIT_CASE(dm_test_supported_degam_tfs_has_pq125_eotf),
   132		KUNIT_CASE(dm_test_supported_degam_tfs_has_bt2020_inv_oetf),
   133		KUNIT_CASE(dm_test_supported_degam_tfs_has_gamma22_inv),
   134		KUNIT_CASE(dm_test_supported_degam_tfs_no_extra_bits),
   135		/* shaper TFs */
   136		KUNIT_CASE(dm_test_supported_shaper_tfs_has_srgb_inv_eotf),
   137		KUNIT_CASE(dm_test_supported_shaper_tfs_has_pq125_inv_eotf),
   138		KUNIT_CASE(dm_test_supported_shaper_tfs_has_bt2020_oetf),
   139		KUNIT_CASE(dm_test_supported_shaper_tfs_has_gamma22),
 > 140		KUNIT_CASE(dm_test_supported_shaper_tfs_no_extra_bits),
   141		/* blnd TFs */
   142		KUNIT_CASE(dm_test_supported_blnd_tfs_has_srgb_eotf),
   143		KUNIT_CASE(dm_test_supported_blnd_tfs_has_pq125_eotf),
   144		KUNIT_CASE(dm_test_supported_blnd_tfs_has_bt2020_inv_oetf),
   145		KUNIT_CASE(dm_test_supported_blnd_tfs_has_gamma22_inv),
   146		KUNIT_CASE(dm_test_supported_blnd_tfs_no_extra_bits),
   147		/* cross-check */
   148		KUNIT_CASE(dm_test_degam_and_blnd_tfs_match),
   149		{}
   150	};
   151	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
