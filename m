Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22418A92D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 22:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694556071; x=1726092071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dnu7PvtmWnbMJYtVVvzaAlAnMnasUEOqY2Ljgz4UkJ0=;
  b=UXQ8b/PDnnd13yRtKPXqeMcKBDVmizJjmo1k0BYjsIi2v8A7mytc03w9
   uv/pRm3PcutcRYEpZenaB7ztUhQJToNYRZCCn03uwboWCikHjEerHUPMV
   LhHTxu/f+Cu80Jt95kGX5B3k8B2yj7xBYWDViWTwVXOikhrJjOoQBlO8B
   ikYXyFRPh9uRtErlddNg9uumZU4xeF6eZ5w+HQ/CmRmIF+F8/xCN7DDae
   eaYQzysxN/XYAZDLs/kUkZzWHGmBMekeVBZD5TUbr90inWZdYJZ/ECiLI
   K+HseZQnXptbuQPxdexoiHRhdo4mJPish0mqnehjTd5IbL+WfMzgfLz06
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="377411249"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="377411249"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 15:00:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="778968785"
X-IronPort-AV: E=Sophos;i="6.02,141,1688454000"; 
   d="scan'208";a="778968785"
Received: from lkp-server02.sh.intel.com (HELO 47e905db7d2b) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 12 Sep 2023 15:00:46 -0700
Received: from kbuild by 47e905db7d2b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgBR5-0000KT-2t;
	Tue, 12 Sep 2023 22:00:43 +0000
Date: Wed, 13 Sep 2023 06:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 17381/25021]
 drivers/firmware/imx/ele_trng.c:83:5: error: redefinition of 'ele_trng_init'
Message-ID: <202309130549.e2P8C8sS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gaurav,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 56e8bd2d539324931b7fdf0689641bc6e1656efe [17381/25021] LF-7285-3: firmware: ele-trng: Add support for ELE HW Random Number Generator
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230913/202309130549.e2P8C8sS-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230913/202309130549.e2P8C8sS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309130549.e2P8C8sS-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/imx/ele_trng.c:47:5: warning: no previous prototype for 'ele_get_random' [-Wmissing-prototypes]
      47 | int ele_get_random(struct hwrng *rng, void *data, size_t len, bool wait)
         |     ^~~~~~~~~~~~~~
   drivers/firmware/imx/ele_trng.c: In function 'ele_get_random':
   drivers/firmware/imx/ele_trng.c:52:28: error: implicit declaration of function 'virt_to_phys'; did you mean 'virt_to_page'? [-Werror=implicit-function-declaration]
      52 |         phys_addr_t addr = virt_to_phys(data);
         |                            ^~~~~~~~~~~~
         |                            virt_to_page
   drivers/firmware/imx/ele_trng.c: At top level:
>> drivers/firmware/imx/ele_trng.c:83:5: error: redefinition of 'ele_trng_init'
      83 | int ele_trng_init(struct device *dev)
         |     ^~~~~~~~~~~~~
   In file included from drivers/firmware/imx/ele_trng.c:12:
   drivers/firmware/imx/ele_mu.h:146:19: note: previous definition of 'ele_trng_init' with type 'int(struct device *)'
     146 | static inline int ele_trng_init(struct device *dev)
         |                   ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for RPMSG_VIRTIO
   Depends on [n]: HAS_DMA [=n]
   Selected by [m]:
   - HAVE_IMX_RPMSG [=y] && IMX_MBOX [=m]
   WARNING: unmet direct dependencies detected for UIO
   Depends on [n]: MMU [=n]
   Selected by [m]:
   - FEC_UIO [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_FREESCALE [=y]


vim +/ele_trng_init +83 drivers/firmware/imx/ele_trng.c

    82	
  > 83	int ele_trng_init(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
