Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE1B2F53
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 14:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLaCkbYd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697381050; x=1728917050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M8jTDlQLOZ69/QqY8nWJiP8gcoHE0BC9aXH4Rxad06U=;
  b=GLaCkbYd34lVaerbEKinQZ4qK6CkeaZMGo4ru4n2bCVOMR+KPhMNUSZj
   be+YGgZGiRsWMQOsMRWtuH+2xWxnNVvqVk8S+fhmPqAZ+CIQMtVqxGjS7
   2Rd2zBzZAEfxf6d4NJfn4LzXX4hjXXdcbIlZkBxuAmL6EjcaYP7Wf5ncs
   F3D5tFtz+tg/wNCRrXPgjdeqDPhI4Gn8NOocQIZf5le29YJfyFZskAjIu
   TSKJ7RuANJkdbnrEasmZUc5aXM53bgeriWLb6y6ex9nbVgW9UFf6GILV5
   bSDcNmSgaWkIe67ZPXKhAch3BMWM0oVsqfHezsy2m3TXpJ7kRrvCBFy38
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="389253313"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="389253313"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 07:44:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879135241"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="879135241"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 15 Oct 2023 07:44:07 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qs2LR-0007V1-0q;
	Sun, 15 Oct 2023 14:43:54 +0000
Date: Sun, 15 Oct 2023 22:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 6623/30000]
 drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:506:23: error: type
 qualifiers ignored on function return type
Message-ID: <202310152204.uxCz8RVk-lkp@intel.com>
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
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231015/202310152204.uxCz8RVk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310152204.uxCz8RVk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310152204.uxCz8RVk-lkp@intel.com/

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
   In file included from drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth_common.h:40,
                    from drivers/staging/fsl_qbman/fsl_usdpaa.c:38:
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h: At top level:
>> drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:506:23: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     506 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h:512:23: error: type qualifiers ignored on function return type [-Werror=ignored-qualifiers]
     512 | static inline ssize_t __const __must_check __attribute__((nonnull))
         |                       ^~~~~~~
   drivers/staging/fsl_qbman/fsl_usdpaa.c:398:6: error: no previous prototype for 'dbci_portal' [-Werror=missing-prototypes]
     398 | void dbci_portal(void *addr)
         |      ^~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +506 drivers/net/ethernet/freescale/sdk_dpaa/dpaa_eth.h

7fab630ae39d23 Madalin Bucur 2017-05-10  505  
7fab630ae39d23 Madalin Bucur 2017-05-10 @506  static inline ssize_t __const __must_check __attribute__((nonnull))
7fab630ae39d23 Madalin Bucur 2017-05-10  507  dpa_fd_length(const struct qm_fd *fd)
7fab630ae39d23 Madalin Bucur 2017-05-10  508  {
7fab630ae39d23 Madalin Bucur 2017-05-10  509  	return fd->length20;
7fab630ae39d23 Madalin Bucur 2017-05-10  510  }
7fab630ae39d23 Madalin Bucur 2017-05-10  511  

:::::: The code at line 506 was first introduced by commit
:::::: 7fab630ae39d2305c71f6ae6311f240ff9348404 dpa: SDK DPAA 1.x Ethernet driver

:::::: TO: Madalin Bucur <madalin.bucur@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
