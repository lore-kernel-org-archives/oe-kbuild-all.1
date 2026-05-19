Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21AA48033C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 11:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190461; cv=none; b=fOJV+DFn018S6LVP/Tr68SpV90j97VDh+yFcw4t9fI7KIVjYLmNPB1aY4FivgFgmgctwpEe7FVLje0ArhuuI9I/gYtylmXUdxItAUY471nORQwHcY8iD+ZutVFq4YFPonDYcEfCOYMR0QPgsCLH4+BdMjx4E3Q+gGJGDwbMtvfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190461; c=relaxed/simple;
	bh=VnrkR2lYQxrNF6eYPJNuFtmvsDFBmFb2sY27tuspHiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bCB52NTmMNzxZ81iM7gJ/UM2rfDnLbEH+0pIECR0DMoxE+5cuyaOmt+zrA+Bhz8Ni5vmeNe6FvoGPGp7vpSvEw6EWX1Xv/oiEFLMBjRPFo6BmCYwS+N/V7DRlibOPYNcBIcCy04X1s0wco+BdomVj+xFljoxz4F+zyrNIomLVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SjwXcchG; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SjwXcchG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779190459; x=1810726459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VnrkR2lYQxrNF6eYPJNuFtmvsDFBmFb2sY27tuspHiQ=;
  b=SjwXcchGVerR2gLcILLAY3KW8iu5sVhnsRRexFRWUr3ggqYHOIX4kFb+
   +VwavOTA7QUCjFTerrYkhfX2hi0Hp2gMdBdMmLjeDnQah3Tntvz4AqMSz
   /7swuEJx4KmpFzw4qLSUEKEncN7zakj9HrLk8NWsKmyDBHq0bR2cq4uGO
   kzzRfEQfT8o4JZ4GP78Y5yqEbNlHguMzBAqtvds5VB2yFQRHKyETOiZI/
   zj+tpD7/sXZXqIJ4JoJoqeRB7mlYJAUn6OkGD47FEpO8PTj2uQqKswpB3
   WJdWTazx2FrgICXkWX918QqS7hqpA8AaN4Sk6J8H9QrE9zaXaJf1s9oWt
   Q==;
X-CSE-ConnectionGUID: 5bYKmdzgSM2u+T2G+MIzGA==
X-CSE-MsgGUID: Fdr1XDWyTHObNc8T2c3J1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="91170331"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91170331"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:34:18 -0700
X-CSE-ConnectionGUID: XRH/7MuTTUi47jDcUTuZDg==
X-CSE-MsgGUID: ooiU6rZ2SqaPZvchNEh8Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="244733396"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 19 May 2026 04:34:15 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPIiD-00000000ABB-1AwG;
	Tue, 19 May 2026 11:34:13 +0000
Date: Tue, 19 May 2026 13:33:33 +0200
From: kernel test robot <lkp@intel.com>
To: Aurabindo Pillai <aurabindo.pillai@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>
Subject: [agd5f:drm-next 33/58]
 =?us-ascii?Q?drivers/gpu/drm/amd/amdgpu/../display/amdgpu=5Fdm/tests/amd?=
 =?us-ascii?Q?gpu=5Fdm=5Fcrc=5Ftest.c:14:63:?= error: implicit declaration
 of function 'dm_parse_crc_source'; did you mean
 'dm_test_parse_crc_source_none'?
Message-ID: <202605191323.u8Rf5Jfd-lkp@intel.com>
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
commit: f78ca8d95cff848dafe09f260d1c637ae9d34565 [33/58] drm/amd/display: Add KUnit test for CRC function
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20260519/202605191323.u8Rf5Jfd-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605191323.u8Rf5Jfd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605191323.u8Rf5Jfd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:48:32: warning: no previous prototype for 'dm_parse_crc_source' [-Wmissing-prototypes]
      48 | enum amdgpu_dm_pipe_crc_source dm_parse_crc_source(const char *source)
         |                                ^~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:66:6: warning: no previous prototype for 'dm_is_crc_source_crtc' [-Wmissing-prototypes]
      66 | bool dm_is_crc_source_crtc(enum amdgpu_dm_pipe_crc_source src)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:74:6: warning: no previous prototype for 'dm_is_crc_source_dprx' [-Wmissing-prototypes]
      74 | bool dm_is_crc_source_dprx(enum amdgpu_dm_pipe_crc_source src)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:82:6: warning: no previous prototype for 'dm_need_crc_dither' [-Wmissing-prototypes]
      82 | bool dm_need_crc_dither(enum amdgpu_dm_pipe_crc_source src)
         |      ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:8:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c: In function 'dm_test_parse_crc_source_none':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:14:63: error: implicit declaration of function 'dm_parse_crc_source'; did you mean 'dm_test_parse_crc_source_none'? [-Wimplicit-function-declaration]
      14 |         KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_NONE, dm_parse_crc_source("none"));
         |                                                               ^~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:840:22: note: in definition of macro 'KUNIT_BASE_BINARY_ASSERTION'
     840 |         const typeof(right) __right = (right);                                 \
         |                      ^~~~~
   include/kunit/test.h:1036:9: note: in expansion of macro 'KUNIT_BINARY_INT_ASSERTION'
    1036 |         KUNIT_BINARY_INT_ASSERTION(test,                                       \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1033:9: note: in expansion of macro 'KUNIT_EXPECT_EQ_MSG'
    1033 |         KUNIT_EXPECT_EQ_MSG(test, left, right, NULL)
         |         ^~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:14:9: note: in expansion of macro 'KUNIT_EXPECT_EQ'
      14 |         KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_NONE, dm_parse_crc_source("none"));
         |         ^~~~~~~~~~~~~~~
   In file included from include/linux/err.h:5,
                    from include/kunit/assert.h:12,
                    from include/kunit/test.h:12:
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c: In function 'dm_test_is_crc_source_crtc':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:53:33: error: implicit declaration of function 'dm_is_crc_source_crtc'; did you mean 'dm_test_is_crc_source_crtc'? [-Wimplicit-function-declaration]
      53 |         KUNIT_EXPECT_TRUE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC));
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     993 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:53:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
      53 |         KUNIT_EXPECT_TRUE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC));
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c: In function 'dm_test_is_crc_source_dprx':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:64:33: error: implicit declaration of function 'dm_is_crc_source_dprx'; did you mean 'dm_test_is_crc_source_dprx'? [-Wimplicit-function-declaration]
      64 |         KUNIT_EXPECT_TRUE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX));
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     993 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:64:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
      64 |         KUNIT_EXPECT_TRUE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX));
         |         ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c: In function 'dm_test_need_crc_dither':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:75:33: error: implicit declaration of function 'dm_need_crc_dither'; did you mean 'dm_test_need_crc_dither'? [-Wimplicit-function-declaration]
      75 |         KUNIT_EXPECT_TRUE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_NONE));
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/kunit/test.h:800:9: note: in expansion of macro 'KUNIT_UNARY_ASSERTION'
     800 |         KUNIT_UNARY_ASSERTION(test,                                            \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:996:9: note: in expansion of macro 'KUNIT_TRUE_MSG_ASSERTION'
     996 |         KUNIT_TRUE_MSG_ASSERTION(test,                                         \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:993:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE_MSG'
     993 |         KUNIT_EXPECT_TRUE_MSG(test, condition, NULL)
         |         ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c:75:9: note: in expansion of macro 'KUNIT_EXPECT_TRUE'
      75 |         KUNIT_EXPECT_TRUE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_NONE));
         |         ^~~~~~~~~~~~~~~~~


vim +14 drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/tests/amdgpu_dm_crc_test.c

    11	
    12	static void dm_test_parse_crc_source_none(struct kunit *test)
    13	{
  > 14		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_NONE, dm_parse_crc_source("none"));
    15		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_NONE, dm_parse_crc_source(NULL));
    16	}
    17	
    18	static void dm_test_parse_crc_source_crtc(struct kunit *test)
    19	{
    20		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_CRTC, dm_parse_crc_source("crtc"));
    21		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_CRTC, dm_parse_crc_source("auto"));
    22	}
    23	
    24	static void dm_test_parse_crc_source_dprx(struct kunit *test)
    25	{
    26		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_DPRX, dm_parse_crc_source("dprx"));
    27	}
    28	
    29	static void dm_test_parse_crc_source_crtc_dither(struct kunit *test)
    30	{
    31		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_CRTC_DITHER,
    32				dm_parse_crc_source("crtc dither"));
    33	}
    34	
    35	static void dm_test_parse_crc_source_dprx_dither(struct kunit *test)
    36	{
    37		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_DPRX_DITHER,
    38				dm_parse_crc_source("dprx dither"));
    39	}
    40	
    41	static void dm_test_parse_crc_source_invalid(struct kunit *test)
    42	{
    43		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_INVALID,
    44				dm_parse_crc_source("invalid"));
    45		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_INVALID,
    46				dm_parse_crc_source("unknown"));
    47		KUNIT_EXPECT_EQ(test, AMDGPU_DM_PIPE_CRC_SOURCE_INVALID,
    48				dm_parse_crc_source(""));
    49	}
    50	
    51	static void dm_test_is_crc_source_crtc(struct kunit *test)
    52	{
  > 53		KUNIT_EXPECT_TRUE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC));
    54		KUNIT_EXPECT_TRUE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC_DITHER));
    55	
    56		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_NONE));
    57		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX));
    58		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX_DITHER));
    59		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_crtc(AMDGPU_DM_PIPE_CRC_SOURCE_INVALID));
    60	}
    61	
    62	static void dm_test_is_crc_source_dprx(struct kunit *test)
    63	{
  > 64		KUNIT_EXPECT_TRUE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX));
    65		KUNIT_EXPECT_TRUE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX_DITHER));
    66	
    67		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_NONE));
    68		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC));
    69		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC_DITHER));
    70		KUNIT_EXPECT_FALSE(test, dm_is_crc_source_dprx(AMDGPU_DM_PIPE_CRC_SOURCE_INVALID));
    71	}
    72	
    73	static void dm_test_need_crc_dither(struct kunit *test)
    74	{
  > 75		KUNIT_EXPECT_TRUE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_NONE));
    76		KUNIT_EXPECT_TRUE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC_DITHER));
    77		KUNIT_EXPECT_TRUE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX_DITHER));
    78	
    79		KUNIT_EXPECT_FALSE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_CRTC));
    80		KUNIT_EXPECT_FALSE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_DPRX));
    81		KUNIT_EXPECT_FALSE(test, dm_need_crc_dither(AMDGPU_DM_PIPE_CRC_SOURCE_INVALID));
    82	}
    83	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
