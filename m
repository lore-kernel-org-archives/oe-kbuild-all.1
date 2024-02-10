Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C863E46D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707568046; cv=none; b=Zf8NF86ip21OYwowBXljrWS3YF3D/iT3xT3L8m6HQ3uBuLdhfg03Ij8RyNs6BHZb3olARCXcYj2c2+rwazwN5O6jkLdjkAqyhb5DZJPeOTy17lqDolsVifzXfUhQQdyl7tZ5uSS32BF/uN5yXD1plnIaM+nzKkhj+bTAJqI1Rh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707568046; c=relaxed/simple;
	bh=Pzg3LnFgp2kp6wwqMsbI6ABMLqiD0cohYI4xqcAfMJM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J+7rV80RrYjwqptWS6NuiZ7+b5Bl89gn9TE/ZHL8L2Mhbmk3R2OJN982UBaYbPH0Si2v7q0Ewx7PlGgqlnrnrhB5oM5cRFHshsyX9izFGMZpBxU0cU/eqQ7mII5ulDg3ui1aDe0ggAM5hnTIpT9TwUf+Ze28eIEHct9R1J5+AD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g7ItlngN; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g7ItlngN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707568043; x=1739104043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pzg3LnFgp2kp6wwqMsbI6ABMLqiD0cohYI4xqcAfMJM=;
  b=g7ItlngNFhPKiA6l4d01RYED175l5tmt6IKPb+ag9zKHysPCrG1Vinhw
   K0rEAop4SApd3NhUsK7YAqx3W5Z8maY062rCeN2zTNvtpNikouEVC1OiN
   k/Ju4UYUDLZGcSGFABg/XNj0AYDfamZGKv22Z21BPZ4r1XLkfMq6SuXkM
   ky0BENPKHE/eFfa1GwsHAHU+wrbzMLcGyvlQvNbFigAdFlBxeokBmuhCe
   IT2eZ7xRcgSyJgPJxnVFGU6KibxkPCY/Bvf5Vh3/kE+/6Ai58Z4VY9G4N
   pT52pXxEl79SepdjiJdpj7r5milgGrv290xcemPvA6gN7WRA6D2yrU00z
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5348294"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="5348294"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 04:27:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="2474321"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 10 Feb 2024 04:27:19 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYmRw-0005dm-2H;
	Sat, 10 Feb 2024 12:27:16 +0000
Date: Sat, 10 Feb 2024 20:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1104/17898]
 drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not
 used
Message-ID: <202402102048.6ndc0nLC-lkp@intel.com>
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
commit: 19094fea7868379d1aecc67480acdc6109008f18 [1104/17898] gpu: imx: dpu: fetchunit: Add DPR support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240210/202402102048.6ndc0nLC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240210/202402102048.6ndc0nLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402102048.6ndc0nLC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/imx/dpu/dpu-constframe.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:339:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     339 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-disengcfg.c:21:
   drivers/gpu/imx/dpu/dpu-prv.h:339:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     339 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   drivers/gpu/imx/dpu/dpu-extdst.c:422:20: warning: no previous prototype for 'dpu_aux_ed_peek' [-Wmissing-prototypes]
     422 | struct dpu_extdst *dpu_aux_ed_peek(struct dpu_extdst *ed)
         |                    ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/imx/dpu/dpu-extdst.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h:339:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     339 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   drivers/gpu/imx/dpu/dpu-fetchdecode.c: In function 'fetchdecode_set_fmt':
   drivers/gpu/imx/dpu/dpu-fetchdecode.c:201:53: warning: this statement may fall through [-Wimplicit-fallthrough=]
     201 |                 is_yuv422upsamplingmode_interpolate = true;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpu/imx/dpu/dpu-fetchdecode.c:203:9: note: here
     203 |         case DRM_FORMAT_NV12:
         |         ^~~~
   In file included from drivers/gpu/imx/dpu/dpu-fetchdecode.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h: At top level:
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetcheco.c:21:
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetchlayer.c:22:
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetchwarp.c:21:
>> drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not used [-Wunused-const-variable=]
     331 | static const unsigned int fw_dprc_ids[] = {5};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:330:27: warning: 'fl_dprc_ids' defined but not used [-Wunused-const-variable=]
     330 | static const unsigned int fl_dprc_ids[] = {2};
         |                           ^~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:329:27: warning: 'fd_dprc_ids' defined but not used [-Wunused-const-variable=]
     329 | static const unsigned int fd_dprc_ids[] = {3, 4};
         |                           ^~~~~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:327:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     327 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
   drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
..


vim +/fw_dprc_ids +331 drivers/gpu/imx/dpu/dpu-prv.h

   328	
 > 329	static const unsigned int fd_dprc_ids[] = {3, 4};
 > 330	static const unsigned int fl_dprc_ids[] = {2};
 > 331	static const unsigned int fw_dprc_ids[] = {5};
   332	
   333	struct dpu_pixel_format {
   334		u32 pixel_format;
   335		u32 bits;
   336		u32 shift;
   337	};
   338	
 > 339	static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
   340		{
   341			DRM_FORMAT_ARGB8888,
   342			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   343			R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
   344		}, {
   345			DRM_FORMAT_XRGB8888,
   346			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   347			R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
   348		}, {
   349			DRM_FORMAT_ABGR8888,
   350			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   351			R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
   352		}, {
   353			DRM_FORMAT_XBGR8888,
   354			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   355			R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
   356		}, {
   357			DRM_FORMAT_RGBA8888,
   358			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   359			R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
   360		}, {
   361			DRM_FORMAT_RGBX8888,
   362			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   363			R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
   364		}, {
   365			DRM_FORMAT_BGRA8888,
   366			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   367			R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
   368		}, {
   369			DRM_FORMAT_BGRX8888,
   370			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   371			R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
   372		}, {
   373			DRM_FORMAT_RGB888,
   374			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   375			R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
   376		}, {
   377			DRM_FORMAT_BGR888,
   378			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   379			R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
   380		}, {
   381			DRM_FORMAT_RGB565,
   382			R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
   383			R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
   384		}, {
   385			DRM_FORMAT_YUYV,
   386			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   387			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(8)  | A_SHIFT(0),
   388		}, {
   389			DRM_FORMAT_UYVY,
   390			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   391			Y_SHIFT(8)  | U_SHIFT(0)  | V_SHIFT(0)  | A_SHIFT(0),
   392		}, {
   393			DRM_FORMAT_NV12,
   394			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   395			Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
   396		}, {
   397			DRM_FORMAT_NV21,
   398			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   399			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
   400		}, {
   401			DRM_FORMAT_NV16,
   402			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   403			Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
   404		}, {
   405			DRM_FORMAT_NV61,
   406			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   407			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
   408		}, {
   409			DRM_FORMAT_NV24,
   410			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   411			Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
   412		}, {
   413			DRM_FORMAT_NV42,
   414			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   415			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
   416		},
   417	};
   418	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
