Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A0B194
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Oct 2023 01:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlHRWjq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698542207; x=1730078207;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=b9fG2/LOMnjSXCZbFAZqaqpVnRjqX2YDTVSUvfxp4PY=;
  b=WlHRWjq9ckAAZE0l90kO20vJqLJWjQWRWf5Mo0kecPXgjlgLfoU+CBPR
   xqTrKUKCPYMbzMQNMH0XQYBSM1FqK2Y2DERXQd57H+HpKVyoDoPHlcCKX
   33erDsntK6jzsjbD9mbEuin/rdB6axYuvHChXDCZXcTw4KXW7I8g0DzM6
   dOdH0/kysyAYhXJn0uxSUv+RKJmT99guij4v8PJN1yBpoUs97dOrcfQjR
   nQUwVc6YG05lm8l0xp/QrtEQz0VbLt8+VqXi7lSXLc+bKhBe4vAP3SBzl
   dV/aekYR1176jaT+fz0swPwM2qxgeJBJdzIH7ZHpzD7QKYbb1luV4mts6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="454393151"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="454393151"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2023 18:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10877"; a="1007090221"
X-IronPort-AV: E=Sophos;i="6.03,260,1694761200"; 
   d="scan'208";a="1007090221"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 28 Oct 2023 18:16:45 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qwuPz-000CEF-0I;
	Sun, 29 Oct 2023 01:16:43 +0000
Date: Sun, 29 Oct 2023 09:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Airlie <airlied@redhat.com>
Subject: drivers/gpu/drm/tests/drm_format_helper_test.c:757:36: sparse:
 sparse: incorrect type in argument 2 (different base types)
Message-ID: <202310290946.jEGJ6TC7-lkp@intel.com>
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
head:   2af9b20dbb39f6ebf9b9b6c090271594627d818e
commit: c37ea39c1fa880da0d7fd2c719e5c96be19f0fc5 Merge tag 'drm-misc-next-2023-01-12' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
date:   10 months ago
config: x86_64-randconfig-123-20231016 (https://download.01.org/0day-ci/archive/20231029/202310290946.jEGJ6TC7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231029/202310290946.jEGJ6TC7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310290946.jEGJ6TC7-lkp@intel.com/

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
