Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA883E7BD5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 May 2026 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779194810; cv=none; b=WNZCgHa3YwGjouuRSOVsQU3+yEC5IRx5WScYw51qDcYqUUS3mOIQDepVyPOW6D776S6XpAkXJJOpKs+h4/3PWgVUDY+vRp/EVlym61ow+dHw48RKilffJv0tfCHfE0hqwVbYI/Or2s6Od4UWcws9Dt5Is1XvgaGdaaxL0+0A0eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779194810; c=relaxed/simple;
	bh=vDd6+/LlZXuQIdC9oRq+Qfyw0chZbpiBnLfYuEbytYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KFykHEgqJgvRdrwkUEG6pad6SKPcm8m83Kft5rzwW8hYcrYWfy5/+0x81XteSpfo4s5+k/k+odraUmkBTMWpaNua7DXb8iIn4SQO/Jo1Z9TjSU5qPE0R9VLZ8wprBQptoBeK+dM4EtZnB+sl21V9hIDjWOC4h32bZAAkVzvTPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EHgNd9Ms; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EHgNd9Ms"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779194807; x=1810730807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDd6+/LlZXuQIdC9oRq+Qfyw0chZbpiBnLfYuEbytYI=;
  b=EHgNd9Ms/JQ2KEsFwR2J9H07RFCTv+kQkkGuix4HO1zhk41wZgHth/yM
   s+UOvXe1rDjVCLvLoqYk5brbgricYKOL7kqiUEZtpQQb5sLl1l6VQlgqQ
   R3k73WunfAMZBaC6reEcZNWAP7ktwq76Zy20yPN6Toh59u1PdgqSHS3rv
   fnjsHUu5NXOM9e333WGYdNNMuvKMtqqNuriAX/nLyOYjrLSIp7NPcsRGT
   9+nb3b5aS8h6xam7khWjiVVoCJbywvO9K4MpkWzYRuIC9nCgjr5FLxo3P
   C85G4lR1RXghRIfjGh8hkomRS+8d9gV+g33pYk7UwpSAA8hZijpZk7ipg
   g==;
X-CSE-ConnectionGUID: MO12kzq0T4qdhJPgrs4Lyw==
X-CSE-MsgGUID: gqGBoy09T/+SCIpsOctn/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79092449"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79092449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 05:46:47 -0700
X-CSE-ConnectionGUID: CP+x1F7MQISf33dzMajw7g==
X-CSE-MsgGUID: ATkBfnbnRqKVnbL+h61kAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="239619097"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 19 May 2026 05:46:45 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPJqM-00000000145-1UVQ;
	Tue, 19 May 2026 12:46:42 +0000
Date: Tue, 19 May 2026 20:46:34 +0800
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
Message-ID: <202605192042.HZrKLrET-lkp@intel.com>
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
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260519/202605192042.HZrKLrET-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260519/202605192042.HZrKLrET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605192042.HZrKLrET-lkp@intel.com/

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

   > 8	#include <kunit/test.h>
     9	
    10	#include "amdgpu_dm_crc.h"
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
