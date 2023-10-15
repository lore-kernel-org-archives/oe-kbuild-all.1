Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF55EBB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 08:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xeez2HDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697360041; x=1728896041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TWMs/Lb38wLuc8BPAN+rvtND9mnMwzBurS4iXFRIMYo=;
  b=Xeez2HDj1W/E/+/Gcqj9Zsb69xyh/sr1Vme2aUGiNZCgpSycS/eeDuIe
   fbGWoEBWx6wQwZwO2IT7Q7SdckrJ7DAUrLnpSRp44b2dSvdRvTV3yKfNm
   k2CUDBAiuKeB/Bk2i1bj0MHtYFBXtYyn/EcjumWWJTfwiZ47pzTBHCrkt
   2OlREEio/lBdRLaKTpBeGskbrb8keE2t6EFbKpUcknAfNT5aFPY02crpH
   zIs4Pv2K2mj0OVF5Q2O2ac+XenfPHxU5rCLoTSX961U9XV2xnELTKoM7D
   1YkbgGN0/TyhE2ewna48GwMm1QMtSe4IUs8eY3OZ9gaK3WEeAXknZYHJm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="385213215"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="385213215"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:54:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871696337"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="871696337"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2023 01:53:59 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrwsm-0007G3-27;
	Sun, 15 Oct 2023 08:53:56 +0000
Date: Sun, 15 Oct 2023 16:52:56 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1168/25021]
 drivers/gpu/imx/dpu/dpu-prv.h:331:27: warning: 'fw_dprc_ids' defined but not
 used
Message-ID: <202310151601.Dy3xS5R2-lkp@intel.com>
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
commit: 72df02b88cb0a9fd30d401f47f172e9c1044964b [1168/25021] gpu: imx: dpu: fetchunit: Add DPR support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310151601.Dy3xS5R2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151601.Dy3xS5R2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151601.Dy3xS5R2-lkp@intel.com/

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
