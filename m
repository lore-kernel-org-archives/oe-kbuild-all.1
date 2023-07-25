Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7951114
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690253559; x=1721789559;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8WIle637pNbc9+d3+bC/332cdz18cZ/fhZXGnjApZo4=;
  b=H+CFIY0rTcnhzo0I5gLNsw4not1iXf7gaWVvdMfoURErImGfIVbZO3hz
   FJHY7MBslNGXu4ujAKEx0Vd4dQCzHR//5Y8knRfnZskd2DkBKdTylk1IB
   JazdM/Fc//eQlwb5lgGJA3N6gqlMLOIqnZD4yHgViqD5N5buQ4NU0uEEK
   YqaVErPVzs6B6HYwJ0xup63S9YAeguLauiEzYfdLLvhPA+FVthwuqyT3W
   jFkBp3i3CPGrHMdocfMxZvz0JosEhnGjqYt8kWahy+C/ClCwnNgGpu0gF
   ngGdMAKKagjkV1dKlXmIcEKXyiADxvITEipjNlQg3fEZXKKoLeSVJVmkt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="453980348"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="453980348"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2023 19:52:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="703127687"
X-IronPort-AV: E=Sophos;i="6.01,229,1684825200"; 
   d="scan'208";a="703127687"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Jul 2023 19:52:37 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qO8A8-000AFO-14;
	Tue, 25 Jul 2023 02:52:36 +0000
Date: Tue, 25 Jul 2023 10:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 121/150]
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1487:38: warning:
 'mtk_jpeg_drvdata' defined but not used
Message-ID: <202307251027.tMnMgNmE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   5c922d3b28576eee898ce081afab42446eca4596
commit: f2e9d11022fce9bfba1275df0ae26696ba232a4e [121/150] BACKPORT: UPSTREAM: mtk-jpegenc: support jpegenc multi-hardware
config: x86_64-buildonly-randconfig-r003-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251027.tMnMgNmE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251027.tMnMgNmE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251027.tMnMgNmE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1487:38: warning: 'mtk_jpeg_drvdata' defined but not used [-Wunused-const-variable=]
    1487 | static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1472:38: warning: 'mt8173_jpeg_drvdata' defined but not used [-Wunused-const-variable=]
    1472 | static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~~~~


vim +/mtk_jpeg_drvdata +1487 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c

b2f0d2724ba477d Rick Chang 2016-12-14  1471  
b4a82f5d15102ad Xia Jiang  2020-08-14 @1472  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
b4a82f5d15102ad Xia Jiang  2020-08-14  1473  	.clks = mt8173_jpeg_dec_clocks,
b4a82f5d15102ad Xia Jiang  2020-08-14  1474  	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
b4a82f5d15102ad Xia Jiang  2020-08-14  1475  	.formats = mtk_jpeg_dec_formats,
b4a82f5d15102ad Xia Jiang  2020-08-14  1476  	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
b4a82f5d15102ad Xia Jiang  2020-08-14  1477  	.qops = &mtk_jpeg_dec_qops,
b4a82f5d15102ad Xia Jiang  2020-08-14  1478  	.irq_handler = mtk_jpeg_dec_irq,
b4a82f5d15102ad Xia Jiang  2020-08-14  1479  	.hw_reset = mtk_jpeg_dec_reset,
b4a82f5d15102ad Xia Jiang  2020-08-14  1480  	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
b4a82f5d15102ad Xia Jiang  2020-08-14  1481  	.dev_name = "mtk-jpeg-dec",
b4a82f5d15102ad Xia Jiang  2020-08-14  1482  	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
b4a82f5d15102ad Xia Jiang  2020-08-14  1483  	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
b4a82f5d15102ad Xia Jiang  2020-08-14  1484  	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
b4a82f5d15102ad Xia Jiang  2020-08-14  1485  };
b4a82f5d15102ad Xia Jiang  2020-08-14  1486  
45f13a57d813445 Xia Jiang  2020-08-14 @1487  static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
45f13a57d813445 Xia Jiang  2020-08-14  1488  	.clks = mtk_jpeg_clocks,
45f13a57d813445 Xia Jiang  2020-08-14  1489  	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
45f13a57d813445 Xia Jiang  2020-08-14  1490  	.formats = mtk_jpeg_enc_formats,
45f13a57d813445 Xia Jiang  2020-08-14  1491  	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
45f13a57d813445 Xia Jiang  2020-08-14  1492  	.qops = &mtk_jpeg_enc_qops,
45f13a57d813445 Xia Jiang  2020-08-14  1493  	.irq_handler = mtk_jpeg_enc_irq,
45f13a57d813445 Xia Jiang  2020-08-14  1494  	.hw_reset = mtk_jpeg_enc_reset,
45f13a57d813445 Xia Jiang  2020-08-14  1495  	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
45f13a57d813445 Xia Jiang  2020-08-14  1496  	.dev_name = "mtk-jpeg-enc",
45f13a57d813445 Xia Jiang  2020-08-14  1497  	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
45f13a57d813445 Xia Jiang  2020-08-14  1498  	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
45f13a57d813445 Xia Jiang  2020-08-14  1499  	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
45f13a57d813445 Xia Jiang  2020-08-14  1500  };
45f13a57d813445 Xia Jiang  2020-08-14  1501  

:::::: The code at line 1487 was first introduced by commit
:::::: 45f13a57d8134459f02fbee0b1711eddc3260af7 media: platform: Add jpeg enc feature

:::::: TO: Xia Jiang <xia.jiang@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
