Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7A84A3B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Dec 2023 09:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k4WMMO7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703494908; x=1735030908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nxfBUXkOAA6amrGrcX38lQwvv8pbm/ROXF+dN1riek=;
  b=k4WMMO7ASYMNoqmPgaHlpiV+u6SX4oS/QY9N7xJM+ieNoLCABVjS5TSn
   y0OqFLYJatUawIj2yqmVFgffmmAs8VXULgv7YR1uZV/jfv8KuS/pAzAAY
   BXaETnVefonKN9sl7ozPTI89abzJvsf+/rw21qgXFsb/9l5Y3z/lB/zLp
   5hGtKo2qEOKFrhL3KxHzaCyvGiAPe5f1lhTRpcOhFKdyxpSJcavKZkXJx
   IwmxfcUrjPRXkMsDn0H+RWAkh/8wXdeb0UM9CJ64KeTeNb9a2dV1DYKea
   baMq7xgFaAbYca+lcSKvDsOoapnsuCbTSd2Lll7hg3owncaEVy6/B2ur+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="460605004"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="460605004"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 01:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="770918660"
X-IronPort-AV: E=Sophos;i="6.04,302,1695711600"; 
   d="scan'208";a="770918660"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 25 Dec 2023 01:01:46 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHgqG-000DAX-0o;
	Mon, 25 Dec 2023 09:01:44 +0000
Date: Mon, 25 Dec 2023 17:00:47 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.7-dango-lro 8169/8193]
 drivers/nvmem/layouts/adtran.c:120:27: error: assignment to 'int (*)(struct
 device *, struct nvmem_device *)' from incompatible pointer type 'int
 (*)(struct device *, struct nvmem_device *, struct nvmem_layout *)'
Message-ID: <202312251623.CXQJT8rt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.7-dango-lro
head:   b39b817662d8c3045fa590db65e61b059c7124cf
commit: e0ebb0ddabd5e21d055decc3d57bd5ebe2e4af18 [8169/8193] nvmem: add layout for Adtran devices
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20231225/202312251623.CXQJT8rt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231225/202312251623.CXQJT8rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312251623.CXQJT8rt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/layouts/adtran.c: In function 'adtran_probe':
>> drivers/nvmem/layouts/adtran.c:120:27: error: assignment to 'int (*)(struct device *, struct nvmem_device *)' from incompatible pointer type 'int (*)(struct device *, struct nvmem_device *, struct nvmem_layout *)' [-Werror=incompatible-pointer-types]
     120 |         layout->add_cells = adtran_add_cells;
         |                           ^
>> drivers/nvmem/layouts/adtran.c:121:23: error: incompatible types when assigning to type 'struct device' from type 'struct device *'
     121 |         layout->dev = &pdev->dev;
         |                       ^
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHY_MTK_PEXTP
   Depends on [n]: (ARCH_MEDIATEK || COMPILE_TEST [=y]) && OF [=y] && OF_ADDRESS [=n] && HAS_IOMEM [=y]
   Selected by [m]:
   - PCS_MTK_USXGMII [=m] && NETDEVICES [=y]


vim +120 drivers/nvmem/layouts/adtran.c

   111	
   112	static int adtran_probe(struct platform_device *pdev)
   113	{
   114		struct nvmem_layout *layout;
   115	
   116		layout = devm_kzalloc(&pdev->dev, sizeof(*layout), GFP_KERNEL);
   117		if (!layout)
   118			return -ENOMEM;
   119	
 > 120		layout->add_cells = adtran_add_cells;
 > 121		layout->dev = &pdev->dev;
   122	
   123		platform_set_drvdata(pdev, layout);
   124	
   125		return nvmem_layout_register(layout);
   126	}
   127	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
