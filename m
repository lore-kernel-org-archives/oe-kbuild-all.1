Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6856317E1
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 00:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aswtSfEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697328071; x=1728864071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P7fV0MW4XCx+ubjjyCr9ARAt84bD26Qk1CbvXhhAO2M=;
  b=aswtSfEkwEE1M6J4bMjITPwImPfjBGqO50akdcSLdeLNJlkg/H/j+KCP
   ++raz8JU4S7jA6AxAlXYp/h4X3MYzmVGg/q6cU54N9dtI1avIulQhmPzR
   Ud8DGwzwqD84+QIvn9RHjY7AJHJe21dnGV2BGO69uodWCetFKkFFdH/gy
   5vuooeOonx+3RwobSe7RqU8WOL8yuHKI7m5VmJxjlgXYZzA6xLlNBT6/1
   e0ydO22XSSjRil7asmQtuUWsqkU1DG4PHectQoMIA4MjbWHlvhfOqB2V+
   6M68B2uIkWzj4VqA5hqF83oHXRMvQKwWyHnkvkessVdxLuO/+Ir02ZoJ0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="3965113"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="3965113"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2023 17:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="871580277"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="871580277"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2023 17:01:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qroZ7-0006pb-1K;
	Sun, 15 Oct 2023 00:01:05 +0000
Date: Sun, 15 Oct 2023 08:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1148/25021]
 drivers/gpu/imx/dpu/dpu-prv.h:334:38: warning: 'dpu_pixel_format_matrix'
 defined but not used
Message-ID: <202310150720.tzYlSBDN-lkp@intel.com>
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
commit: 78c9899a969db88efaa1e866c9430c6ad8a5c76e [1148/25021] gpu: imx: Add dpu common driver support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231015/202310150720.tzYlSBDN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310150720.tzYlSBDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310150720.tzYlSBDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/gpu/imx/dpu/dpu-common.c:29:
>> drivers/gpu/imx/dpu/dpu-prv.h:334:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     334 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-constframe.c:22:
>> drivers/gpu/imx/dpu/dpu-prv.h:334:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     334 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-disengcfg.c:21:
>> drivers/gpu/imx/dpu/dpu-prv.h:334:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     334 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   drivers/gpu/imx/dpu/dpu-extdst.c:422:20: warning: no previous prototype for 'dpu_aux_ed_peek' [-Wmissing-prototypes]
     422 | struct dpu_extdst *dpu_aux_ed_peek(struct dpu_extdst *ed)
         |                    ^~~~~~~~~~~~~~~
   In file included from drivers/gpu/imx/dpu/dpu-extdst.c:22:
>> drivers/gpu/imx/dpu/dpu-prv.h:334:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     334 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   drivers/gpu/imx/dpu/dpu-fetchdecode.c: In function 'fetchdecode_set_fmt':
   drivers/gpu/imx/dpu/dpu-fetchdecode.c:164:53: warning: this statement may fall through [-Wimplicit-fallthrough=]
     164 |                 is_yuv422upsamplingmode_interpolate = true;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   drivers/gpu/imx/dpu/dpu-fetchdecode.c:166:9: note: here
     166 |         case DRM_FORMAT_NV12:
         |         ^~~~
   In file included from drivers/gpu/imx/dpu/dpu-fetchdecode.c:22:
   drivers/gpu/imx/dpu/dpu-prv.h: At top level:
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetcheco.c:21:
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetchlayer.c:22:
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetchwarp.c:21:
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
--
   In file included from drivers/gpu/imx/dpu/dpu-fetchunit.c:16:
>> drivers/gpu/imx/dpu/dpu-prv.h:334:38: warning: 'dpu_pixel_format_matrix' defined but not used [-Wunused-const-variable=]
     334 | static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:326:27: warning: 'vs_ids' defined but not used [-Wunused-const-variable=]
     326 | static const unsigned int vs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:325:27: warning: 'tcon_ids' defined but not used [-Wunused-const-variable=]
     325 | static const unsigned int tcon_ids[] = {0, 1};
         |                           ^~~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:324:27: warning: 'lb_ids' defined but not used [-Wunused-const-variable=]
     324 | static const unsigned int lb_ids[] = {0, 1, 2, 3};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:323:27: warning: 'hs_ids' defined but not used [-Wunused-const-variable=]
     323 | static const unsigned int hs_ids[] = {4, 5, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:322:27: warning: 'fw_ids' defined but not used [-Wunused-const-variable=]
     322 | static const unsigned int fw_ids[] = {2};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:321:27: warning: 'fl_ids' defined but not used [-Wunused-const-variable=]
     321 | static const unsigned int fl_ids[] = {0};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:320:27: warning: 'fg_ids' defined but not used [-Wunused-const-variable=]
     320 | static const unsigned int fg_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:319:27: warning: 'fe_ids' defined but not used [-Wunused-const-variable=]
     319 | static const unsigned int fe_ids[] = {0, 1, 2, 9};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:318:27: warning: 'fd_ids' defined but not used [-Wunused-const-variable=]
     318 | static const unsigned int fd_ids[] = {0, 1};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:317:27: warning: 'ed_ids' defined but not used [-Wunused-const-variable=]
     317 | static const unsigned int ed_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:316:27: warning: 'dec_ids' defined but not used [-Wunused-const-variable=]
     316 | static const unsigned int dec_ids[] = {0, 1};
         |                           ^~~~~~~
>> drivers/gpu/imx/dpu/dpu-prv.h:315:27: warning: 'cf_ids' defined but not used [-Wunused-const-variable=]
     315 | static const unsigned int cf_ids[] = {0, 1, 4, 5};
         |                           ^~~~~~
..


vim +/dpu_pixel_format_matrix +334 drivers/gpu/imx/dpu/dpu-prv.h

   314	
 > 315	static const unsigned int cf_ids[] = {0, 1, 4, 5};
 > 316	static const unsigned int dec_ids[] = {0, 1};
 > 317	static const unsigned int ed_ids[] = {0, 1, 4, 5};
 > 318	static const unsigned int fd_ids[] = {0, 1};
 > 319	static const unsigned int fe_ids[] = {0, 1, 2, 9};
 > 320	static const unsigned int fg_ids[] = {0, 1};
 > 321	static const unsigned int fl_ids[] = {0};
 > 322	static const unsigned int fw_ids[] = {2};
 > 323	static const unsigned int hs_ids[] = {4, 5, 9};
 > 324	static const unsigned int lb_ids[] = {0, 1, 2, 3};
 > 325	static const unsigned int tcon_ids[] = {0, 1};
 > 326	static const unsigned int vs_ids[] = {4, 5, 9};
   327	
   328	struct dpu_pixel_format {
   329		u32 pixel_format;
   330		u32 bits;
   331		u32 shift;
   332	};
   333	
 > 334	static const struct dpu_pixel_format dpu_pixel_format_matrix[] = {
   335		{
   336			DRM_FORMAT_ARGB8888,
   337			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   338			R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(24),
   339		}, {
   340			DRM_FORMAT_XRGB8888,
   341			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   342			R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
   343		}, {
   344			DRM_FORMAT_ABGR8888,
   345			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   346			R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(24),
   347		}, {
   348			DRM_FORMAT_XBGR8888,
   349			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   350			R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
   351		}, {
   352			DRM_FORMAT_RGBA8888,
   353			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   354			R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
   355		}, {
   356			DRM_FORMAT_RGBX8888,
   357			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   358			R_SHIFT(24) | G_SHIFT(16) | B_SHIFT(8)  | A_SHIFT(0),
   359		}, {
   360			DRM_FORMAT_BGRA8888,
   361			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(8),
   362			R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
   363		}, {
   364			DRM_FORMAT_BGRX8888,
   365			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   366			R_SHIFT(8)  | G_SHIFT(16) | B_SHIFT(24) | A_SHIFT(0),
   367		}, {
   368			DRM_FORMAT_RGB888,
   369			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   370			R_SHIFT(16) | G_SHIFT(8)  | B_SHIFT(0)  | A_SHIFT(0),
   371		}, {
   372			DRM_FORMAT_BGR888,
   373			R_BITS(8)   | G_BITS(8)   | B_BITS(8)   | A_BITS(0),
   374			R_SHIFT(0)  | G_SHIFT(8)  | B_SHIFT(16) | A_SHIFT(0),
   375		}, {
   376			DRM_FORMAT_RGB565,
   377			R_BITS(5)   | G_BITS(6)   | B_BITS(5)   | A_BITS(0),
   378			R_SHIFT(11) | G_SHIFT(5)  | B_SHIFT(0)  | A_SHIFT(0),
   379		}, {
   380			DRM_FORMAT_YUYV,
   381			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   382			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(8)  | A_SHIFT(0),
   383		}, {
   384			DRM_FORMAT_UYVY,
   385			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   386			Y_SHIFT(8)  | U_SHIFT(0)  | V_SHIFT(0)  | A_SHIFT(0),
   387		}, {
   388			DRM_FORMAT_NV12,
   389			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   390			Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
   391		}, {
   392			DRM_FORMAT_NV21,
   393			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   394			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
   395		}, {
   396			DRM_FORMAT_NV16,
   397			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   398			Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
   399		}, {
   400			DRM_FORMAT_NV61,
   401			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   402			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
   403		}, {
   404			DRM_FORMAT_NV24,
   405			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   406			Y_SHIFT(0)  | U_SHIFT(0)  | V_SHIFT(8)  | A_SHIFT(0),
   407		}, {
   408			DRM_FORMAT_NV42,
   409			Y_BITS(8)   | U_BITS(8)   | V_BITS(8)   | A_BITS(0),
   410			Y_SHIFT(0)  | U_SHIFT(8)  | V_SHIFT(0)  | A_SHIFT(0),
   411		},
   412	};
   413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
