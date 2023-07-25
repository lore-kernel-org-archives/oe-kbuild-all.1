Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B3F8F58
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 09:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690276879; x=1721812879;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ss3AKHlJ1aEh3lo/dExkViUHyHnRiP6kFBD5eEZEuno=;
  b=bIOns2GlP+p+3WtNa1qO0cSjy9OkqhH4a8H+Gp7RVnxsM+POdMxtmgpa
   1sCiMftK2WtvrY9lGDRi+zdFLi9ate5UuoOB+S6pZ5x8Lh2AIBEgtBHi1
   1kUtQeKojIsd+dC9ZET9sGwk/CinC3hvlVgnDz3jd00eVyGmqlCc4gQjO
   g+D76X4OebFoe5RuJBiBOJ9rR5roCprhllhdROtbq9vJCosal411FlUdF
   3iTs6Y3VihcMYJI5SDzKIQxiroq2+xACvDtTGItcYddbKxNKijlwkRyjb
   /S5oYC8gi/7MGtVDueH0+S4pzTO1b70Zht99MuP1ELKjDCxnXgEjAUpxJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="367691782"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="367691782"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 02:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="761149955"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="761149955"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 25 Jul 2023 02:21:17 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOEEH-000AUi-0f;
	Tue, 25 Jul 2023 09:21:17 +0000
Date: Tue, 25 Jul 2023 17:20:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 123/150]
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1668:32: warning:
 'mtk8195_jpegenc_drvdata' defined but not used
Message-ID: <202307251711.3xlwm58t-lkp@intel.com>
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
commit: 136e6b1ac8b9b581925846ce3caa8351e6aa1a4d [123/150] BACKPORT: UPSTREAM: mtk-jpegenc: add jpeg encode worker interface
config: x86_64-buildonly-randconfig-r003-20230724 (https://download.01.org/0day-ci/archive/20230725/202307251711.3xlwm58t-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251711.3xlwm58t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251711.3xlwm58t-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1668:32: warning: 'mtk8195_jpegenc_drvdata' defined but not used [-Wunused-variable]
    1668 | static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1653:38: warning: 'mtk_jpeg_drvdata' defined but not used [-Wunused-const-variable=]
    1653 | static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~
   drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c:1638:38: warning: 'mt8173_jpeg_drvdata' defined but not used [-Wunused-const-variable=]
    1638 | static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
         |                                      ^~~~~~~~~~~~~~~~~~~


vim +/mtk8195_jpegenc_drvdata +1668 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c

  1667	
> 1668	static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
  1669		.formats = mtk_jpeg_enc_formats,
  1670		.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
  1671		.qops = &mtk_jpeg_enc_qops,
  1672		.m2m_ops = &mtk_jpeg_multicore_enc_m2m_ops,
  1673		.dev_name = "mtk-jpeg-enc",
  1674		.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
  1675		.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
  1676		.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
  1677	};
  1678	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
