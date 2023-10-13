Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6753D017
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNSYJ1r9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697173323; x=1728709323;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYG4EcM6KHgdN3lC//6H5YxwSY5tHDueA2mGZnlGH+A=;
  b=UNSYJ1r92rn7kvv67XHiWZk5tA7EoGqCdoFDgw7NyWn2IOqBKN/t72u8
   BFCvZ26Hhxe8Pf0Z8R0yYlRtlryyFNtkUJQ4clhl3nYE1r/5uS9stc++M
   DzRVSvR4YEHWSgSLda7UfYjbJgutWiWaAvwuY9VbstP1ccAdsTrdAkdfC
   31k5eazMxFpx8MTLYrsrgzMcj/2gmY1MPdN9uTP06zRBmPLpWAz5WZCRd
   jtkAELvAhj83Jg9UoV3xAcupYkgEd6DYoGRHDtbsOPBnq2FnfgCTjIpTh
   1Am7pWwT58qANd/Oxff8RpITmd5qgphpbFHEP0dM5NEDpze/cW1m4XO1j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="6662786"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="6662786"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:02:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="878396714"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="878396714"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 12 Oct 2023 22:02:00 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrAJB-0004Lh-26;
	Fri, 13 Oct 2023 05:01:57 +0000
Date: Fri, 13 Oct 2023 13:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.4-2.3.x-imx 523/30000]
 include/drm/drm_print.h:313:39: warning: format '%lu' expects argument of
 type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned
 int'}
Message-ID: <202310131314.ZHgUddoD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.4-2.3.x-imx
head:   bcde5677c4cabfef7080ffc2fef17275144a0517
commit: 70de3be1b8a4abbf0a700f0f9b9a1b8e19af90f3 [523/30000] drm/bridge: Add NWL MIPI DSI host controller support
config: arc-randconfig-002-20231013 (https://download.01.org/0day-ci/archive/20231013/202310131314.ZHgUddoD-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131314.ZHgUddoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131314.ZHgUddoD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/bridge/nwl-dsi/nwl-dsi.c: In function 'nwl_dsi_config_dpi':
   drivers/gpu/drm/bridge/nwl-dsi/nwl-dsi.c:233:26: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     233 |         if (color_format < 0) {
         |                          ^
   In file included from drivers/gpu/drm/bridge/nwl-dsi/nwl-dsi.c:22:
   drivers/gpu/drm/bridge/nwl-dsi/nwl-dsi.c: In function 'nwl_dsi_read_packet':
>> include/drm/drm_print.h:313:39: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
     313 |         drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
         |                                       ^~~~~~~~~~
   drivers/gpu/drm/bridge/nwl-dsi/nwl-dsi.c:403:25: note: in expansion of macro 'DRM_DEV_ERROR'
     403 |                         DRM_DEV_ERROR(
         |                         ^~~~~~~~~~~~~


vim +313 include/drm/drm_print.h

02c9656b2f0d69 Haneen Mohammed 2017-10-17  288  
02c9656b2f0d69 Haneen Mohammed 2017-10-17  289  #define _DRM_PRINTK(once, level, fmt, ...)				\
db87086492581c Joe Perches     2018-03-16  290  	printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  291  
02c9656b2f0d69 Haneen Mohammed 2017-10-17  292  #define DRM_INFO(fmt, ...)						\
02c9656b2f0d69 Haneen Mohammed 2017-10-17  293  	_DRM_PRINTK(, INFO, fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  294  #define DRM_NOTE(fmt, ...)						\
02c9656b2f0d69 Haneen Mohammed 2017-10-17  295  	_DRM_PRINTK(, NOTICE, fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  296  #define DRM_WARN(fmt, ...)						\
02c9656b2f0d69 Haneen Mohammed 2017-10-17  297  	_DRM_PRINTK(, WARNING, fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  298  
02c9656b2f0d69 Haneen Mohammed 2017-10-17  299  #define DRM_INFO_ONCE(fmt, ...)						\
02c9656b2f0d69 Haneen Mohammed 2017-10-17  300  	_DRM_PRINTK(_once, INFO, fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  301  #define DRM_NOTE_ONCE(fmt, ...)						\
02c9656b2f0d69 Haneen Mohammed 2017-10-17  302  	_DRM_PRINTK(_once, NOTICE, fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  303  #define DRM_WARN_ONCE(fmt, ...)						\
02c9656b2f0d69 Haneen Mohammed 2017-10-17  304  	_DRM_PRINTK(_once, WARNING, fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  305  
02c9656b2f0d69 Haneen Mohammed 2017-10-17  306  /**
02c9656b2f0d69 Haneen Mohammed 2017-10-17  307   * Error output.
02c9656b2f0d69 Haneen Mohammed 2017-10-17  308   *
091756bbb1a961 Haneen Mohammed 2017-10-17  309   * @dev: device pointer
091756bbb1a961 Haneen Mohammed 2017-10-17  310   * @fmt: printf() like format string.
02c9656b2f0d69 Haneen Mohammed 2017-10-17  311   */
02c9656b2f0d69 Haneen Mohammed 2017-10-17  312  #define DRM_DEV_ERROR(dev, fmt, ...)					\
db87086492581c Joe Perches     2018-03-16 @313  	drm_dev_printk(dev, KERN_ERR, "*ERROR* " fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  314  #define DRM_ERROR(fmt, ...)						\
99a954874e7b9f Joe Perches     2018-03-13  315  	drm_err(fmt, ##__VA_ARGS__)
02c9656b2f0d69 Haneen Mohammed 2017-10-17  316  

:::::: The code at line 313 was first introduced by commit
:::::: db87086492581c87f768b7d17d01308153ecffc1 drm: Reduce object size of DRM_DEV_<LEVEL> uses

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
