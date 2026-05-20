Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EB8230BE9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 08:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779264232; cv=none; b=CXc7A//gyYWlJnwX8JhDpQ5wMD+WBa8qUag+PEnQlQtK/zXSXqRNWzXJxhGOD/ywMD89jBMpwb0Dk4PO46+MtkoXJ2tR5Pi7/jqK787qezGBCq9fvQpXGSx5lq87K8IOzDD2KN/38ndp06oVCstcDwKEHPD00O1mxMj24dRWfy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779264232; c=relaxed/simple;
	bh=g2PsqTvNT1YUey8vAM+0FrgrWw8d4zZdXDbnbluEvmo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=G7oe1PzZwZDq7dIxjjDnbmbzMkNIP7d8doTFw68ZM9TY1H+XpO9OKhMLrYpc1TJ8AKDSo8MYO/v5KhXm94go3fUSq2NL2DDXTFOhILDSPGh+zHSdZlTuv3TuSv9OfXWxeK1QAHurgphscidPrn8tFN2IkxTmEfkfkY+FYdYv5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fhzct5a4; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fhzct5a4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779264230; x=1810800230;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2PsqTvNT1YUey8vAM+0FrgrWw8d4zZdXDbnbluEvmo=;
  b=Fhzct5a4/BM86UXyP41ZbhzXcFrxo7r6F07uP/U6QtVSLZyzb+moN4Su
   A+HF9o8qcdjCZVyfN2+K05uAZEqmTgaTZDIqkhp3R+K4xrDzpwV8WSMPp
   WoQFqmThREveum/TmK6LCS2i7WH9Q+YRE28GXtCcqZ8RSeuQ12TiGiYiE
   fRNYMhkhfdIPJAKgsx69I/PcSbmbTreX7A9l7bi8P8uiGcd9EVRSSIVW5
   oWa1GQVvE6uRwBxuYz10V0YGFSa1CiiPtXoNmmUx0YL7ekRTfpWK/QCRO
   EJr5Ol+BQZs/LrqRCaDzcQf1lGmeyiixa3TzfzE/nvkLwt765J7Umxozl
   w==;
X-CSE-ConnectionGUID: PVHtxtUvTraKCa/cDUEuMA==
X-CSE-MsgGUID: 4IIlMRQQQHKPjjkJ3UXw1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="97727244"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="97727244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:03:49 -0700
X-CSE-ConnectionGUID: 7gvAxsK2RWmrnysucSJCrQ==
X-CSE-MsgGUID: nbkXKXmjQdis8dmwsrU9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263858185"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2026 01:03:47 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPbtN-000000002lv-3YSN;
	Wed, 20 May 2026 08:03:15 +0000
Date: Wed, 20 May 2026 16:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, Ivan Lipski <ivan.lipski@amd.com>,
 Harry Wentland <harry.wentland@amd.com>
Subject: [agd5f:amd-staging-drm-next 2698/2741]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/am?=
 =?us-ascii?Q?dgpu=5Fdm=5Fcolor=5Ftest.c:549:13:?= warning: assignment to
 'const struct drm_color_lut *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202605201529.2IW8VrCI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   53f0235c0284fc676d1510a460e1c6c111de3ea1
commit: b271e52ddfe02f64e552e2c7698a8dda43fca336 [2698/2741] drm/amd/display: Add KUnit test for color helpers
config: loongarch-randconfig-002 (https://download.01.org/0day-ci/archive/20260520/202605201529.2IW8VrCI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201529.2IW8VrCI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201529.2IW8VrCI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_fixpt_from_s3132_zero':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:23:33: error: implicit declaration of function 'amdgpu_dm_fixpt_from_s3132' [-Werror=implicit-function-declaration]
      23 |         struct fixed31_32 val = amdgpu_dm_fixpt_from_s3132(0ULL);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:23:33: error: invalid initializer
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_fixpt_from_s3132_one':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:31:33: error: invalid initializer
      31 |         struct fixed31_32 val = amdgpu_dm_fixpt_from_s3132(1ULL << 32);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_fixpt_from_s3132_negative_one':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:40:33: error: invalid initializer
      40 |         struct fixed31_32 val = amdgpu_dm_fixpt_from_s3132(neg_one);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_fixpt_from_s3132_half':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:49:33: error: invalid initializer
      49 |         struct fixed31_32 val = amdgpu_dm_fixpt_from_s3132(1ULL << 31);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_fixpt_from_s3132_neg_half':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:57:33: error: invalid initializer
      57 |         struct fixed31_32 val = amdgpu_dm_fixpt_from_s3132(neg_half);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12,
                    from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:8:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_is_lut_linear_with_linear_lut':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:81:33: error: implicit declaration of function '__is_lut_linear' [-Werror=implicit-function-declaration]
      81 |         KUNIT_EXPECT_TRUE(test, __is_lut_linear(lut, size));
         |                                 ^~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:995:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     995 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:992:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     992 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:81:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
      81 |         KUNIT_EXPECT_TRUE(test, __is_lut_linear(lut, size));
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_drm_ctm_to_dc_matrix_identity':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:142:9: error: implicit declaration of function '__drm_ctm_to_dc_matrix' [-Werror=implicit-function-declaration]
     142 |         __drm_ctm_to_dc_matrix(&ctm, matrix);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_drm_ctm_3x4_to_dc_matrix_identity':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:204:9: error: implicit declaration of function '__drm_ctm_3x4_to_dc_matrix' [-Werror=implicit-function-declaration]
     204 |         __drm_ctm_3x4_to_dc_matrix(&ctm, matrix);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_tf_to_dc_tf_default':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:238:36: error: implicit declaration of function 'amdgpu_tf_to_dc_tf' [-Werror=implicit-function-declaration]
     238 |         KUNIT_EXPECT_EQ(test, (int)amdgpu_tf_to_dc_tf(AMDGPU_TRANSFER_FUNCTION_DEFAULT),
         |                                    ^~~~~~~~~~~~~~~~~~
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:238:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     238 |         KUNIT_EXPECT_EQ(test, (int)amdgpu_tf_to_dc_tf(AMDGPU_TRANSFER_FUNCTION_DEFAULT),
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_colorop_tf_to_dc_tf_srgb':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:300:36: error: implicit declaration of function 'amdgpu_colorop_tf_to_dc_tf'; did you mean 'dm_test_colorop_tf_to_dc_tf_srgb'? [-Werror=implicit-function-declaration]
     300 |         KUNIT_EXPECT_EQ(test, (int)amdgpu_colorop_tf_to_dc_tf(DRM_COLOROP_1D_CURVE_SRGB_EOTF),
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:839:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     839 |         const typeof(left) __left = (left);                                    \
         |                      ^~~~
   include/kunit/test.h:1035:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1035 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1032:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1032 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:300:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
     300 |         KUNIT_EXPECT_EQ(test, (int)amdgpu_colorop_tf_to_dc_tf(DRM_COLOROP_1D_CURVE_SRGB_EOTF),
         |         ^~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_drm_lut_to_dc_gamma_legacy_zero':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:350:9: error: implicit declaration of function '__drm_lut_to_dc_gamma' [-Werror=implicit-function-declaration]
     350 |         __drm_lut_to_dc_gamma(lut, gamma, true);
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_drm_lut32_to_dc_gamma_zero':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:477:9: error: implicit declaration of function '__drm_lut32_to_dc_gamma'; did you mean 'dm_test_drm_lut32_to_dc_gamma_zero'? [-Werror=implicit-function-declaration]
     477 |         __drm_lut32_to_dc_gamma(lut, gamma);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
         |         dm_test_drm_lut32_to_dc_gamma_zero
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_extract_blob_lut_null':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:549:15: error: implicit declaration of function '__extract_blob_lut' [-Werror=implicit-function-declaration]
     549 |         lut = __extract_blob_lut(NULL, &size);
         |               ^~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:549:13: warning: assignment to 'const struct drm_color_lut *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     549 |         lut = __extract_blob_lut(NULL, &size);
         |             ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_extract_blob_lut_valid':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:576:13: warning: assignment to 'const struct drm_color_lut *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     576 |         lut = __extract_blob_lut(blob, &size);
         |             ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_extract_blob_lut32_null':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:592:15: error: implicit declaration of function '__extract_blob_lut32'; did you mean 'dm_test_extract_blob_lut32_null'? [-Werror=implicit-function-declaration]
     592 |         lut = __extract_blob_lut32(NULL, &size);
         |               ^~~~~~~~~~~~~~~~~~~~
         |               dm_test_extract_blob_lut32_null
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:592:13: warning: assignment to 'const struct drm_color_lut32 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     592 |         lut = __extract_blob_lut32(NULL, &size);
         |             ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_extract_blob_lut32_valid':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:619:13: warning: assignment to 'const struct drm_color_lut32 *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     619 |         lut = __extract_blob_lut32(blob, &size);
         |             ^
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_to_dc_lut3d_color_zero':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:635:9: error: implicit declaration of function '__to_dc_lut3d_color' [-Werror=implicit-function-declaration]
     635 |         __to_dc_lut3d_color(&rgb, lut, 12);
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_3dlut_to_dc_3dlut_distribution':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:701:9: error: implicit declaration of function '__drm_3dlut_to_dc_3dlut' [-Werror=implicit-function-declaration]
     701 |         __drm_3dlut_to_dc_3dlut(lut, lut3d_size, params, true, 12);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_to_dc_lut3d_32_color_zero':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:818:9: error: implicit declaration of function '__to_dc_lut3d_32_color'; did you mean 'dm_test_to_dc_lut3d_32_color_zero'? [-Werror=implicit-function-declaration]
     818 |         __to_dc_lut3d_32_color(&rgb, lut, 12);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         dm_test_to_dc_lut3d_32_color_zero
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c: In function 'dm_test_3dlut32_to_dc_3dlut_distribution':
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c:884:9: error: implicit declaration of function '__drm_3dlut32_to_dc_3dlut' [-Werror=implicit-function-declaration]
     884 |         __drm_3dlut32_to_dc_3dlut(lut, lut3d_size, params, true, 12);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +549 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_color_test.c

   543	
   544	static void dm_test_extract_blob_lut_null(struct kunit *test)
   545	{
   546		uint32_t size = 42;
   547		const struct drm_color_lut *lut;
   548	
 > 549		lut = __extract_blob_lut(NULL, &size);
   550	
   551		KUNIT_EXPECT_NULL(test, lut);
   552		KUNIT_EXPECT_EQ(test, size, 0);
   553	}
   554	
   555	static void dm_test_extract_blob_lut_valid(struct kunit *test)
   556	{
   557		const int num_entries = 4;
   558		struct drm_property_blob *blob;
   559		struct drm_color_lut *data;
   560		const struct drm_color_lut *lut;
   561		uint32_t size = 0;
   562	
   563		blob = kunit_kzalloc(test, sizeof(*blob), GFP_KERNEL);
   564		KUNIT_ASSERT_NOT_NULL(test, blob);
   565	
   566		data = kunit_kcalloc(test, num_entries, sizeof(*data), GFP_KERNEL);
   567		KUNIT_ASSERT_NOT_NULL(test, data);
   568	
   569		data[0].red = 100;
   570		data[0].green = 200;
   571		data[0].blue = 300;
   572	
   573		blob->data = data;
   574		blob->length = num_entries * sizeof(struct drm_color_lut);
   575	
   576		lut = __extract_blob_lut(blob, &size);
   577	
   578		KUNIT_EXPECT_EQ(test, size, (uint32_t)num_entries);
   579		KUNIT_ASSERT_NOT_NULL(test, lut);
   580		KUNIT_EXPECT_EQ(test, lut[0].red, 100);
   581		KUNIT_EXPECT_EQ(test, lut[0].green, 200);
   582		KUNIT_EXPECT_EQ(test, lut[0].blue, 300);
   583	}
   584	
   585	/* ---- Tests for __extract_blob_lut32 ---- */
   586	
   587	static void dm_test_extract_blob_lut32_null(struct kunit *test)
   588	{
   589		uint32_t size = 42;
   590		const struct drm_color_lut32 *lut;
   591	
 > 592		lut = __extract_blob_lut32(NULL, &size);
   593	
   594		KUNIT_EXPECT_NULL(test, lut);
   595		KUNIT_EXPECT_EQ(test, size, 0);
   596	}
   597	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
