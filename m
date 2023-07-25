Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892A61ED4D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 10:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690281216; x=1721817216;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E7hfPDPPYj2nKqua328aAmCZZLaKB+H/BXUTyDeKxcM=;
  b=OJfJhOv2tm6o4bGyz1OicpF2metdstAfl4DyOb2eVwiU0Zli8zESpScV
   SvJqkPQLJ5FzkaRPI4WH4eGiXOqoPbRJ/DrijPhYHV4x5oFNArQ1I0GHo
   MoAxqJACj7qQB3NcO1/AbLf+Jqk69xMs8xv/w7RmKIqNekyy4t+eeK0mG
   F2HwqnxQBrk3D97dWi6lvA1XnWhpRW9uWxKx9ULP3/z8YX9MetqPHDC6f
   DLhCVq0KyMF1DxtHzZIoWCxFOVEX+zV0x1NZGKW41OUN6MEheyJEaeCls
   EIe2rkfTQZ0wev/K3hcgjT0WIax2+/GGcb9btYZFGGzIlMzEv/evgG9l/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="352581851"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="352581851"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 03:33:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="791328007"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="791328007"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2023 03:33:34 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOFMD-000AXY-1W;
	Tue, 25 Jul 2023 10:33:33 +0000
Date: Tue, 25 Jul 2023 18:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 130/150]
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1857:38: warning:
 'mtk8195_jpegdec_drvdata' defined but not used
Message-ID: <202307251859.FVMmV8id-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   3fb3d802e198b41373ddddbfb35d6a3afe60120d
commit: 44de16ae73f5ca7500460d916a7d6e1b44d2b090 [130/150] BACKPORT: UPSTREAM: media: mtk-jpegdec: add jpeg decode worker interface
config: x86_64-buildonly-randconfig-r003-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251859.FVMmV8id-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251859.FVMmV8id-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251859.FVMmV8id-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1857:38: warning: 'mtk8195_jpegdec_drvdata' defined but not used [-Wunused-const-variable=]
    1857 | static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1846:32: warning: 'mtk8195_jpegenc_drvdata' defined but not used [-Wunused-variable]
    1846 | static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1831:38: warning: 'mtk_jpeg_drvdata' defined but not used [-Wunused-const-variable=]
    1831 | static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1816:38: warning: 'mt8173_jpeg_drvdata' defined but not used [-Wunused-const-variable=]
    1816 | static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~~~~


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
