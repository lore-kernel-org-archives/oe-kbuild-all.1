Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B59CB66E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TO+FOvQx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697386705; x=1728922705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZLuMePJe4J68mLH9YHSe4kNuJ5JrWzUzJWkPTXNLocQ=;
  b=TO+FOvQxuNKZ85CKk1ZvCJ0hnaiNlTMj4fX9CnRPejJ6TE4kg5fhVHN1
   35PdYW0bg/S2oIWHRFNBrykxg7ePQeWagRjbM0u5zsRHrwrot1Tl6l5VW
   GT35pVAjr6kOvleaNbCDvML5v2GhWHuxZTvJJMJYPakhqFwXcNA8jFA4M
   wMjHEFj5bk5SFdOPRAPQKvXUoLPwb241d1jwsj0E8CwsfbUO07CRXPdA0
   w/5UBdbVs30RSvBxlFxojFoDousAn/1bAOihTnO2oH+84d7T8X7OTCOYL
   y4MOHm3OTxrpeOA9pizvOJcIDkxgrw3zeRu1Bqk0lMOCS959rFU263dsM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389261370"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389261370"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 09:18:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825712712"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="825712712"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 15 Oct 2023 09:18:21 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs3op-0007Ye-0m;
	Sun, 15 Oct 2023 16:18:19 +0000
Date: Mon, 16 Oct 2023 00:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1197/25021]
 drivers/gpu/imx/dpu/dpu-store.c:48:25: warning: variable 'dpu' set but not
 used
Message-ID: <202310160056.E6CcMWGF-lkp@intel.com>
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
commit: 55a62d55724d3104f3d793b134ab4bd07d8fbb0a [1197/25021] gpu: imx: dpu: common: Add store9 support for sync mode fixup
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231016/202310160056.E6CcMWGF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160056.E6CcMWGF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160056.E6CcMWGF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/imx/dpu/dpu-store.c: In function 'store_pixengcfg_syncmode_fixup':
>> drivers/gpu/imx/dpu/dpu-store.c:48:25: warning: variable 'dpu' set but not used [-Wunused-but-set-variable]
      48 |         struct dpu_soc *dpu;
         |                         ^~~
   In file included from drivers/gpu/imx/dpu/dpu-store.c:20:
   drivers/gpu/imx/dpu/dpu-prv.h: At top level:
   drivers/gpu/imx/dpu/dpu-prv.h:348:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     348 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:336:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:333:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     333 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:332:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:328:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     328 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-vscaler.c:21:
   drivers/gpu/imx/dpu/dpu-prv.h:348:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     348 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     334 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:333:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     333 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:332:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:328:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     328 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-constframe.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:348:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     348 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:336:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     334 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:333:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     333 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:332:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:328:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     328 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-sc-misc.c:16:
   drivers/gpu/imx/dpu/dpu-prv.h:348:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     348 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:336:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     334 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:333:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     333 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:332:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:328:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     328 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-disengcfg.c:21:
   drivers/gpu/imx/dpu/dpu-prv.h:348:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     348 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:336:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     334 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:333:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     333 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:332:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:328:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     328 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-extdst.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:348:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     348 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:340:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     340 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:339:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     339 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:338:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     338 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:336:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     336 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:335:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     335 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'st_ids' defined but not used [-Wunused-const-variable=]
     334 | static const unsigned int st_ids[] = {9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:333:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     333 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:332:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     332 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:328:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     328 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
..


vim +/dpu +48 drivers/gpu/imx/dpu/dpu-store.c

    45	
    46	void store_pixengcfg_syncmode_fixup(struct dpu_store *st, bool enable)
    47	{
  > 48		struct dpu_soc *dpu;
    49		u32 val;
    50	
    51		if (!st)
    52			return;
    53	
    54		dpu = st->dpu;
    55	
    56		mutex_lock(&st->mutex);
    57		val = dpu_pec_st_read(st, PIXENGCFG_STATIC);
    58		if (enable)
    59			val |= BIT(16);
    60		else
    61			val &= ~BIT(16);
    62		dpu_pec_st_write(st, PIXENGCFG_STATIC, val);
    63		mutex_unlock(&st->mutex);
    64	}
    65	EXPORT_SYMBOL_GPL(store_pixengcfg_syncmode_fixup);
    66	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
