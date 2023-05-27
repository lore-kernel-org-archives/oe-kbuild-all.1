Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E9F646
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 May 2023 04:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685161494; x=1716697494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WE17cZfqXhAa6A6iGjNv071SX0GMvWqoVEBJcEMsYmQ=;
  b=Nhv9Loro5q0zZIhfLmuaPaiIBmqBsyXrcYYkyaX+YdcIAMEEHREK+dZr
   ZVvw0YUg7t99MIduLBHYDxNI7/OkyeaCT1FmnyZjLaH0v0R7d5ybobLL9
   0SclJWKlB+n2+QEBCQbtmKSVjXSFEWL+W78L9YZ0LbPp0e0sgblacfJif
   gprGJ/gthK36605QKiTjnK5NQIWZCVcFZ7fKxu6334kJBIOqdgvskjPzC
   sKZElav9pVIh2mmJEr8hXBDLSls1bSSgg2xnYkoKkiG8SG6Iyyic8nHaf
   iaJPmRVtR4HKznZUpZb43+zxe5Ike6LxAHsvW35natCAgTKNcLOKURMFF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="334717394"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="334717394"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2023 21:24:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10722"; a="705427659"
X-IronPort-AV: E=Sophos;i="6.00,195,1681196400"; 
   d="scan'208";a="705427659"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 26 May 2023 21:24:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2lU3-000JlW-0o;
	Sat, 27 May 2023 04:24:51 +0000
Date: Sat, 27 May 2023 12:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 130/150]
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1857:38: warning: unused
 variable 'mtk8195_jpegdec_drvdata'
Message-ID: <202305271206.yyLblmbY-lkp@intel.com>
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
commit: 44de16ae73f5ca7500460d916a7d6e1b44d2b090 [130/150] BACKPORT: UPSTREAM: media: mtk-jpegdec: add jpeg decode worker interface
config: hexagon-randconfig-r022-20230526 (https://download.01.org/0day-ci/archive/20230527/202305271206.yyLblmbY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout 44de16ae73f5ca7500460d916a7d6e1b44d2b090
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash M=drivers/media/platform/mtk-jpeg

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305271206.yyLblmbY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1816:38: warning: unused variable 'mt8173_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
                                        ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1831:38: warning: unused variable 'mtk_jpeg_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
                                        ^
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1846:32: warning: unused variable 'mtk8195_jpegenc_drvdata' [-Wunused-variable]
   static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
                                  ^
>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1857:38: warning: unused variable 'mtk8195_jpegdec_drvdata' [-Wunused-const-variable]
   static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
                                        ^
   4 warnings generated.


vim +/mtk8195_jpegdec_drvdata +1857 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c

  1856	
> 1857	static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
  1858		.formats = mtk_jpeg_dec_formats,
  1859		.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
  1860		.qops = &mtk_jpeg_dec_qops,
  1861		.m2m_ops = &mtk_jpeg_multicore_dec_m2m_ops,
  1862		.dev_name = "mtk-jpeg-dec",
  1863		.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
  1864		.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
  1865		.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
  1866	};
  1867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
