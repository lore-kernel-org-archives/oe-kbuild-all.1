Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B59345959
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Feb 2024 09:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707643978; cv=none; b=pQeBArC0U7Cz5HK8zrFtXt1gq6qhyD4m5lZ6GFKclzsihzajLUMDTMjs6Ai6OX1XzWhlrA/YmFoN3t9KoBvw+tYjUVI1s5LKVcCyr6Mhk6rks8VWvGklHvFscyHy6YqJMSsBknqvXHwGzOska8CnzU+KH2pFVK0zpROJPBVZR7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707643978; c=relaxed/simple;
	bh=+L84YIM9Vrns68UKEHvfL/pr2ttivTj1vhx8drjIWgg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRIpEmQpaPo31CyIcL4mjeoW+/FTaLol5pSyVR4uT9+PgHcqHBm7xI2lYihjSuVg5ho9Ycw3i7vMjTihH2lRQOlzgZ+2iXzLeEEuRcYGYe39d3i1hWvd7L8pyC6uyAmm/zOwGOR01kycr890RvbMiRW0NcAjQL5durQX5wv8hyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXn6FSsL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXn6FSsL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707643976; x=1739179976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+L84YIM9Vrns68UKEHvfL/pr2ttivTj1vhx8drjIWgg=;
  b=TXn6FSsL3aafgXDvqyYsfMVpudKhu2RTfu2BRHua9QGu6UtPLIzFiwto
   l2f1i31LOEPOviLdAu3Jk2Bcq4aBjqXzv1OlnFx0P4h4dP6sfgjrC3W8c
   /5Q8D0ImH4pNpE+PnJIKmb0HmkAfByavR8+fXoh4IuyXTFSpgOtoFlzpM
   9mInQHvgwEvpkU4wjj305YlyL0PATJpROGdwpx69e+M9NeW0H5FIc6vql
   knRNFzBZ2xfdn7h328gnTXCcQ5Q6ZYdjb3EI0jnQt4iVj9b87Sq9zpwzd
   Ntkrc99KPouBxnEecWfo1GtsiDLZ/ozTbaLG+Q+mKN7D7ZMXMz/9UM0LR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="12702847"
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="12702847"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2024 01:32:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,260,1701158400"; 
   d="scan'208";a="2340421"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Feb 2024 01:32:55 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rZ6Ci-0006Ud-2N;
	Sun, 11 Feb 2024 09:32:52 +0000
Date: Sun, 11 Feb 2024 17:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1150/17898]
 drivers/gpu/imx/dpu/dpu-sc-misc.c:72:5: warning: no previous prototype for
 'dpu_sc_misc_set_kachunk_cnt'
Message-ID: <202402111733.PdbvWaC3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.2.x-imx
head:   4e3fc5471376a15279ee5c99e791a7c7b065cbc1
commit: d5980685eaa3a2739dd37b88b5eedaf0030c1a60 [1150/17898] LF-73 gpu: imx: dpu: sc misc: Initialze KACHUNK_CNT as needed by blit engine
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240211/202402111733.PdbvWaC3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402111733.PdbvWaC3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402111733.PdbvWaC3-lkp@intel.com/

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
