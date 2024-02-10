Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D905C5C617
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Feb 2024 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707607726; cv=none; b=SgSWmHqHztP2WY82rUMFhSwQLk0PESke1h5qnYl+SzXUE6YXB2rgs432UL0G12Qq1pSPda4+Jjgvo1ajc1Oz0EeNWQRksZR4hoyjzA1d9JSgkAkxO598rO4JcNdAb6AVM6gWzm2/MbGwOATJOTLIK/oBWtVE8kVHM/BQqjWP3PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707607726; c=relaxed/simple;
	bh=k5ZtMUGBDS7RGF5pYdpg2sHbNIZHgs2vEVwPPCUSb0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0Ayto79PYg7hQ6puLjsT8tRQ6nriB6HaKounlhkcpCsDsxPGIaxw46zY0dcsR/ztmUSmFOf0wMc2j1VpY66FtusHh1dQhxrU0EtX9ou/Qzzxx2Q4EqDNp6h1sGRKAV5tpz0bxi/htgKk/+Vq6AU8z1ynVr4hgW47xuqtmz7Zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X7hrbiVi; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7hrbiVi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707607723; x=1739143723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5ZtMUGBDS7RGF5pYdpg2sHbNIZHgs2vEVwPPCUSb0M=;
  b=X7hrbiVi0BZhWSCpvluq13EfVSyvqaSfh+eeJnq2QAR8A9V8X4AHer/D
   uQdbvnngRwMCARUj1iNn4spiLyPSew3KD0etUt2p0Y2mid8k5WMl1QWQ4
   LEk/1TczdYfvKE7LKXgcTd7mIaYvCV1Z/pa+U/Iod9opaXJw3dUBxR4j/
   +y3Dp0mAjkp1aogRApMHEmP9P9LFnGUTdTHySB6IaDL3Q/60LAA7RPeRz
   lKFrQSV5ztDtJ6KvfKFw4qzwl9sLWp+TP0VIVTJWr22a8tejC5YQEGH/4
   oDDtCJEbFXMPxx5lcrFnIUkM07DNQqBcqZDo6BYGcqZCs/TZUWO4Zfxpk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10980"; a="1477565"
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="1477565"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2024 15:28:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,259,1701158400"; 
   d="scan'208";a="25471585"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Feb 2024 15:28:41 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYwlz-0006BQ-0w;
	Sat, 10 Feb 2024 23:28:39 +0000
Date: Sun, 11 Feb 2024 07:28:31 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.2.x-imx 1133/17898]
 drivers/gpu/imx/dpu/dpu-prv.h:334:27: warning: 'st_ids' defined but not used
Message-ID: <202402110736.gw4acSVs-lkp@intel.com>
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
commit: cfd8d86ac11338a9facd656c9001add1feb4ded6 [1133/17898] gpu: imx: dpu: common: Add store9 support for sync mode fixup
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240211/202402110736.gw4acSVs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240211/202402110736.gw4acSVs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402110736.gw4acSVs-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from drivers/gpu/imx/dpu/dpu-fetcheco.c:21:
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
   In file included from drivers/gpu/imx/dpu/dpu-fetchlayer.c:22:
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
   In file included from drivers/gpu/imx/dpu/dpu-fetchwarp.c:21:
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
..


vim +/st_ids +334 drivers/gpu/imx/dpu/dpu-prv.h

   323	
   324	static const unsigned int cf_ids[] = {0, 1, 4, 5};
   325	static const unsigned int dec_ids[] = {0, 1};
   326	static const unsigned int ed_ids[] = {0, 1, 4, 5};
   327	static const unsigned int fd_ids[] = {0, 1};
   328	static const unsigned int fe_ids[] = {0, 1, 2, 9};
   329	static const unsigned int fg_ids[] = {0, 1};
   330	static const unsigned int fl_ids[] = {0};
   331	static const unsigned int fw_ids[] = {2};
   332	static const unsigned int hs_ids[] = {4, 5, 9};
   333	static const unsigned int lb_ids[] = {0, 1, 2, 3};
 > 334	static const unsigned int st_ids[] = {9};
   335	static const unsigned int tcon_ids[] = {0, 1};
   336	static const unsigned int vs_ids[] = {4, 5, 9};
   337	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
