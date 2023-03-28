Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC25EA21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Mar 2023 04:28:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679977738; x=1711513738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jmVgf0u66F4eC5oFi4r4esWyPTFeqiE+g3WgtGR9ui8=;
  b=GzGekTUgVKxzkRUqMn1nZg39CeWvEPHafj1iHhClxwRo849LCIKQBjXS
   YLUSwIGESkqu8ofYbhmfrAsaAeDMyetpHobBAqwiB+UDDcfdB51KCQW6i
   mFZYJ7tJuLzgUZirkjdhLCbHuvqOIb+cWNM0MfbpGT8YXX/bL9c8xdOjN
   /QzHA67QcR5sfTtX2VDOrIP7oBpXHnfpxY92gPcaiGxGwxWyug6kYT7nD
   F+9cO/dn4afAOsiQxTlR5vjJOGYH+i0qVLv9g5Z3GtqNXOcQiBaoSu8o6
   pBxRkKMouy+lmQx2YYDujIOc3G0SQKxkRFtsltRQ2I3rrqaYqOUV3uU+D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="337971296"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="337971296"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 21:28:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="677218994"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="677218994"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2023 21:28:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ph0wx-000IHD-38;
	Tue, 28 Mar 2023 04:28:47 +0000
Date: Tue, 28 Mar 2023 12:28:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 28829/30000]
 drivers/gpu/drm/tests/drm_format_test.c:271:1: warning: the frame size of
 7152 bytes is larger than 2048 bytes
Message-ID: <202303281251.G4cujrg2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   2a61f3e5f1e3a7825e52e6f249678219213f29c5
commit: aec72bd13ddf9319fe3339b540d7b60efcecfe8a [28829/30000] UPSTREAM: drm: selftest: convert drm_format selftest to KUnit
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230328/202303281251.G4cujrg2-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout aec72bd13ddf9319fe3339b540d7b60efcecfe8a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/tests/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303281251.G4cujrg2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/tests/drm_format_test.c: In function 'igt_check_drm_format_min_pitch':
>> drivers/gpu/drm/tests/drm_format_test.c:271:1: warning: the frame size of 7152 bytes is larger than 2048 bytes [-Wframe-larger-than=]
     271 | }
         | ^


vim +271 drivers/gpu/drm/tests/drm_format_test.c

    93	
    94	static void igt_check_drm_format_min_pitch(struct kunit *test)
    95	{
    96		const struct drm_format_info *info = NULL;
    97	
    98		/* Test invalid arguments */
    99		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   100		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   101		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   102	
   103		/* Test 1 plane 8 bits per pixel format */
   104		info = drm_format_info(DRM_FORMAT_RGB332);
   105		KUNIT_EXPECT_TRUE(test, info);
   106		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   107		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   108		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   109	
   110		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
   111		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
   112		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
   113		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
   114		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
   115		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
   116		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
   117		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   118				(uint64_t)UINT_MAX);
   119		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   120				(uint64_t)(UINT_MAX - 1));
   121	
   122		/* Test 1 plane 16 bits per pixel format */
   123		info = drm_format_info(DRM_FORMAT_XRGB4444);
   124		KUNIT_EXPECT_TRUE(test, info);
   125		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   126		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   127		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   128	
   129		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
   130		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
   131		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1280);
   132		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 2048);
   133		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 3840);
   134		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 8192);
   135		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 1342);
   136		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   137				(uint64_t)UINT_MAX * 2);
   138		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   139				(uint64_t)(UINT_MAX - 1) * 2);
   140	
   141		/* Test 1 plane 24 bits per pixel format */
   142		info = drm_format_info(DRM_FORMAT_RGB888);
   143		KUNIT_EXPECT_TRUE(test, info);
   144		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   145		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   146		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   147	
   148		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 3);
   149		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 6);
   150		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1920);
   151		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 3072);
   152		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 5760);
   153		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 12288);
   154		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2013);
   155		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   156				(uint64_t)UINT_MAX * 3);
   157		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   158				(uint64_t)(UINT_MAX - 1) * 3);
   159	
   160		/* Test 1 plane 32 bits per pixel format */
   161		info = drm_format_info(DRM_FORMAT_ABGR8888);
   162		KUNIT_EXPECT_TRUE(test, info);
   163		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   164		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   165		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   166	
   167		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 4);
   168		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 8);
   169		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 2560);
   170		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 4096);
   171		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 7680);
   172		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 16384);
   173		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 2684);
   174		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   175				(uint64_t)UINT_MAX * 4);
   176		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   177				(uint64_t)(UINT_MAX - 1) * 4);
   178	
   179		/* Test 2 planes format */
   180		info = drm_format_info(DRM_FORMAT_NV12);
   181		KUNIT_EXPECT_TRUE(test, info);
   182		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   183		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   184		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   185		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
   186	
   187		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
   188		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
   189		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
   190		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 2);
   191		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
   192		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 320), 640);
   193		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
   194		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 512), 1024);
   195		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
   196		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 960), 1920);
   197		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
   198		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2048), 4096);
   199		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
   200		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 336), 672);
   201		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   202				(uint64_t)UINT_MAX);
   203		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1),
   204				(uint64_t)UINT_MAX + 1);
   205		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1)),
   206				(uint64_t)(UINT_MAX - 1));
   207		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) /  2),
   208				(uint64_t)(UINT_MAX - 1));
   209	
   210		/* Test 3 planes 8 bits per pixel format */
   211		info = drm_format_info(DRM_FORMAT_YUV422);
   212		KUNIT_EXPECT_TRUE(test, info);
   213		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   214		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   215		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 2, 0));
   216		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   217		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 3, 0));
   218	
   219		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 1);
   220		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 1), 1);
   221		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 1), 1);
   222		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 2);
   223		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2), 2);
   224		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 2), 2);
   225		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 640);
   226		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 320), 320);
   227		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 320), 320);
   228		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 1024);
   229		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 512), 512);
   230		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 512), 512);
   231		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 1920);
   232		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 960), 960);
   233		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 960), 960);
   234		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 4096);
   235		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 2048), 2048);
   236		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 2048), 2048);
   237		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 671);
   238		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, 336), 336);
   239		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, 336), 336);
   240		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   241				(uint64_t)UINT_MAX);
   242		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, UINT_MAX / 2 + 1),
   243				(uint64_t)UINT_MAX / 2 + 1);
   244		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, UINT_MAX / 2 + 1),
   245				(uint64_t)UINT_MAX / 2 + 1);
   246		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, (UINT_MAX - 1) / 2),
   247				(uint64_t)(UINT_MAX - 1) / 2);
   248		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 1, (UINT_MAX - 1) / 2),
   249				(uint64_t)(UINT_MAX - 1) / 2);
   250		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 2, (UINT_MAX - 1) / 2),
   251				(uint64_t)(UINT_MAX - 1) / 2);
   252	
   253		/* Test tiled format */
   254		info = drm_format_info(DRM_FORMAT_X0L2);
   255		KUNIT_EXPECT_TRUE(test, info);
   256		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 0, 0));
   257		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, -1, 0));
   258		KUNIT_EXPECT_FALSE(test, drm_format_info_min_pitch(info, 1, 0));
   259	
   260		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1), 2);
   261		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 2), 4);
   262		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 640), 1280);
   263		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1024), 2048);
   264		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 1920), 3840);
   265		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 4096), 8192);
   266		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, 671), 1342);
   267		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX),
   268				(uint64_t)UINT_MAX * 2);
   269		KUNIT_EXPECT_EQ(test, drm_format_info_min_pitch(info, 0, UINT_MAX - 1),
   270				(uint64_t)(UINT_MAX - 1) * 2);
 > 271	}
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
