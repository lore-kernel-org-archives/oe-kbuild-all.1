Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C159476
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Aug 2023 07:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692776761; x=1724312761;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=G+cKGBTH4SlUWo7FPKysfd8g/uVy6OZ3n0ebtvsdVpE=;
  b=l1L5GtT5REwIRK+k2k4/vuoq1R2zvb9DIZ3jOXNg6T0mLkWSy2SNZsOK
   5Txdm80HVKTSFvYeRhMKHlUJt8N6CGTO9silcN0/+/XBqkqyffIcREEy+
   lRkUkDpoQJ06Q2LbLU9XdwtWCDBBRNpF9M3drCdHVHmqGWXPqImHq5XDx
   hCTvrH9vilAKaCAe0AXX5X3lisHrY96wPATv1Zs3X3kbekZ/Gv/iGxMUI
   d4fLT+jFwuQPBhWZwIy4GQ9inNO0bPe6sHq6Jl4dvj6GQE4Um78BzVLKC
   bKdJx3XFE/4mzikOKD70yVnEeWsFxGxtZdujQJ7PbBzCOhZjGoy7vZIpu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="371509692"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="371509692"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 00:45:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="730114330"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="730114330"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 23 Aug 2023 00:45:56 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYiYu-0000yJ-08;
	Wed, 23 Aug 2023 07:45:56 +0000
Date: Wed, 23 Aug 2023 15:45:09 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>
Subject: drivers/gpu/drm/tests/drm_format_helper_test.c:757:36: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202308231534.WcBFVCgH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   89bf6209cad66214d3774dac86b6bbf2aec6a30d
commit: c37ea39c1fa880da0d7fd2c719e5c96be19f0fc5 Merge tag 'drm-misc-next-2023-01-12' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
date:   7 months ago
config: i386-randconfig-061-20230823 (https://download.01.org/0day-ci/archive/20230823/202308231534.WcBFVCgH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308231534.WcBFVCgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308231534.WcBFVCgH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tests/drm_format_helper_test.c:757:36: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected restricted __le32 const [usertype] *buf @@     got unsigned int [usertype] *[assigned] buf @@
   drivers/gpu/drm/tests/drm_format_helper_test.c:757:36: sparse:     expected restricted __le32 const [usertype] *buf
   drivers/gpu/drm/tests/drm_format_helper_test.c:757:36: sparse:     got unsigned int [usertype] *[assigned] buf

vim +757 drivers/gpu/drm/tests/drm_format_helper_test.c

175073d694cd9d Thomas Zimmermann 2023-01-02  729  
453114319699b6 José Expósito     2022-09-26  730  static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
453114319699b6 José Expósito     2022-09-26  731  {
453114319699b6 José Expósito     2022-09-26  732  	const struct convert_xrgb8888_case *params = test->param_value;
453114319699b6 José Expósito     2022-09-26  733  	const struct convert_to_xrgb2101010_result *result = &params->xrgb2101010_result;
453114319699b6 José Expósito     2022-09-26  734  	size_t dst_size;
4db88a9026c220 Thomas Zimmermann 2023-01-02  735  	u32 *buf = NULL;
58f5d9830da0d4 Thomas Zimmermann 2023-01-02  736  	__le32 *xrgb8888 = NULL;
453114319699b6 José Expósito     2022-09-26  737  	struct iosys_map dst, src;
453114319699b6 José Expósito     2022-09-26  738  
453114319699b6 José Expósito     2022-09-26  739  	struct drm_framebuffer fb = {
453114319699b6 José Expósito     2022-09-26  740  		.format = drm_format_info(DRM_FORMAT_XRGB8888),
453114319699b6 José Expósito     2022-09-26  741  		.pitches = { params->pitch, 0, 0 },
453114319699b6 José Expósito     2022-09-26  742  	};
453114319699b6 José Expósito     2022-09-26  743  
453114319699b6 José Expósito     2022-09-26  744  	dst_size = conversion_buf_size(DRM_FORMAT_XRGB2101010,
453114319699b6 José Expósito     2022-09-26  745  				       result->dst_pitch, &params->clip);
453114319699b6 José Expósito     2022-09-26  746  	KUNIT_ASSERT_GT(test, dst_size, 0);
453114319699b6 José Expósito     2022-09-26  747  
453114319699b6 José Expósito     2022-09-26  748  	buf = kunit_kzalloc(test, dst_size, GFP_KERNEL);
453114319699b6 José Expósito     2022-09-26  749  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, buf);
453114319699b6 José Expósito     2022-09-26  750  	iosys_map_set_vaddr(&dst, buf);
453114319699b6 José Expósito     2022-09-26  751  
58f5d9830da0d4 Thomas Zimmermann 2023-01-02  752  	xrgb8888 = cpubuf_to_le32(test, params->xrgb8888, TEST_BUF_SIZE);
453114319699b6 José Expósito     2022-09-26  753  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, xrgb8888);
453114319699b6 José Expósito     2022-09-26  754  	iosys_map_set_vaddr(&src, xrgb8888);
453114319699b6 José Expósito     2022-09-26  755  
453114319699b6 José Expósito     2022-09-26  756  	drm_fb_xrgb8888_to_xrgb2101010(&dst, &result->dst_pitch, &src, &fb, &params->clip);
7089003304c676 David Gow         2022-10-19 @757  	buf = le32buf_to_cpu(test, buf, dst_size / sizeof(u32));
a52a5451f43bb7 Maíra Canal       2022-10-25  758  	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
453114319699b6 José Expósito     2022-09-26  759  }
453114319699b6 José Expósito     2022-09-26  760  

:::::: The code at line 757 was first introduced by commit
:::::: 7089003304c67658caead22f841840fc4a26b198 drm: tests: Fix a buffer overflow in format_helper_test

:::::: TO: David Gow <davidgow@google.com>
:::::: CC: Javier Martinez Canillas <javierm@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
