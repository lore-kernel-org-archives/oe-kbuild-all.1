Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E93A14F86
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 23:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="awE5AbEZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697412272; x=1728948272;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zCbfq0seL0fOmArN1/Mt2SLEERxM4yzQ5HvNW/YIIms=;
  b=awE5AbEZktpejI6Lh4z1kxDUOz5fPPC8oCGEo3whdGYjpkVDLnrgK8pr
   uhA1uYIlLWlDwjmwYGBvnnX2KAMyJhfecIX+OtNqldDlIGZXhPNQCu15O
   KU3GlAKiIXsckQ/vE6CsEDpNSoI6UNA6lt0lt2o/m3l2+AvyZirujSPoZ
   cPbpzuhhURf2NCC3If6yil9if3a1dWNqrRvCdlqFDHvT3arAmM/F0cKXM
   Irm6y4BaE63uGzkrSGrUcOuuDk8mArkhFDrM6Xs9FA0xfBeLNjThHTfPn
   OVGP7FkzvUl/nHBaxK6olvjqO0Ik18co3lgBaPtJ8RFzJywTpBvnSCJss
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389280457"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389280457"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 16:24:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="929154627"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="929154627"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Oct 2023 16:24:27 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsATB-0007uW-0Y;
	Sun, 15 Oct 2023 23:24:25 +0000
Date: Mon, 16 Oct 2023 07:23:34 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1214/25021]
 drivers/gpu/imx/dpu/dpu-sc-misc.c:72:5: warning: no previous prototype for
 'dpu_sc_misc_set_kachunk_cnt'
Message-ID: <202310160744.3n01nwIA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 4c8354a06a36b41def9ac39f130c27d75d1b6177 [1214/25021] LF-73 gpu: imx: dpu: sc misc: Initialze KACHUNK_CNT as needed by blit engine
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310160744.3n01nwIA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160744.3n01nwIA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160744.3n01nwIA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/imx/dpu/dpu-sc-misc.c:72:5: warning: no previous prototype for 'dpu_sc_misc_set_kachunk_cnt' [-Wmissing-prototypes]
      72 | int dpu_sc_misc_set_kachunk_cnt(struct dpu_soc *dpu, u32 cnt)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/gpu/imx/dpu/dpu-sc-misc.c:16:
   drivers/gpu/imx/dpu/dpu-prv.h:358:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     358 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:350:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     350 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:349:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     349 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:348:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     348 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:346:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     346 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:345:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     345 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:344:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     344 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:343:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     343 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:342:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     342 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:341:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     341 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:337:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     337 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:336:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     334 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~


vim +/dpu_sc_misc_set_kachunk_cnt +72 drivers/gpu/imx/dpu/dpu-sc-misc.c

    70	
    71	/* KACHUNK_CNT is needed for blit engine */
  > 72	int dpu_sc_misc_set_kachunk_cnt(struct dpu_soc *dpu, u32 cnt)
    73	{
    74		u32 rsc = dpu->id ? IMX_SC_R_DC_1 : IMX_SC_R_DC_0;
    75	
    76		return dpu_sc_misc_set_ctrl(dpu, rsc, IMX_SC_C_KACHUNK_CNT, cnt);
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
