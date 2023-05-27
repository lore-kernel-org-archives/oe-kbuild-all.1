Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A29194
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 02:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685156032; x=1716692032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HSLVb4TC4U7RABKRbQL3c2j11FE3TRGYrarvY+K5Aw8=;
  b=USHtDJDUxDRClWQOFvzp799zGyWQ8jgYg1Z6IWACQsYnww0jb1wTxivf
   DQ8I6F0kJ8fHy3TmQKIx8C+vnFRM70y/xS8pt0XJZf/BMtFkYNfXDB75f
   hhulVq1s91d+Z5pLZmrbY2abBsQujZJRDkJHVW8VkVk9s0uNLLaSximf0
   UwtBFzYpjFykuA0IUkjdJn6BzMcQh53kS7IjPaoHx68jLHYD+YzH3U9SL
   jUSpp94lVNdhyDz+pPc6ppG3JGPpTDd1x/maBLiEn25PuWQyAtKPVLhwv
   mz+3GzoLCjfC3qEfAgYpbbFJFffTgRuZIm5kbvOoDlghX5Fr8zELQesuz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="440710545"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="440710545"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 19:53:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="952084223"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="952084223"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 26 May 2023 19:53:50 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2k3y-000Jji-0O;
	Sat, 27 May 2023 02:53:50 +0000
Date: Sat, 27 May 2023 10:53:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 121/150]
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1472:38: warning: unused
 variable 'mt8173_jpeg_drvdata'
Message-ID: <202305271056.NGrfzUAK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   9de748741e802680a1c2540e75fb3f3dba98d8be
commit: f2e9d11022fce9bfba1275df0ae26696ba232a4e [121/150] BACKPORT: UPSTREAM: mtk-jpegenc: support jpegenc multi-hardware
config: hexagon-randconfig-r022-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271056.NGrfzUAK-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout f2e9d11022fce9bfba1275df0ae26696ba232a4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash M=drivers/media/platform/mtk-jpeg

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271056.NGrfzUAK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1472:38: warning: unused variable 'mt8173_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
                                        ^
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1487:38: warning: unused variable 'mtk_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
                                        ^
   2 warnings generated.


vim +/mt8173_jpeg_drvdata +1472 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c

b2f0d2724ba477 Rick Chang 2016-12-14  1471  
b4a82f5d15102a Xia Jiang  2020-08-14 @1472  static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
b4a82f5d15102a Xia Jiang  2020-08-14  1473  	.clks = mt8173_jpeg_dec_clocks,
b4a82f5d15102a Xia Jiang  2020-08-14  1474  	.num_clks = ARRAY_SIZE(mt8173_jpeg_dec_clocks),
b4a82f5d15102a Xia Jiang  2020-08-14  1475  	.formats = mtk_jpeg_dec_formats,
b4a82f5d15102a Xia Jiang  2020-08-14  1476  	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
b4a82f5d15102a Xia Jiang  2020-08-14  1477  	.qops = &mtk_jpeg_dec_qops,
b4a82f5d15102a Xia Jiang  2020-08-14  1478  	.irq_handler = mtk_jpeg_dec_irq,
b4a82f5d15102a Xia Jiang  2020-08-14  1479  	.hw_reset = mtk_jpeg_dec_reset,
b4a82f5d15102a Xia Jiang  2020-08-14  1480  	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
b4a82f5d15102a Xia Jiang  2020-08-14  1481  	.dev_name = "mtk-jpeg-dec",
b4a82f5d15102a Xia Jiang  2020-08-14  1482  	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
b4a82f5d15102a Xia Jiang  2020-08-14  1483  	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
b4a82f5d15102a Xia Jiang  2020-08-14  1484  	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
b4a82f5d15102a Xia Jiang  2020-08-14  1485  };
b4a82f5d15102a Xia Jiang  2020-08-14  1486  
45f13a57d81344 Xia Jiang  2020-08-14 @1487  static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
45f13a57d81344 Xia Jiang  2020-08-14  1488  	.clks = mtk_jpeg_clocks,
45f13a57d81344 Xia Jiang  2020-08-14  1489  	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
45f13a57d81344 Xia Jiang  2020-08-14  1490  	.formats = mtk_jpeg_enc_formats,
45f13a57d81344 Xia Jiang  2020-08-14  1491  	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
45f13a57d81344 Xia Jiang  2020-08-14  1492  	.qops = &mtk_jpeg_enc_qops,
45f13a57d81344 Xia Jiang  2020-08-14  1493  	.irq_handler = mtk_jpeg_enc_irq,
45f13a57d81344 Xia Jiang  2020-08-14  1494  	.hw_reset = mtk_jpeg_enc_reset,
45f13a57d81344 Xia Jiang  2020-08-14  1495  	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
45f13a57d81344 Xia Jiang  2020-08-14  1496  	.dev_name = "mtk-jpeg-enc",
45f13a57d81344 Xia Jiang  2020-08-14  1497  	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
45f13a57d81344 Xia Jiang  2020-08-14  1498  	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
45f13a57d81344 Xia Jiang  2020-08-14  1499  	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
45f13a57d81344 Xia Jiang  2020-08-14  1500  };
45f13a57d81344 Xia Jiang  2020-08-14  1501  

:::::: The code at line 1472 was first introduced by commit
:::::: b4a82f5d15102ade6134c8cc4bbc8ccef1f4a7dc media: platform: Using the variant structure to contain the varability between dec and enc

:::::: TO: Xia Jiang <xia.jiang@mediatek.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
