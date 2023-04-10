Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 280906FB4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Apr 2023 22:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681165485; x=1712701485;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=61JtuA/Yqc6GvCbyWFuZEwDmZyCoERMjaVDyrYLHlD8=;
  b=dgt8TDnI1NUlOsvgZgON7Dqaw6VTDEo9Mcoj6JQAto/bhLiI//U1oxOT
   +xb22juhmJiUv3/Xp6tf2D75JhN4D4J0vC9Xm7Fmw4MBr+hEPmPshQBZh
   W/EU9TFMwhsboDqSHykxMddBurQXBDbnrtadAXBNtNAkTx1M2rW3hadB/
   KBANAiFR+FSa2CalXtPmPqm8rqjch2OR8xAH5Aa9mplDF8jgcGMmHQ1e8
   sdA42sxhMPvmgKI3qmDAJjLrSOaNlWIasKnJ37WxPucif2L8q75SHAsy3
   w9T7igmEeoAO82ahZvfGDJvPzpbvDorzzguQ7OX/rAMIg4eHTELJEMbdJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="327563515"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="327563515"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 15:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="757598782"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; 
   d="scan'208";a="757598782"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Apr 2023 15:24:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plzwH-000VhZ-2d;
	Mon, 10 Apr 2023 22:24:41 +0000
Date: Tue, 11 Apr 2023 06:23:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 28453/30000]
 drivers/gpu/drm/tests/drm_plane_helper_test.c:224:1: warning: the frame size
 of 2512 bytes is larger than 2048 bytes
Message-ID: <202304110656.tqRbtAqf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Maíra,

First bad commit (maybe != root cause):

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   8bbc3e5423732ac191156098468b953539d81dfb
commit: 6e2ede1e85430f88118c237fafc9ebc3cff2bc35 [28453/30000] UPSTREAM: drm: selftest: convert drm_plane_helper selftest to KUnit
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20230411/202304110656.tqRbtAqf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 6e2ede1e85430f88118c237fafc9ebc3cff2bc35
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um olddefconfig
        make W=1 O=build_dir ARCH=um SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304110656.tqRbtAqf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_plane_helper_test.c: In function 'igt_check_plane_state':
>> drivers/gpu/drm/tests/drm_plane_helper_test.c:224:1: warning: the frame size of 2512 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     224 | }
         | ^


vim +224 drivers/gpu/drm/tests/drm_plane_helper_test.c

7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   76  
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08   77  static void igt_check_plane_state(struct kunit *test)
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   78  {
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   79  	int ret;
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   80  
a9317980c6e197 drivers/gpu/drm/selftests/test-drm_plane_helper.c Nathan Chancellor 2022-03-02   81  	static const struct drm_crtc_state crtc_state = {
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   82  		.crtc = ZERO_SIZE_PTR,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   83  		.enable = true,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   84  		.active = true,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   85  		.mode = {
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08   86  			DRM_MODE("1024x768", 0, 65000, 1024, 1048, 1184, 1344, 0, 768, 771,
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08   87  				 777, 806, 0, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   88  		},
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   89  	};
a9317980c6e197 drivers/gpu/drm/selftests/test-drm_plane_helper.c Nathan Chancellor 2022-03-02   90  	static struct drm_plane plane = {
f0f4e8ec75d323 drivers/gpu/drm/selftests/test-drm_plane_helper.c Claudio Suarez    2021-12-02   91  		.dev = NULL
f0f4e8ec75d323 drivers/gpu/drm/selftests/test-drm_plane_helper.c Claudio Suarez    2021-12-02   92  	};
a9317980c6e197 drivers/gpu/drm/selftests/test-drm_plane_helper.c Nathan Chancellor 2022-03-02   93  	static struct drm_framebuffer fb = {
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   94  		.width = 2048,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   95  		.height = 2048
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   96  	};
a9317980c6e197 drivers/gpu/drm/selftests/test-drm_plane_helper.c Nathan Chancellor 2022-03-02   97  	static struct drm_plane_state plane_state = {
f0f4e8ec75d323 drivers/gpu/drm/selftests/test-drm_plane_helper.c Claudio Suarez    2021-12-02   98  		.plane = &plane,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03   99  		.crtc = ZERO_SIZE_PTR,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  100  		.fb = &fb,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  101  		.rotation = DRM_MODE_ROTATE_0
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  102  	};
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  103  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  104  	/* Simple clipping, no scaling. */
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  105  	set_src(&plane_state, 0, 0, fb.width << 16, fb.height << 16);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  106  	set_crtc(&plane_state, 0, 0, fb.width, fb.height);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  107  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  108  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  109  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  110  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  111  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  112  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  113  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1024 << 16, 768 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  114  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  115  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  116  	/* Rotated clipping + reflection, no scaling. */
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  117  	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  118  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  119  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  120  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  121  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  122  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  123  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  124  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 768 << 16, 1024 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  125  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  126  	plane_state.rotation = DRM_MODE_ROTATE_0;
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  127  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  128  	/* Check whether positioning works correctly. */
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  129  	set_src(&plane_state, 0, 0, 1023 << 16, 767 << 16);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  130  	set_crtc(&plane_state, 0, 0, 1023, 767);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  131  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  132  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  133  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  134  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  135  	KUNIT_EXPECT_TRUE_MSG(test, ret,
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  136  			      "Should not be able to position on the crtc with can_position=false\n");
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  137  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  138  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  139  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  140  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  141  						  true, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  142  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  143  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  144  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 1023 << 16, 767 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  145  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1023, 767));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  146  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  147  	/* Simple scaling tests. */
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  148  	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  149  	set_crtc(&plane_state, 0, 0, 1024, 768);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  150  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  151  						  0x8001,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  152  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  153  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  154  	KUNIT_EXPECT_TRUE_MSG(test, ret, "Upscaling out of range should fail.\n");
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  155  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  156  						  0x8000,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  157  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  158  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  159  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  160  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  161  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 512 << 16, 384 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  162  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  163  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  164  	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  165  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  166  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  167  						  0x1ffff, false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  168  	KUNIT_EXPECT_TRUE_MSG(test, ret, "Downscaling out of range should fail.\n");
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  169  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  170  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  171  						  0x20000, false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  172  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  173  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  174  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2048 << 16, 1536 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  175  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  176  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  177  	/* Testing rounding errors. */
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  178  	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  179  	set_crtc(&plane_state, 1022, 766, 4, 4);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  180  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  181  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  182  						  0x10001,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  183  						  true, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  184  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  185  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  186  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  187  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  188  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  189  	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  190  	set_crtc(&plane_state, -2, -2, 1028, 772);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  191  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  192  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  193  						  0x10001,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  194  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  195  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  196  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  197  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0x40002, 0x40002,
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  198  					     1024 << 16, 768 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  199  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  200  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  201  	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  202  	set_crtc(&plane_state, 1022, 766, 4, 4);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  203  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  204  						  0xffff,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  205  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  206  						  true, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  207  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  208  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  209  	/* Should not be rounded to 0x20001, which would be upscaling. */
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  210  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0, 0, 2 << 16, 2 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  211  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 1022, 766, 2, 2));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  212  
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  213  	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  214  	set_crtc(&plane_state, -2, -2, 1028, 772);
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  215  	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  216  						  0xffff,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  217  						  DRM_PLANE_HELPER_NO_SCALING,
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03  218  						  false, false);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  219  	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  220  	KUNIT_EXPECT_TRUE(test, plane_state.visible);
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  221  	KUNIT_EXPECT_TRUE(test, check_src_eq(&plane_state, 0x3fffe, 0x3fffe,
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  222  					     1024 << 16, 768 << 16));
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  223  	KUNIT_EXPECT_TRUE(test, check_crtc_eq(&plane_state, 0, 0, 1024, 768));
7420e04963587d drivers/gpu/drm/selftests/test-drm-helper.c       Maarten Lankhorst 2018-05-03 @224  }
6e2ede1e85430f drivers/gpu/drm/tests/drm_plane_helper_test.c     Maíra Canal       2022-07-08  225  

:::::: The code at line 224 was first introduced by commit
:::::: 7420e04963587dc8f6d4e8b7e79b3ad7ab5c5300 drm/selftests: Add drm helper selftest

:::::: TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
:::::: CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
