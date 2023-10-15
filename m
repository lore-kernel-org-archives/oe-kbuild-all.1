Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2BD210A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ittF1vFF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697393683; x=1728929683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJUzFebsra0fulLaP6GyyLC1lv+yzFZb9U2xdak67M8=;
  b=ittF1vFFEgm1SrzoWq2fxclOYC+XOuxeSSjHPULYoTmbceCsl/A8ghYy
   6iNdwkG+5anVFpm71TPFU31Dsa++upVtsJ4PAlk3E6JfEAogkEZg5fi19
   l2krLry71C6GfxPGfcIVnJ42BPlR/x263TYwXPrx6M9zhNPKUJoMwVbnm
   6O8xE0cvX1onL1Dvv2dh9ptfmkcLOFOrPdxkrbk50Qdddh6jefZaxgEsI
   gDMske8ZTVzrs/LMjcstolaOlXtV2VM7ui0sJjz9yxl7MC05FqmKh+nL4
   wH3RCDb82TMDLwu4kQCRHga2PuahpoDQvo0CXp6nJsgoC8e8UxqvUJM43
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389268418"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389268418"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 11:14:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="755418097"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="755418097"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 15 Oct 2023 11:14:41 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs5dP-0007fX-1b;
	Sun, 15 Oct 2023 18:14:39 +0000
Date: Mon, 16 Oct 2023 02:14:39 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 6623/30000]
 drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h:46:10:
 fatal error: dpaa_integration_ext.h: No such file or directory
Message-ID: <202310160211.CPjRtDiL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 7dcadb8d9273dd1ce30f55e8b4489f7c195d44c7 [6623/30000] fsl_qbman: Framework for enabling Link status notification
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20231016/202310160211.CPjRtDiL-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160211.CPjRtDiL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160211.CPjRtDiL-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PCIE_MOBIVEIL_HOST
   Depends on [n]: PCI [=y] && PCI_MSI_IRQ_DOMAIN [=n]
   Selected by [y]:
   - PCIE_MOBIVEIL_PLAT [=y] && PCI [=y] && (ARCH_ZYNQMP || COMPILE_TEST [=y]) && OF [=y]


vim +46 drivers/net/ethernet/freescale/sdk_fman/src/inc/wrapper/lnxwrp_fsl_fman.h

60bb3db8cf5f62 Madalin Bucur 2017-05-10  42  
60bb3db8cf5f62 Madalin Bucur 2017-05-10  43  #include <linux/types.h>
60bb3db8cf5f62 Madalin Bucur 2017-05-10  44  #include <linux/device.h>   /* struct device */
60bb3db8cf5f62 Madalin Bucur 2017-05-10  45  #include <linux/fsl_qman.h> /* struct qman_fq */
60bb3db8cf5f62 Madalin Bucur 2017-05-10 @46  #include "dpaa_integration_ext.h"
60bb3db8cf5f62 Madalin Bucur 2017-05-10  47  #include "fm_port_ext.h"
60bb3db8cf5f62 Madalin Bucur 2017-05-10  48  #include "fm_mac_ext.h"
60bb3db8cf5f62 Madalin Bucur 2017-05-10  49  #include "fm_macsec_ext.h"
60bb3db8cf5f62 Madalin Bucur 2017-05-10  50  #include "fm_rtc_ext.h"
60bb3db8cf5f62 Madalin Bucur 2017-05-10  51  

:::::: The code at line 46 was first introduced by commit
:::::: 60bb3db8cf5f6273e826cae6c2c8c3940729f33f fmd: SDK DPAA 1.x FMan driver

:::::: TO: Madalin Bucur <madalin.bucur@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
