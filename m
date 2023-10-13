Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F21224DE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XL+Vuzb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697215796; x=1728751796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xriQrFI49Cdl4bJbaHD0cgbISVElP1bsopwhiLzsJ6I=;
  b=XL+Vuzb98urdTKyZQ92jsJXtGqIOsc+NxxoF0ICJVK+uoqcCVV9K3fzY
   tAg7wi0W5c5lMUUgPCKw5zkHnDo1wqRY1V0T6yCDzfuY13mGcJy/1VOIX
   EsvT3MvHSn4XXKKbYGs9HqKOrbQS4S23vzLvcgFJMGets3EulEQ6vq08Y
   8rrmD8WoyYujLZSHt/b7TZm9XQEnq6qoBsUxoD1mUyJNSPutNJfZvO/7O
   ulghZQXqinwW0Pjq20ppqFgjRSh92+TuKjQ1iRTjIn+wdP/Fgwbkf+iUL
   l+guPxmAZS+Qjnw1gyZYsyQH9w2IktQpMclVKhxD14LK0/t9FnKIOQr9Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="385060434"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="385060434"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="871152042"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="871152042"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 13 Oct 2023 09:49:54 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrLMG-00059j-0E;
	Fri, 13 Oct 2023 16:49:52 +0000
Date: Sat, 14 Oct 2023 00:49:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6094/24603]
 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:64:5: warning: "CONFIG_PM" is not
 defined, evaluates to 0
Message-ID: <202310140028.1dwzG1zv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: ba7179b2e4a0549e119cc83c5dfe5eb013cef3c2 [6094/24603] Merge remote-tracking branch 'origin/display/dsim' into display/next
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231014/202310140028.1dwzG1zv-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140028.1dwzG1zv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140028.1dwzG1zv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:64:5: warning: "CONFIG_PM" is not defined, evaluates to 0 [-Wundef]
      64 | #if CONFIG_PM
         |     ^~~~~~~~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: In function 'sec_dsim_of_parse_resets':
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:291:18: warning: variable 'len' set but not used [-Wunused-but-set-variable]
     291 |         uint32_t len, rstc_num = 0;
         |                  ^~~
   drivers/gpu/drm/imx/sec_mipi_dsim-imx.c: At top level:
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:72:12: warning: 'imx_sec_dsim_runtime_resume' defined but not used [-Wunused-function]
      72 | static int imx_sec_dsim_runtime_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/imx/sec_mipi_dsim-imx.c:68:12: warning: 'imx_sec_dsim_runtime_suspend' defined but not used [-Wunused-function]
      68 | static int imx_sec_dsim_runtime_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/CONFIG_PM +64 drivers/gpu/drm/imx/sec_mipi_dsim-imx.c

25799de94b286c Fancy Fang 2018-06-06  63  
b5a7aa6c474c92 Fancy Fang 2018-07-02 @64  #if CONFIG_PM
b5a7aa6c474c92 Fancy Fang 2018-07-02  65  static int imx_sec_dsim_runtime_suspend(struct device *dev);
b5a7aa6c474c92 Fancy Fang 2018-07-02  66  static int imx_sec_dsim_runtime_resume(struct device *dev);
b5a7aa6c474c92 Fancy Fang 2018-07-02  67  #else
b5a7aa6c474c92 Fancy Fang 2018-07-02 @68  static int imx_sec_dsim_runtime_suspend(struct device *dev)
b5a7aa6c474c92 Fancy Fang 2018-07-02  69  {
b5a7aa6c474c92 Fancy Fang 2018-07-02  70  	return 0;
b5a7aa6c474c92 Fancy Fang 2018-07-02  71  }
b5a7aa6c474c92 Fancy Fang 2018-07-02 @72  static int imx_sec_dsim_runtime_resume(struct device *dev)
b5a7aa6c474c92 Fancy Fang 2018-07-02  73  {
b5a7aa6c474c92 Fancy Fang 2018-07-02  74  	return 0;
b5a7aa6c474c92 Fancy Fang 2018-07-02  75  }
b5a7aa6c474c92 Fancy Fang 2018-07-02  76  #endif
b5a7aa6c474c92 Fancy Fang 2018-07-02  77  

:::::: The code at line 64 was first introduced by commit
:::::: b5a7aa6c474c926d8d7d919ebdb84ac3dfb328bd MLK-19017-6 drm/imx: add system pm support for SEC DSIM

:::::: TO: Fancy Fang <chen.fang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
