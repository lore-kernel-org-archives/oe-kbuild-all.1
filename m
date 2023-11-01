Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827BF2586
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Nov 2023 10:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFgwiOHn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698835297; x=1730371297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LgHUrWfnENnCqHxyc162QHTwgxxKLhXI76aQMIXMrwE=;
  b=SFgwiOHn6jG20Nk4Fcxs3WbvTfZEoWWPhODJbG2GGboXMxpV6VWcaO6B
   S2MLYLwyMn5tusSzh1oI+GR2v9WkDP8Yk6e7GCwMdpktAzbVumV1JtY/B
   eMEaZJ5mpj6svWdfEpYsYQeeeLetynG/D11pwdUckilvPFc0JSuVdMA4Y
   xuqGbOI6XbBoWHIdovpkDn+A1gPpL8hykEjo9CGqgTILGC9o4e8ar5Voi
   X2Lzlh8D8pZh7GPDKL8c6EbwwlygG+WZCsvluuh/YU3GNFqtKx0j/3V5v
   Pn9gBfG47ECGNVD44WQLq+GH1ZcR3ungmluOAdOJzGv6trmZrgZmF1WCD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1325283"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="1325283"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 03:41:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="831319183"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; 
   d="scan'208";a="831319183"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Nov 2023 03:41:35 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qy8fF-0000kW-1O;
	Wed, 01 Nov 2023 10:41:33 +0000
Date: Wed, 1 Nov 2023 18:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 4236/15770]
 drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h:46:10:
 fatal error: dpaa_integration_ext.h: No such file or directory
Message-ID: <202311011801.FEHaeBGU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   742924a05c8a6349d6d1fe67010a3c5ed54df884
commit: 9165a718346e5aee8fbb6dd1e67bbae271e1cfc9 [4236/15770] fsl_qbman: Framework for enabling Link status notification
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231101/202311011801.FEHaeBGU-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231101/202311011801.FEHaeBGU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311011801.FEHaeBGU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fsl_usdpaa.h:17,
                    from drivers/staging/fsl_qbman/dpa_sys.h:66,
                    from drivers/staging/fsl_qbman/fsl_usdpaa.c:28:
   include/linux/fsl_qman.h:415:1: error: alignment 1 of 'struct qm_eqcr_entry' is less than 8 [-Werror=packed-not-aligned]
     415 | } __packed;
         | ^
   include/linux/fsl_qman.h:469:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     469 |                 } __packed ern;
         |                 ^
   include/linux/fsl_qman.h:468:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     468 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:486:17: error: alignment 1 of 'struct <anonymous>' is less than 8 [-Werror=packed-not-aligned]
     486 |                 } __packed dcern;
         |                 ^
   include/linux/fsl_qman.h:485:38: error: 'fd' offset 15 in 'struct <anonymous>' isn't aligned to 8 [-Werror=packed-not-aligned]
     485 |                         struct qm_fd fd;
         |                                      ^~
   include/linux/fsl_qman.h:1679:1: error: alignment 1 of 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' is less than 8 [-Werror=packed-not-aligned]
    1679 | } __packed;
         | ^
   include/linux/fsl_qman.h:1677:22: error: 'fd' offset 14 in 'struct qm_mcr_ceetm_cq_peek_pop_xsfdrread' isn't aligned to 8 [-Werror=packed-not-aligned]
    1677 |         struct qm_fd fd;
         |                      ^~
   In file included from drivers/staging/fsl_qbman/fsl_usdpaa.c:31:
   drivers/staging/fsl_qbman/qman_low.h: In function 'qm_shutdown_fq':
   drivers/staging/fsl_qbman/qman_low.h:1291:29: error: variable 'dequeue_wq' set but not used [-Werror=unused-but-set-variable]
    1291 |                         u16 dequeue_wq = 0;
         |                             ^~~~~~~~~~
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/mac.h:40,
                    from drivers/staging/fsl_qbman/fsl_usdpaa.c:37:
   drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h: At top level:
>> drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h:46:10: fatal error: dpaa_integration_ext.h: No such file or directory
      46 | #include "dpaa_integration_ext.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.


vim +46 drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h

5e7f0440e084eb Madalin Bucur 2020-02-27  42  
5e7f0440e084eb Madalin Bucur 2020-02-27  43  #include <linux/types.h>
5e7f0440e084eb Madalin Bucur 2020-02-27  44  #include <linux/device.h>   /* struct device */
5e7f0440e084eb Madalin Bucur 2020-02-27  45  #include <linux/fsl_qman.h> /* struct qman_fq */
5e7f0440e084eb Madalin Bucur 2020-02-27 @46  #include "dpaa_integration_ext.h"
5e7f0440e084eb Madalin Bucur 2020-02-27  47  #include "fm_port_ext.h"
5e7f0440e084eb Madalin Bucur 2020-02-27  48  #include "fm_mac_ext.h"
5e7f0440e084eb Madalin Bucur 2020-02-27  49  #include "fm_macsec_ext.h"
5e7f0440e084eb Madalin Bucur 2020-02-27  50  #include "fm_rtc_ext.h"
5e7f0440e084eb Madalin Bucur 2020-02-27  51  

:::::: The code at line 46 was first introduced by commit
:::::: 5e7f0440e084eb6138f3922302bc9ec540cd1975 sdk_fman: add LSDK-19.09-V4.14 SDK DPAA FMan files

:::::: TO: Madalin Bucur <madalin.bucur@oss.nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
